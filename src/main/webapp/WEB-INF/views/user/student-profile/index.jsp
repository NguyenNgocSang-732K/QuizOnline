<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="Profile">
	<jsp:attribute name="content">
		
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">Home</a></li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                    <div class="text-center">
                        <p>
						<a href="#"><img src="${pageContext.request.contextPath}/resources/user/assets/images/people/110/guy-2.jpg"
							alt="" class="rounded-circle"></a>
                        </p>
                        <h1 class="h2 mb-0">Andrew Brain</h1>
                        <p class="lead text-muted mb-0">London, UK</p>
                        <p>
						<span class="badge badge-light ">STUDENT</span>
					</p>
                    </div>
                    <hr>
                    <div class="card-columns">
                        <div class="card">
                            <div class="card-header bg-white">
                                <div class="media">
                                    <div class="media-left">
                                        <img
										src="${pageContext.request.contextPath}/resources/user/assets/images/vuejs.png" alt="" class="rounded"
										width="100">
                                    </div>
                                    <div class="media-body media-middle">
                                        <h4 class="card-title">
										<a href="${pageContext.request.contextPath }/takeCourse/index">VueJs</a>
									</h4>
                                        <span
										class="badge badge-primary ">ADVANCED</span>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-group list-group-fit">
                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/viewCourse/index"><span
									class="float-right"><i class="material-icons md-18">check</i></span>Basics of Vue.js</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/viewCourse/index"><span
									class="float-right"><i class="material-icons md-18">check</i></span>Intermediate Vue.js</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/viewCourse/index"><span
									class="float-right"><i class="material-icons md-18">check</i></span>Realtime Apps with
                                        Vue.js</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <div class="card-header bg-white">
                                <div class="media">
                                    <div class="media-left">
                                        <img
										src="${pageContext.request.contextPath}/resources/user/assets/images/nodejs.png" alt="" class="rounded"
										width="100">
                                    </div>
                                    <div class="media-body media-middle">
                                        <h4 class="card-title">
										<a href="${pageContext.request.contextPath }/takeCourse/index">NodeJs</a>
									</h4>
                                        <span
										class="badge badge-success ">Beginner</span>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-group list-group-fit">
                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/takeCourse/index"><span
									class="float-right"><i class="material-icons md-18">check</i></span>Getting started with
                                        Node</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <div class="card-header bg-white">
                                <div class="media">
                                    <div class="media-left">
                                        <img
										src="${pageContext.request.contextPath}/resources/user/assets/images/github.png" alt="" class="rounded"
										width="100">
                                    </div>
                                    <div class="media-body media-middle">
                                        <h4 class="card-title">
										<a href="${pageContext.request.contextPath }/takeCourse/index">GitHub</a>
									</h4>
                                        <span
										class="badge badge-warning ">Intermediate</span>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-group list-group-fit">
                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/viewCourse/index"><span
									class="float-right"><i class="material-icons md-18">check</i></span>Github Step by Step</a>
                                </li>
                                <li class="list-group-item">
                                    <a href="${pageContext.request.contextPath }/viewCourse/index"><span
									class="float-right"><i class="material-icons md-18">check</i></span>Working as a Team with
                                        GitHub</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-6 offset-md-3 text-center">
                            <h4 class="mb-0">Rewards</h4>
                            <p class="text-muted ">Adrian's achievements</p>
                            <div class="btn btn-primary btn-circle">
							<i class="material-icons">thumb_up</i>
						</div>
                            <div class="btn btn-danger btn-circle">
							<i class="material-icons">grade</i>
						</div>
                            <div class="btn btn-success btn-circle">
							<i class="material-icons">bubble_chart</i>
						</div>
                            <div class="btn btn-warning btn-circle">
							<i class="material-icons">keyboard_voice</i>
						</div>
                            <div class="btn btn-info btn-circle">
							<i class="material-icons">event_available</i>
						</div>
                            <br> <br>
                        </div>
                    </div>

                </div>
            </div>
		
	</jsp:attribute>
</template:_user>