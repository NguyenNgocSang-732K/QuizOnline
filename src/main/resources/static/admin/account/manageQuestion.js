$(document).ready(function () {
    $('.content').richText({
        bold: true,
        italic: true,
        underline: true,
        leftAlign: true,
        centerAlign: true,
        rightAlign: true,
        justify: true,
        ol: false,
        ul: false,
        heading: false,
        fonts: true,
        fontList: ["Arial",
            "Arial Black",
            "Comic Sans MS",
            "Courier New",
            "Geneva",
            "Georgia",
            "Helvetica",
            "Impact",
            "Lucida Console",
            "Tahoma",
            "Times New Roman",
            "Verdana"
        ],
        fontColor: true,
        fontSize: true,
        imageUpload: false,
        fileUpload: false,
        urls: false,
        table: true,
        removeStyles: true,
        code: true,
    });

    $('.status-question').on('change', function () {
        var target = $(this);
        var isChecked = target.is(':checked');
        var questionId = target.data('question-id')

        var questionModel = {
            status: isChecked,
            id: questionId
        };

        function processUpdate(){
            $.ajax({
                type: 'POST',
                contentType: 'application/json',
                url: '/admin/question/update-status',
                data: JSON.stringify(questionModel),
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

        if(questionModel.status){
            processUpdate();
        }else{
            var modalConfirm = confirm("Do you want to disable this Question?");

            if (modalConfirm == true){
                processUpdate();
            }else{
                target.prop('checked', true);
            }
        }
    })

})