<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="com.constant.AnswerTypeEnum" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="ManageQuestion">
	<jsp:attribute name="content">

 <link rel="stylesheet"
       href="${pageContext.request.contextPath}/resources/admin/account/manageQuestion.css">
<div class="container">
    <div class="row">
        <div class="col">
            <div class="wrapper-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a
                            href="${pageContext.request.contextPath }/dashboard/index">Home</a>
                    </li>
                    <li class="breadcrumb-item"><a
                            href="${pageContext.request.contextPath }/admin/questions">Questions</a>
                    </li>
                    <li class="breadcrumb-item active">Edit</li>
                </ol>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h3>Edit Question</h3>
            <div class="page-title-underline"></div>
        </div>
    </div>
    <div class="row" id="edit-question-wrapper">
        <div class="col">
            <div class="card">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#first"
                           data-toggle="tab">Question</a>
                    </li>
                </ul>
                <div class="card-body tab-content">
                    <div class="tab-pane active">
                        <div class="wrapper-content">
                                <%--@elvariable id="question" type="za.co.myProject.UserFormObject"--%>
                            <s-form:form
                                    action="${pageContext.request.contextPath }/admin/question/update-Question"
                                    class="form-horizontal"
                                    method="POST" modelAttribute="question"
                                    enctype="multipart/form-data">
                                <div class="dp-row">
                                    <div class="input-title">Image</div>
                                    <div class="input-file">
                                        <div class="media">
                                            <core:choose>
                                                <core:when test="${not empty question.image}">
                                                    <div class="icon-block rounded display-image"
                                                         style="background-image: url(${pageContext.request.contextPath}/images/${question.image});background-size: cover">
                                                    </div>
                                                </core:when>
                                                <core:otherwise>
                                                    <i class="material-icons text-muted-light md-36">image</i>
                                                </core:otherwise>
                                            </core:choose>
                                            <div class="media-body media-middle">
                                                <label class="custom-file m-0">
                                                    <input type="file"
                                                           id="file_upload"
                                                           name="file_upload"/>
                                                    <span class="custom-file-control"></span>
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="dp-row">
                                    <div class="input-title">Content</div>
                                    <div class="input-value">
                                        <textarea class="form-control content" name="content">${(question.content)}</textarea>
                                        <s-form:errors path="content" cssClass="validate-error"></s-form:errors>
                                    </div>
                                </div>
                                <div class="dp-row">
                                    <div class="input-title">Level</div>
                                    <div class="input-value">
                                        <s-form:select path="levelModel.id"
                                                       class="form-select">
                                             <s-form:option value="${question.levelModel.id}"
                                                            label="${question.levelModel.name}"/>
                                            <core:forEach items="${levels}" var="level">
                                                <core:if test="${level.id != question.levelModel.id}">
                                                    <s-form:option
                                                            value="${level.id}"
                                                            label="${level.name}"/>
                                                </core:if>
                                            </core:forEach>
                                        </s-form:select>
                                    </div>
                                </div>
                                <div class="dp-row">
                                    <div class="input-title">Answers</div>
                                    <div class="input-value">
                                          <s-form:select path="answerType" cssClass="form-select">
                                                  <s-form:options items="${AnswerTypeEnum.values()}" itemValue="key"
                                                                  itemLabel="value"/>
                                          </s-form:select>
                                    </div>
                                </div>
                                <div class="dp-row">
                                    <div class="input-title">&nbsp;</div>
                                    <div class="input-value title-manage-answers">
                                        <b><i>
                                            <a href="${pageContext.request.contextPath}/admin/question/${question.id}/answers">
                                                Manage Answers
                                            </a>
                                        </i></b>
                                    </div>
                                </div>
                                <div class="dp-row">
                                    <div class="input-title">&nbsp;</div>
                                    <div class="input-value">
                                        <s-form:hidden path="id"/>
                                        <a role="button" class="btn btn-primary"
                                           href="${pageContext.request.contextPath}/admin/questions">Cancel</a>
                                        <button type="submit"
                                                class="btn btn-primary">Save Changes
                                        </button>
                                    </div>
                                </div>

                            </s-form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <core:if test="${updateStatus != null}">
        <script>
            const updateStatus = `${updateStatus}`;
        </script>
    </core:if>
</div>

	</jsp:attribute>
</template:_admin>