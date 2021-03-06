$(document).ready(function(){

    function createanswer(){
        $('#create-answer').on('click', function(){
            var target = $(this);
            var answerContent = $('#answer-content');
            var isCorrect = $('.add-answer-correct');

            var contentError = $('.add-content-error');
            var correctError = $('.add-correct-error');
            var questionIdError = $('.add-questionid-error');

            var answerInput = {
                content: answerContent.val(),
                questionId: target.data('question-id'),
                correct: isCorrect.is(':checked')
            }

            $.ajax({
                type: 'POST',
                contentType: 'application/json',
                url: '/admin/question/create-answer',
                data: JSON.stringify(answerInput),
                dataType: 'json',
                success: function (data) {
                    if(data.status == 400)
                    {
                        $('#add-answer').addClass('show').css("display", "block")

                        contentError.text(data.dataResponse.content);
                        questionIdError.text(data.dataResponse.questionId);
                        correctError.text(data.dataResponse.correct)
                    }else if(data.status == 200)
                    {
                        location.reload()
                    }
                },error: function(x, h, j){
                    console.log(x)
                }
            })
        })
    }
    createanswer();

    function editAnswer(){
        $('.btn-edit-answer').on('click', function(){
            var target = $(this);
            var answerContent = $('#edit-answer-content');
            var answerId = target.data('answer-id');
            var isCorrect = $(".edit-answer-correct")

            var contentError = $('.edit-content-error');
            var correctError = $('.edit-correct-error');
            var questionIdError = $('.edit-questionid-error');

            $.ajax({
                type: 'GET',
                contentType: 'application/json',
                url: '/admin/question/answer/'+answerId,
                dataType: 'json',
                success: function (data) {
                    answerContent.val(data.dataResponse.content);
                    isCorrect.prop('checked', data.dataResponse.correct);

                    contentError.text("");
                    correctError.text("")
                    questionIdError.text("")
                },error: function(x, h, j){
                    console.log(x)
                }
            });

            $('#update-answer').on('click', function(){
                var answerInput = {
                    answerId: answerId,
                    content: answerContent.val(),
                    questionId: $(this).data('question-id'),
                    correct: isCorrect.is(':checked')
                }

                $.ajax({
                    type: 'POST',
                    contentType: 'application/json',
                    url: '/admin/question/update-answer',
                    data: JSON.stringify(answerInput),
                    dataType: 'json',
                    success: function (data) {
                        if(data.status == 400)
                        {
                            $('#edit-answer').addClass('show').css("display", "block")

                            contentError.text(data.dataResponse.content ? data.dataResponse.content : '');
                            questionIdError.text(data.dataResponse.questionId ? data.dataResponse.questionId : "");
                            correctError.text(data.dataResponse.correct ? data.dataResponse.correct : "")
                        }else if(data.status == 200)
                        {
                            location.reload()
                        }
                    },error: function(x, h, j){
                        console.log(x)
                    }
                })

            })
        })
    }
    editAnswer();
})