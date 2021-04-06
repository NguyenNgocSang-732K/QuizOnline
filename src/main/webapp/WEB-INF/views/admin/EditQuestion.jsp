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

        <h1>Edit Questions</h1>
        <div class="page-title-underline"></div>

        <div id="edit-question-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="wrapper-content">
                            <div class="wrapper-content-question dp-row">
                                <div class="input-title">Question Content</div>
                                <div class="input-value">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="wrapper-content-level dp-row">
                                <div class="input-title">Level</div>
                                <div class="input-value">
                                    <select name="" id="" class="form-select"></select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var currentPage = [[${questionModels.currentPage}]]
            var data = [[${questionModels.totalItems}]]
            var itemsOnPage = [[${questionModels.pageSize}]]
        </script>
	</jsp:attribute>
</template:_admin>