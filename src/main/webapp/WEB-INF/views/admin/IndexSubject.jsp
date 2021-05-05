<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@page import="com.constant.StatusEnum" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="ManageSubject">
    <jsp:attribute name="content">

        <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <div class="container-fluid">

                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="student-dashboard.html">Home</a>
                    </li>
                    <li class="breadcrumb-item active">Manage Subjects</li>
                </ol>

                <div class="row">
                    <div class="col-md-9"><h3>Manage Subjects</h3></div>
                    <div class="col-md-3">
                        <a role="button" href="${pageContext.request.contextPath}/admin/subject/create-subject"
                           class="btn btn-success float-right" id="btnAddSubject">
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
                                       placeholder="Search by Name"
                                       size="4"
                                       value="${searchText == null ? '': searchText}"/>
                            </div>
                            <div class="col-2">
                                <button type="button"
                                        class="btn btn-primary float-right" style="width: 100%; height: 100%"
                                        id="btnSearchQuestion">
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
                                        <th>Name</th>
                                        <th>Photo</th>
                                        <th>Created Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <core:forEach items="${subjectModels.data}"
                                                  var="subject" varStatus="i">
                                            <tr>
                                                <td style="width: 20%">${subject.name}</td>
                                                <td>
                                                	<img src="${pageContext.request.contextPath}/images/${subject.image}" alt="" width="50" height="50">
                                                </td>
                                                <td>${subject.createdDate}</td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input status-subject" type="checkbox"
                                                               data-subject-id="${subject.id}"
                                                               id="status-subject"
                                                            ${subject.status ? "checked" : "" }>
                                                        <label class="form-check-label" for="status-subject"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <a role="button"
                                                       href="${pageContext.request.contextPath}/admin/subject/${subject.id}"
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
        <core:if test="${subjectModels.data != null}">
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
                var currentPage = [[${ subjectModels.currentPage }]]
                var data = [[${ subjectModels.totalItems }]]
                var itemsOnPage = [[${ subjectModels.pageSize }]]
            </script>
        </core:if>
    </jsp:attribute>
</template:_admin>