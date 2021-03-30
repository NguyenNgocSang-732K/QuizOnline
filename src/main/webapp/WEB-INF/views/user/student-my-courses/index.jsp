<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="My Courses">
	<jsp:attribute name="content">
		
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">Home</a></li>
                        <li class="breadcrumb-item active">My Courses</li>
                    </ol>
                    <div class="page-heading text-md-right">
                        <!-- <div class="btn-group">
                            <a href="#" class="btn btn-white active"><i class="material-icons">list</i></a>
                            <a href="#" class="btn btn-white"><i class="material-icons">dashboard</i></a>
                        </div> -->
                    </div>
                    <div class="card-columns">
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">Title 1</a>
                                </h4>
                                <small class="text-muted">Lessons: 37 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-primary"
								role="progressbar" style="width: 92.5%" aria-valuenow="40"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white">
                                <a href=" ${pageContext.request.contextPath }/takeCourse/index ${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-primary btn-sm">Continue <i
								class="material-icons btn__icon--right">play_circle_outline</i></a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card__options">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-white btn-sm"><i class="material-icons">replay</i> </a>
                            </div>
                            <div class="card-header bg-white ">
                                <h4 class="card-title">
								<a href="#">Title 2</a>
							</h4>
                                <small class="text-muted">Lessons: 40 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-success"
								role="progressbar" style="width: 100%" aria-valuenow="100"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white ">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-success disabled btn-sm">Completed <i
								class="material-icons btn__icon--right">check</i></a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">Title 3</a>
                                </h4>
                                <small class="text-muted">Lessons: 37 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-primary"
								role="progressbar" style="width: 92.5%" aria-valuenow="40"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-primary btn-sm">Continue <i
								class="material-icons btn__icon--right">play_circle_outline</i></a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card__options">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-white btn-sm"><i class="material-icons">replay</i> </a>
                            </div>
                            <div class="card-header bg-white ">
                                <h4 class="card-title">
								<a href="#">Title 4</a>
							</h4>
                                <small class="text-muted">Lessons: 40 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-success"
								role="progressbar" style="width: 100%" aria-valuenow="100"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white ">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-success disabled btn-sm">Completed <i
								class="material-icons btn__icon--right">check</i></a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">Title 5</a>
                                </h4>
                                <small class="text-muted">Lessons: 37 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-primary"
								role="progressbar" style="width: 92.5%" aria-valuenow="40"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-primary btn-sm">Continue <i
								class="material-icons btn__icon--right">play_circle_outline</i></a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card__options">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-white btn-sm"><i class="material-icons">replay</i> </a>
                            </div>
                            <div class="card-header bg-white ">
                                <h4 class="card-title">
								<a href="#">Title 6</a>
							</h4>
                                <small class="text-muted">Lessons: 40 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-success"
								role="progressbar" style="width: 100%" aria-valuenow="100"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white ">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-success disabled btn-sm">Completed <i
								class="material-icons btn__icon--right">check</i></a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">Title 7</a>
                                </h4>
                                <small class="text-muted">Lessons: 37 of 40</small>
                            </div>
                            <div class="progress rounded-0">
                                <div
								class="progress-bar progress-bar-striped bg-primary"
								role="progressbar" style="width: 92.5%" aria-valuenow="40"
								aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="card-footer bg-white">
                                <a href="${pageContext.request.contextPath }/takeCourse/index"
								class="btn btn-primary btn-sm">Continue <i
								class="material-icons btn__icon--right">play_circle_outline</i></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>	
		
	</jsp:attribute>
</template:_user>