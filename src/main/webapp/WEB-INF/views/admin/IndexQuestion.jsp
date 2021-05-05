<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@page import="com.constant.StatusEnum" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="ManageQuestion">
    <jsp:attribute name="content">

        <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <div class="container-fluid">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath }/dashboard">Home</a>
                    </li>
                    <li class="breadcrumb-item active">
                    	<a href="${pageContext.request.contextPath }/admin/questions">Manage Question</a>
                    </li>
                </ol>

                <div class="row">
                    <div class="col-md-9"><h3>Manage Questions</h3></div>
                    <div class="col-md-3">
                        <a role="button" href="${pageContext.request.contextPath}/admin/question/create-question"
                           class="btn btn-success float-right" id="btnAddQuestion">
                            CREATE &nbsp;&nbsp;<i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>

                <div class="page-title-underline"></div>
                <div class="clearfix"></div>
                <div id="filter-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-10">
                                <input name="search" id="searchText"
                                       class="form-control"
                                       placeholder="Search by Content, Level"
                                       size="4"
                                       value="${searchText == null ? '': searchText}" />
                            </div>
                            <div class="col-2">
                                <button type="button"
                                        class="btn btn-primary float-right" style="width: 100%; height: 100%" id="btnSearchQuestion">
                                    <span class="material-icons">search</span>
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
                                            <th>Content</th>
                                            <th>Score</th>
                                            <th>Level</th>
                                            <th>Created Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <core:forEach items="${questionModels.data}"
                                                      var="question" varStatus="i">
                                            <tr>
                                                <td>${question.content}</td>
                                                <td>${question.score}</td>
                                                <td>${question.levelModel.name}</td>
                                                <td>${question.createdDate}</td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input status-question" type="checkbox"
                                                               data-question-id="${question.id}"
                                                               id="status-question"
                                                               ${question.status ? "checked" : "" }>
                                                        <label class="form-check-label" for="status-question"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <a role="button"
                                                       href="${pageContext.request.contextPath}/admin/question/${question.id}"
                                                       class="btn btn-primary">
                                                        <span class="material-icons">edit</span>
                                                    </a>
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
                var currentPage = [[${ questionModels.currentPage }]]
                var data = [[${ questionModels.totalItems }]]
                var itemsOnPage = [[${ questionModels.pageSize }]]
            </script>
        </core:if>
    </jsp:attribute>
</template:_admin>