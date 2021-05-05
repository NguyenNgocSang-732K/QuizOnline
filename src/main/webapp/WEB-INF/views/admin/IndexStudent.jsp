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
                        <a href="student-dashboard.html">Home</a>
                    </li>
                    <li class="breadcrumb-item active">Manage Students</li>
                </ol>

                <div class="row">
                    <div class="col-md-9"><h3>Manage Students</h3></div>
                    <div class="col-md-3">
                        &nbsp;
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
                                       placeholder="Search by Username, Fullname, Email, Phone"
                                       size="4"
                                       value="${searchText == null ? '': searchText}" />
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
                                            <th>UserName</th>
                                            <th>Fullname</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <core:forEach items="${students.data}"
                                                      var="student" varStatus="i">
                                            <tr>
                                                <td>${student.username}</td>
                                                <td>${student.fullname}</td>
                                                <td>${student.email}</td>
                                                <td>${student.phone}</td>
                                                <td>${student.address}</td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input status-student" type="checkbox"
                                                               data-student-id="${student.id}"
                                                               id="status-student"
                                                            ${student.status == 1 ? "checked" : "" }>
                                                        <label class="form-check-label" for="status-student"></label>
                                                    </div>
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
        <core:if test="${students.data != null}">
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
                var currentPage = [[${ students.currentPage }]]
                var data = [[${ students.totalItems }]]
                var itemsOnPage = [[${ students.pageSize }]]
            </script>
        </core:if>
    </jsp:attribute>
</template:_admin>