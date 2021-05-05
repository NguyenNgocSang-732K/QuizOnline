<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.constant.StatusEnum"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>
<template:_admin title="ManageAnswers">
	<jsp:attribute name="content">
         <link rel="stylesheet"
               href="${pageContext.request.contextPath}/resources/admin/account/manageAnswer.css">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="wrapper-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath }/dashboard/index">Home</a>
                            </li>
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.request.contextPath }/admin/question/${question.id}">Question
                                    ${question.id}</a>
                            </li>
                            <li class="breadcrumb-item active">Answers</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <h3>Answers</h3>
                    <div class="page-title-underline"></div>
                </div>
            </div>
            <div class="row" id="wrapper-answers">
                <div class="card">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" href="#first"
                               data-toggle="tab">Answer</a>
                        </li>
                    </ul>
                    <div class="card-body tab-content">
                        <div class="tab-pane active">
                            <div class="wrapper-content">
                                <div class="question-content">
                                    <b>Question:</b>&nbsp; ${question.content}
                                </div>
                                <div class="wrapper-answer-table">
                                    <div class="wrapper-btnadd">
                                        <div class="note">
                                            <span>** ${note}</span>
                                        </div>
                                        <div class="btn-add">
                                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                                    data-target="#add-answer">
                                                Add &nbsp;
                                                <i class="fas fa-plus" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div>
                                        <table class="table answer-table">
                                            <thead>
                                            <tr>
                                                <th>Content</th>
                                                <th>IsCorrect</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <core:forEach items="${answers}" var="answer">
                                                    <tr>
                                                        <td>${answer.content}</td>
                                                        <td>
                                                            <core:if test="${answer.iscorrect}">
                                                                <i class="fas fa-check-circle icon-answer-correct"></i>
                                                            </core:if>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-warning btn-edit-answer" type="button"
                                                                    data-toggle="modal"
                                                                    data-target="#edit-answer" data-answer-id="${answer.id}"
                                                            >
                                                                <i class="fas fa-edit"></i>
                                                            </button>
                                                            <button class="btn btn-danger btn-remove-answer" type="button"
                                                                    data-question-id="${question.id}"
                                                                    data-answer-id="${answer.id}">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </core:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="wrapper-btnCancel card-body">
                        <a role="button" class="btn btn-primary"
                           href="${pageContext.request.contextPath}/admin/question/${question.id}">Back</a>
                    </div>
                </div>
            </div>
        </div>

	</jsp:attribute>
</template:_admin>