<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="com.constant.AnswerTypeEnum" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="ManageLevel">
    <jsp:attribute name="content">

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/admin/account/manageQuestion.css">
        <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="wrapper-breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath }/dashboard/index">Home</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="${pageContext.request.contextPath }/admin/subjects">Levels</a>
                                </li>
                                <li class="breadcrumb-item active">${breadCrumb}</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h3>${breadCrumb}</h3>
                        <div class="page-title-underline"></div>
                    </div>
                </div>
                <div class="row" id="edit-question-wrapper">
                    <div class="col">
                        <div class="card">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#first"
                                       data-toggle="tab">Level</a>
                                </li>
                            </ul>
                            <div class="card-body tab-content">
                                <div class="tab-pane active">
                                    <div class="wrapper-content">
                                            <%--@elvariable id="levelInput" type="za.co.myProject.UserFormObject"--%>
                                        <s-form:form action="${pageContext.request.contextPath }/admin/level/process"
                                                     class="form-horizontal"
                                                     method="POST" modelAttribute="levelInput"
                                                     enctype="multipart/form-data">
                                            <div class="dp-row">
                                                <div class="input-title">Name</div>
                                                <div class="input-value">
                                                    <input type="text" class="form-control" name="name"
                                                           value="${levelInput.name}">
                                                    <s-form:errors path="name" cssClass="validate-error"></s-form:errors>
                                                </div>
                                            </div>
                                            <div class="dp-row">
                                                <div class="input-title">Priority position</div>
                                                <div class="input-value">
                                                    <input type="number" min="0" class="form-control" name="stt"
                                                           value="${levelInput.stt}">
                                                    <s-form:errors path="stt" cssClass="validate-error"></s-form:errors>
                                                </div>
                                            </div>

                                            <div class="dp-row">
                                                <div class="input-title">&nbsp;</div>
                                                <div class="input-value">
                                                    <s-form:hidden path="id"/>
                                                    <a role="button" class="btn btn-primary"
                                                       href="${pageContext.request.contextPath}/admin/levels">Cancel</a>
                                                    <button type="submit"
                                                            class="btn btn-primary">
                                                        Save Changes
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
            </div>
            <core:if test="${updateLevel != null}">
                <script>
                    const updateStatus = `${updateLevel}`;
                </script>
            </core:if>
        </div>
    </jsp:attribute>
</template:_admin>