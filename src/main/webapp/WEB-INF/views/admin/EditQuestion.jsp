<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="ManageQuestion">
	<jsp:attribute name="content">

 <link rel="stylesheet"
       href="${pageContext.request.contextPath}/resources/admin/account/manageQuestion.css">
<div class="container" id="edit-question-wrapper">
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
    <div class="row">
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
                                    action="${pageContext.request.contextPath }/admin/updateQuestion"
                                    class="form-horizontal"
                                    method="POST" modelAttribute="question"
                                    enctype="multipart/form-data">
                                <div class="dp-row">
                                    <div class="input-title">Image</div>
                                    <div class="input-file">
                                        <div class="media">
                                            <div class="media-left">
                                                <div
                                                        class="icon-block rounded display-image"
                                                        style="background-image:url(${pageContext.request.contextPath}/images/LearnPlus.png);">
                                                    <i class="material-icons text-muted-light md-36">photo</i>
                                                </div>
                                            </div>
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
                                        <s-form:textarea path="content"
                                                         cssClass="form-control"
                                                         cols="53" rows="5"/>
                                    </div>
                                </div>
                                <div class="dp-row">
                                    <div class="input-title">Level</div>
                                    <div class="input-value">
                                        <s-form:select path="levelModel"
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
                            </s-form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

	</jsp:attribute>
</template:_admin>