<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="Take Course">
	<jsp:attribute name="content">
		
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">Home</a></li>
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/browseCourses/index">Courses</a></li>
                        <li class="breadcrumb-item active">The MVC architectural pattern</li>
                    </ol>
                    <h1 class="page-heading h2">Title 1</h1>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/maths.jpg"
								alt="Card image cap" style="width: 100%;">
                                <div class="card-body">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum dicta eius enim
                                    inventoreus optio ratione veritatis. Beatae deserunt illum ipsam magniima mollitia
                                    officiis quia tempora!
                                </div>
                            </div>

                            <!-- Lessons -->
                            <ul class="card list-group list-group-fit">
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">1.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Questions 1</a>
                                        </div>
                                        <div class="media-right">
                                            <small
											class="text-muted-light">1.0</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">2.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Questions 2</a>
                                        </div>
                                        <div class="media-right">
                                            <small
											class="text-muted-light">1.0</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">3.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Questions 3</a>
                                        </div>
                                        <div class="media-right">
                                            <small
											class="text-muted-light">1.0</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">4.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Questions 4</a>
                                        </div>
                                        <div class="media-right">
                                            <small
											class="text-muted-light">1.5</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">5.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Questions 5</a>
                                        </div>
                                        <div class="media-right">
                                            <small
											class="text-muted-light">1.5</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="media">
                                        <div class="media-left">
                                            <div class="text-muted">6.</div>
                                        </div>
                                        <div class="media-body">
                                            <a href="#">Questions 6</a>
                                        </div>
                                        <div class="media-right">
                                            <small
											class="text-muted-light">2.0</small>
                                        </div>
                                    </div>
                                </li>

                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <a href="#"
									class="btn btn-primary btn-block btn--col">
                                        <i class="material-icons">not_started</i> Start
                                    </a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div
										class="media-left media-middle">
                                            <img
											src="${pageContext.request.contextPath}/resources/user/assets/images/people/110/guy-6.jpg" alt="About Adrian"
											width="50" class="rounded-circle">
                                        </div>
                                        <div
										class="media-body media-middle">
                                            <h4 class="card-title">
											<a href="#">Phan Hữu Trí</a>
                                            </h4>
                                            <p class="card-subtitle">Instructor</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p>With 12 years of experience, Tri is the top performing teacher at Aptech. With
                                        the same enthusiasm, he has compiled a number of review questions as follows.
                                    </p>
                                    <a href="#" class="btn btn-default"><i
									class="fa fa-facebook"></i></a>
                                    <a href="#" class="btn btn-default"><i
									class="fa fa-twitter"></i></a>
                                    <a href="#" class="btn btn-default"><i
									class="fa fa-github"></i></a>
                                </div>
                            </div>

                            <div class="card">
                                <ul class="list-group list-group-fit">
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <i
												class="material-icons text-muted-light">schedule</i>
                                            </div>
                                            <div
											class="media-body media-middle">
                                                2 <small
												class="text-muted">hrs</small> &nbsp; 26 <small
												class="text-muted">min</small>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="media">
                                            <div class="media-left">
                                                <i
												class="material-icons text-muted-light">assessment</i>
                                            </div>
                                            <div
											class="media-body media-middle">Advance</div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <!-- <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Ratings</h4>
                                </div>
                                <div class="card-body">
                                    <div class="rating">
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star</i>
                                        <i class="material-icons">star_border</i>
                                    </div>
                                    <small class="text-muted">20 ratings</small>
                                </div>
                            </div> -->

                            <!-- <a href="student-help-center.html" class="btn btn-default btn-block">
                                <i class="material-icons btn__icon--left">help</i> Get Help
                            </a> -->
                        </div>
                    </div>

                </div>
            </div>
		
	</jsp:attribute>
</template:_user>