<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<div class="modal fade" id="edit-answer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${title}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%--@elvariable id="answerInput" type="za.co.myProject.UserFormObject"--%>
                <s-form:form
                        action="${pageContext.request.contextPath}/admin/answer/addAnswer"
                        cssClass="form-horizontal"
                        method="post" modelAttribute="answerInput">
                    <div class="form-group">
                        <label for="answer-content" class="col-form-label">Content:</label>
                        <s-form:input path="content" cssClass="form-control" id="answer-content"/>
                    </div>
                    <div class="form-group">
                        <div class="form-check" id="wrapper-answer-iscorrect">
                            <label class="form-check-label" for="iscorrect-answer">IsCorrect</label>
                            <input type="checkbox" name="correct" class="form-check-input iscorrect-answer"
                                   id="iscorrect-answer">
                        </div>
                    </div>
                </s-form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Create Answer</button>
            </div>
        </div>
    </div>
</div>