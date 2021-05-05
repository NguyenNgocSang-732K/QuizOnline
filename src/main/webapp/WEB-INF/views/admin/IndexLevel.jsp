<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@page import="com.constant.StatusEnum" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="ManageLevel">
    <jsp:attribute name="content">
        <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="student-dashboard.html">Home</a>
                    </li>
                    <li class="breadcrumb-item active">Manage Levels</li>
                </ol>

                <div class="row">
                    <div class="col-md-9"><h3>Manage Levels</h3></div>
                    <div class="col-md-3">
                        <a role="button" href="${pageContext.request.contextPath}/admin/level/create-level"
                           class="btn btn-success float-right" id="btnAdLevel">
                            CREATE &nbsp;&nbsp;<i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>

                <div class="page-title-underline"></div>
                <div class="clearfix"></div>

                <div id="table-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Priority Position</th>
                                        <th>Created Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <core:forEach items="${levelModels}"
                                                  var="level" varStatus="i">
                                            <tr>
                                                <td>${level.name}</td>
                                                <td>${level.stt}</td>
                                                <td>${level.createdDate}</td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input status-level" type="checkbox"
                                                               data-level-id="${level.id}"
                                                               id="status-level"
                                                            ${level.status ? "checked" : "" }>
                                                        <label class="form-check-label" for="status-level"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <a role="button"
                                                       href="${pageContext.request.contextPath}/admin/level/${level.id}"
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
    </jsp:attribute>
</template:_admin>