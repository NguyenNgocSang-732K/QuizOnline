<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="Browse Courses">
	<jsp:attribute name="content">
		
		 <div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">Home</a></li>
                        <li class="breadcrumb-item active">Courses</li>
                    </ol>
                    <p class="btn-group float-md-right">
                        <!-- <a href="#" class="btn btn-white active"><i class="material-icons">list</i></a>
                        <a href="#" class="btn btn-white"><i class="material-icons">dashboard</i></a> -->
                    </p>
                    <!-- <div class="clearfix"></div> -->
                    <div class="card-columns">
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">MATHS</a>
							</h4>
                                <!-- <div class="rating">
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star</i>
                                    <i class="material-icons">star_border</i>
                                </div> -->
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/maths.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for math<br>
                                <!-- <span class="badge badge-primary ">VUEJS</span> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">PHYSICS</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/physics.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for physic<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">BIOLOGY</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/biology.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for biology<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">GEOGRAPHY</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/geography.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for geography<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">CIVIC EDUCATION</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img
							src="${pageContext.request.contextPath}/resources/user/assets/images/civic education.jpeg" alt="Card image cap"
							style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for civic education<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">LITERATURE</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/literature.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for literature<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">CHEMISTRY</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/chemistry.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for chemistry<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">HISTORY</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/history.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for civic history<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                        <div class="card">
                            <div
							class="card-header bg-white text-center">
                                <h4 class="card-title">
								<a href="${pageContext.request.contextPath }/takeCourse/index">ENGLISH</a>
							</h4>
                            </div>
                            <a href="${pageContext.request.contextPath }/takeCourse/index">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/english.jpg"
							alt="Card image cap" style="width: 100%;">
                            </a>
                            <div class="card-body">
                                <small class="text-muted">ADVANCED</small><br> All schools' national high school exam
                                preparation questions for civic english<br>
                                <!-- <small class="badge badge-primary ">GULP</small> -->
                            </div>
                        </div>
                    </div>

                    <!-- <nav class="text-center">
                        <ul class="pagination pagination-sm">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active">
                                <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav> -->

                </div>
            </div>
		
	</jsp:attribute>
</template:_user>