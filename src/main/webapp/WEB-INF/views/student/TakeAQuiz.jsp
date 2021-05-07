<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>
<template:_admin title="Subject">
	<jsp:attribute name="content">
        <div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
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
				<h5 style="color: red">${error?msg:'' }</h5>
                    <div class="row">
                        <core:forEach var="subject" items="${subjects }">
                            <div class="col-md-4">
                                <div class="card">
                                    <div
										class="card-header bg-white text-center">
                                        <h4 class="card-title">
                                            <a
												href="student-take-course.html">${subject.name }</a>
                                        </h4>
                                    </div>
                                    <a href="student-take-course.html">
                                        <img
										src="${pageContext.request.contextPath}/images/${subject.image }"
										alt="Card image cap" style="width: 100%; height: 200px">
                                    </a>
                                    <div class="card-body">
                                        <!-- <small class="text-muted">ADVANCED</small>
                                        <span
											class="badge badge-primary ">GULP</span>
                                        <span
											class="badge badge-primary ">SLUSH</span>
                                        <br>
                                        <span
											class="text-justify float-right">Let’s start with a quick tour of Vue’s data binding features. If you are more interested in ...</span>
                                        <a href="#" class="text-right">Detail</a> -->
                                        <br>
                                        <button type="button"
											data-subject-id=${subject.id }
											class="btn btn-primary btn-exam btn-start-exam"
											data-toggle="modal" data-target=".bd-examp-modal-sm">
                                            <!-- <i class="material-icons btn__icon--left">map</i> -->
                                            START
                                        </button>
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
<script
	src="${pageContext.request.contextPath}/resources/admin/account/manageSubject.js"></script>
<!-- Modal -->
<div class="modal fade bd-examp-modal-sm" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Choose level
					to start</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<core:forEach var="item" items="${levels }">
					<div class="form-group">
						<a type="button" class="btn ${item.color } btn-select-level"
							href="${pageContext.request.contextPath }/student/executeexam?level_id=${item.id }&subject_id=">${item.name }</a>
					</div>
				</core:forEach>
			</div>
		</div>
	</div>
</div>