<?php 

	Class Grabber{
		
		private $auth_url = "https://www.liveinternet.ru/stat/";
		private $auth_data = array("url" => "", "password" => "", "keep_password" => "on");
		private $client_url;
		private $cookies_path;
		
		public function __construct($url, $password, $cookies_path = __DIR__."/cookie.txt"){
			$this->auth_data["url"] = $url;
			$this->auth_data["password"] = $password;
			$this->cookies_path = $cookies_path;
			$this->client_url = $this->auth_url.$url."/";
			$this->login();
		}
		
		private function login(){
			$curl = curl_init($this->auth_url);
			
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			
			curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($this->auth_data));
			curl_setopt($curl, CURLOPT_POST, true);
			
			curl_setopt($curl, CURLOPT_COOKIEJAR, $this->cookies_path);
			curl_setopt($curl, CURLOPT_COOKIEFILE, $this->cookies_path);
			
			
			$res = curl_exec($curl);
			curl_close($curl);
			return $res;

		}
		
		public function getData($param = null){
			
			$grab_url = $this->client_url;
			
			if($param != null){
				$grab_url .= $param;
			}
			
			$curl = curl_init($grab_url);
			
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_FOLLOWLOCATION, TRUE);
			
			curl_setopt($curl, CURLOPT_COOKIEJAR, $this->cookies_path);
			curl_setopt($curl, CURLOPT_COOKIEFILE, $this->cookies_path);
			
			
			$res = curl_exec($curl);
			curl_close($curl);
			return $res;
			
		}
		
	}
	
	abstract Class Parser{
		
		protected $document;
		
		function loadData($data){
			phpQuery::newDocument($data);
		}
		
		function unloadData(){
			phpQuery::unloadDocuments();
		}
		
		abstract function parseTable($row_name);
		
	}
	
	class MainParser extends Parser{
		
		private $data = array();
		
		public function parseTable($row_name){
			$this->data = array();
			for($i=1;$i<=5;$i++){
				$current_row = pq("table[cellpadding=3][bgcolor=#e8e8e8] tr:eq(".$row_name.") td:eq(".$i.")");
				$this->data[] = $current_row->text();
			}
			return $this->data;
		}
		
		function parseChart($data){
			
			$date_list = array();
			$views_list = array();
			$visit_list = array();
			
			$data = explode(" ",$data);
			for($i = 0; $i<count($data);$i++){
				
				$data_splitted = explode("	",$data[$i]);
				$data_splitted_next = explode("	",$data[$i+1]);
				
				$date = preg_split('/[^ a-zа-яё\d]/ui',$data_splitted[2]);
				$date = $date[1];
				
				$visit = preg_split('/[^ a-zа-яё\d]/ui',$data_splitted_next[2]);
				$visit = $visit[0];
				
				$date_list[] = $data_splitted_next[0]." ".$date;
				$views_list[] = $data_splitted_next[1];
				
				$visit_list[] = $visit;
			}
			
			return new Chart($date_list,$views_list,$visit_list);
			
		}
	}
	
	Class Chart{
		
		public $date_list = array();
		public $views_list = array();
		public $visit_list = array();
		
		function __construct($date_list,$views_list,$visit_list){
			$this->date_list = $date_list;
			$this->views_list = $views_list;
			$this->visit_list = $visit_list;
		}
		
	}





	
