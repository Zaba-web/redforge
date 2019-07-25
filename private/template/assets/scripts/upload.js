$(document).ready(
        function (e) {
            var form = $('#myform');
            var message = $('#fileUploadErrors');
            form.on('submit', function () {
                var formData = new FormData();
                if (($('#myfile')[0].files).length != 0) {
                    $.each($('#myfile')[0].files, function (i, file) {
                        formData.append("file[" + i + "]", file);
                    });
                } else {
                    message.text('Потрібно обрати файли');
                    return false;
                }
                $.ajax({
                    type: "POST",
                    url: CLIENT_URL + "/private/performers/file_performer.php",
                    cache: false,
                    dataType: "json",
                    contentType: false,
                    processData: false,
                    data: formData,
                    beforeSend: function () {
                        console.log('Запит розпочався');
                        message.text('Запит розпочався');
                        form.find('input').prop("disabled", true);
                    },
                    success: function (data) {
                        if (data.status == 'ok') {
                            $('#myfile').val('');
                            message.text('Файли завантажено');
                        } else {
                            message.text('Помилка');
                        }
                    },
                    complete: function (data) {
                        console.log('Запит завершено');
                        form.find('input').prop("disabled", false);

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        console.log(thrownError);
                        message.html('Помилка');
                    }
                });
                return false;
            });
        }
);