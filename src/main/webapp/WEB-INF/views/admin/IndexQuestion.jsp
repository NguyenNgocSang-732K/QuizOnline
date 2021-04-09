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

        <h1>Questions</h1>
        <div class="page-title-underline"></div>
        <div id="filter-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-8">
                    </div>
                    <div class="col-3">
                        <input name="search" id="searchText"
                               class="form-control"
                               placeholder="Search by Content, Level"
                               size="4"
                               value="${searchText == null ? "": searchText}"/>
                    </div>
                    <div class="col-1">
                        <button type="button"
                                class="btn btn-primary" id="btnSearchQuestion"><span
                                class="material-icons">search</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div id="table-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <table class="table">
                            <thead>
                            <tr>
                                    <%--                                <th>#</th>--%>
                                <th>Content</th>
                                <th>Level</th>
                                <th>Created Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%--                            <core:set var="index" value="0"></core:set>--%>
                            <core:forEach items="${questionModels.data}"
                                          var="question" varStatus="i">
<%--                                <core:set var="index" value="${i.index+1}"></core:set>--%>
                                <tr>
                                        <%--                                           <td>${index}</td>--%>
                                    <td>${question.content}</td>
                                    <td>${question.levelModel.name}</td>
                                    <td>${question.createdDate}</td>
                                    <td>
                                        <div class="mdc-switch mdc-switch--checked">
                                            <div class="mdc-switch__track"></div>
                                            <div class="mdc-switch__thumb-underlay">
                                                <div class="mdc-switch__thumb"></div>
                                                <input type="checkbox"
                                                       id="another-basic-switch"
                                                       class="mdc-switch__native-control"
                                                       role="switch"
                                                       aria-checked="true"
                                                       checked>
                                            </div>
                                        </div>
                                        <label for="another-basic-switch">off/on</label>
                                    </td>
                                    <td>
                                        <a role="button"
                                           href="${pageContext.request.contextPath}/admin/question/${question.id}"
                                           class="btn btn-warning"><span
                                                class="material-icons">edit</span></a>
                                    </td>
                                </tr>
                            </core:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    <core:if test="${questionModels.data != null}">
        <div class="pagination-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div id="pagination"></div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var currentPage = [[${questionModels.currentPage}]]
            var data = [[${questionModels.totalItems}]]
            var itemsOnPage = [[${questionModels.pageSize}]]
        </script>
    </core:if>
	</jsp:attribute>
</template:_admin>