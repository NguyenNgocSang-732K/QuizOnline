$(document).ready(function () {
    $('.status-student').on('change', function () {
        var target = $(this);
        var isChecked = target.is(':checked');
        var studentId = target.data('student-id')

        var studentModel = {
            status: isChecked ? 1 : 2,
            id: studentId
        };

        function processUpdate(){
            $.ajax({
                type: 'POST',
                contentType: 'application/json',
                url: '/admin/student/update-status',
                data: JSON.stringify(studentModel),
                dataType: 'json',
                success: function (data) {
                    if (data.status == 200) {
                        alert(data.dataResponse)
                    } else if (data.status == 404) {
                        var url = window.location.protocol + '//' + window.location.host + '/notfound'
                        window.location.assign(url);
                    }
                }
            })
        }

        if(isChecked){
            processUpdate();
        }else{
            var modalConfirm = confirm("Do you want to disable this Student?");

            if (modalConfirm == true){
                processUpdate();
            }else{
                target.prop('checked', true);
            }
        }
    })

})