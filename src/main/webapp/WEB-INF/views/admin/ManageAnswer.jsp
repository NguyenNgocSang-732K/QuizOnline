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
                                    href="${pageContext.request.contextPath }/admin/question/${questionId}">Question ${questionId}</a>
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
                                    <%--@elvariable id="answers" type="za.co.myProject.UserFormObject"--%>
                                <s-form:form
                                        action="${pageContext.request.contextPath }/admin/updateQuestion"
                                        class="form-horizontal"
                                        method="POST" modelAttribute="answers"
                                        enctype="multipart/form-data">
                                    <div class="question-content"></div>
                                    <div class="content-answer"></div>
                                    <div class="answer-table">
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="text"/>
                                                </td>
                                                <td>
                                                    <input type="checkbox">
                                                </td>
                                                <td>
                                                    <input type="button" value="Edit">
                                                </td>
                                                <td>
                                                    <input type="button" value="Remove">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text"/>
                                                </td>
                                                <td>
                                                    <input type="checkbox">
                                                </td>
                                                <td>
                                                    <input type="button" value="Edit">
                                                </td>
                                                <td>
                                                    <input type="button" value="Remove">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </s-form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</jsp:attribute>
</template:_admin>