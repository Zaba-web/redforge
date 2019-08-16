
$("#load-stats").on("click", function () {
    getTableData(null);
});

$(".get-stats").on("click",function(){
    getTableData($("#date").val());
    $("#visit-table-date").html($("#date").val());
});

function getTableData(date) {
    $("#livepar-container").html(" ");
    $.ajax({
        type: "POST",
        url: CLIENT_URL + "private/modules/stats.php",
        data: {
            key: "G_T",
            date: date
        },
        dataType: "html",
        success: function (response) {
            var dataRaw = response.split("-");
            var data = {
                views: dataRaw[0].split(";"),
                sessions: dataRaw[1].split(";"),
                visits: dataRaw[2].split(";"),
                hosts: dataRaw[3].split(";")
            };
            
            data.views[0] = "Перегляди";
            data.sessions[0] = "Сесії";
            data.visits[0] = "Відвідувачі";
            data.hosts[0] = "Хости";
            
            for(i=0;i<4;i++){
                $("#livepar-container").append("<tr>");
                data[Object.keys(data)[i]].forEach(function(element) {
                    $("#livepar-container").append("<td>"+element+"</td>");
                });
                $("#livepar-container").append("</tr>");
            }
        }
    });
}

function getChartData() {

    $.ajax({
        type: "POST",
        url: CLIENT_URL + "private/modules/stats.php",
        data: {
            key: "G_C",
            date: date
        },
        dataType: "html",
        success: function (response) {
            
            var dataRaw = response.split("-");
            var data = {
                dates: dataRaw[0].split(";"),
                views: dataRaw[1].split(";"),
                visits: dataRaw[2].split(";")
            };
            
            
            var ctx = document.getElementById('myChart').getContext('2d');
            var chart = new Chart(ctx, {

                type: 'bar',

                
                data: {
                    labels: data.dates,
                    datasets: [
                        {
                            label: 'Відвідувачі',
                            backgroundColor: 'rgb(0, 204, 102)',
                            data: data.visits
                        },
                        {
                            label: 'Перегляди',
                            backgroundColor: 'rgb(0, 0, 204)',
                            data: data.views
                        }
                    ]
                },

                
                options: {}
            });
            
            
        }
    });
}


Date.prototype.yyyymmdd = function() {
  var mm = this.getMonth() + 1; 
  var dd = this.getDate();

  return [this.getFullYear(),
          (mm>9 ? '' : '0') + mm,
          (dd>9 ? '' : '0') + dd
         ].join('-');
};

var date = new Date();
var todayDate = date.yyyymmdd();

$("#date").val(todayDate);
getTableData(todayDate);
getChartData();



