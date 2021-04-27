$(document).ready(function(){
    $('#myModal').modal({
        focus: true,
    })

    $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)
    })

    $('#create-answer').on('click', function(){
        var target = $(this);
        var answerContent = $('#answer-content');
        var contentError = $('.answer-content-error');
        var isCorrect = $('#iscorrect-answer');

        var answerInput = {
            content: answerContent.val(),
            correct: isCorrect.is(':checked'),
            questionId: target.data('question-id')
        }

        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            url: '/admin/question/create-answer',
            data: JSON.stringify(answerInput),
            dataType: 'json',
            success: function (data) {
                console.log(data)
            }
        })
    })

    if(showModal != ""){
        $('#add-answer').addClass('show').css("display", "block")
    }
})