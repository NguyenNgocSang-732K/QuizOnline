<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<div class="modal fade"
     id="add-answer" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${title}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="answer-content" class="col-form-label">Content:</label>
                    <input type="text" name="content" class="form-control" id="answer-content">
                    <span class="validate-error answer-content-error"></span>
                </div>
                <div class="form-group">
                    <div class="form-check" id="wrapper-answer-iscorrect">
                        <label class="form-check-label" name="isCorrect" for="iscorrect-answer">IsCorrect</label>
                        <input type="checkbox" id="iscorrect-answer" class="form-check-input iscorrect-answer">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" data-question-id="${question.id}" id="create-answer" class="btn btn-primary">Create Answer</button>
            </div>
        </div>
    </div>
</div>
<script>
    var showModal = '${showModal}';
</script>