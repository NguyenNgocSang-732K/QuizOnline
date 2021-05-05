<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>
<template:_admin title="Subject">
    <jsp:attribute name="content">
        <div class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath }/dashboard">
                                Home
                            </a>
                        </li>
                    <li class="breadcrumb-item active">${title }</li>
                </ol>
                <h3>${title }</h3>
                <div class="page-title-underline"></div>
                <div class="clearfix"></div>
                <div id="filter-wrapper">

                    <div class="row">
                        <core:forEach var="accountExam"
                                      items="${historyAccountExams }">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-header bg-white text-center">
                                        <h4 class="card-title">
                                            <a href="student-take-course.html">${accountExam.exam.code }</a>
                                        </h4>
                                    </div>
                                    <a href="student-take-course.html">
                                        <img src="${pageContext.request.contextPath}/images/${accountExam.exam.subject.image}"
                                             alt="Card image cap" style="width: 100%; height: 100px">
                                    </a>
                                    <div class="card-body">
                                    <table style="width: 100%; margin-left: 15px">
                                    	<tr> 
                                    		<td> <small class="text-muted">MARK:</small></td>
                                    		<td> <h5><span class="badge badge-primary">${accountExam.score }</span></h5></td>
                                    	</tr>
                                    	<tr> 
                                    		<td> <small class="text-muted">ANSWER CORRECT:</small></td>
                                    		<td> <h5><span class="badge badge-primary">${accountExam.answer_correct }</span></h5></td>
                                    	</tr>
                                    	<tr> 
                                    		<td> <small class="text-muted">WRONG:</small></td>
                                    		<td> <h5><span class="badge badge-primary">${accountExam.answer_uncorrect }</span></h5></td>
                                    	</tr>
                                    </table>
                                        <a href="${pageContext.request.contextPath}/student/HistoryExamDetail?accountExamId=${accountExam.id}" class="btn btn-primary btn-md btn-exam btn-start-exam" role="button" aria-pressed="true">Detail</a>
                                    </div>
                                </div>
                            </div>
                        </core:forEach>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</template:_admin>
<script src="${pageContext.request.contextPath}/resources/admin/account/manageSubject.js"></script>