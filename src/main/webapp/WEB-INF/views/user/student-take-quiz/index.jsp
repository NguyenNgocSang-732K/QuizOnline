<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="Take Quiz">
	<jsp:attribute name="content">
		
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">
                                Home</a></li>
                        <li class="breadcrumb-item active">Quiz</li>
                    </ol>
                    <!-- <div class="card-group">
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="mb-0"><strong>25</strong></h4>
                                <small class="text-muted-light">TOTAL</small>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="text-success mb-0"><strong>3</strong></h4>
                                <small class="text-muted-light">CORECT</small>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="text-danger mb-0"><strong>5</strong></h4>
                                <small class="text-muted-light">WRONG</small>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="text-primary mb-0"><strong>17</strong></h4>
                                <small class="text-muted-light">LEFT</small>
                            </div>
                        </div>
                    </div> -->

                    <div class="card">
                        <div id="9" class="card-header bg-white">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <h4 class="mb-0">
									<strong>Question 1</strong>
								</h4>
                                </div>
                                <div class="media-body">
                                    <h4 class="card-title"> 1 + 1?
                                    </h4>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label
								class="custom-control custom-checkbox mb-0">
                                    <input type="checkbox"
								class="custom-control-input">
                                    <span
								class="custom-control-indicator"></span>
                                    <span
								class="custom-control-description">1</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label
								class="custom-control custom-checkbox mb-0">
                                    <input type="checkbox"
								class="custom-control-input">
                                    <span
								class="custom-control-indicator"></span>
                                    <span
								class="custom-control-description">2</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label
								class="custom-control custom-checkbox mb-0">
                                    <input type="checkbox"
								class="custom-control-input">
                                    <span
								class="custom-control-indicator"></span>
                                    <span
								class="custom-control-description">0</span>
                                </label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <!-- <a href="#" class="btn btn-white">Skip</a> -->
                            <a href="#"
							class="btn btn-white float-right">Next</a>
                            <!-- <a href="#" class="btn btn-success float-right">
                                Submit <i class="material-icons btn__icon--right">
                                    send</i></a> -->
                        </div>
                    </div>
                    <!-- <div class="card">
                        <div id="10" class="card-header bg-white">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <h4 class="mb-0"><strong>Câu 2</strong></h4>
                                </div>
                                <div class="media-body">
                                    <h4 class="card-title">
                                        Github command to deploy comits?
                                    </h4>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label class="custom-control custom-checkbox mb-0">
                                    <input type="checkbox" class="custom-control-input">
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">git push</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="custom-control custom-checkbox mb-0">
                                    <input type="checkbox" class="custom-control-input">
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">git commit -m &quot;message&quot;</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="custom-control custom-checkbox mb-0">
                                    <input type="checkbox" class="custom-control-input">
                                    <span class="custom-control-indicator"></span>
                                    <span class="custom-control-description">git pull</span>
                                </label>
                            </div>
                        </div>
                        
                    </div> -->
                </div>
            </div>
            <!-- Sidebar -->
            <div class="mdk-drawer js-mdk-drawer" data-align="end">
                <div class="mdk-drawer__content">
                    <div
					class="sidebar sidebar-right sidebar-light bg-white o-hidden">
                        <div class="sidebar-p-y"
						data-simplebar-force-enabled="true">
                            <div class="sidebar-heading">Time left</div>
                            <div class="countdown sidebar-p-x"
							data-value="4" data-unit="hour"></div>

                            <div class="sidebar-heading">Pending</div>

                            <ul class="list-group list-group-fit">
                                <li class="list-group-item active ">
                                    <a href="#3">
                                        <span class="media">
                                            <span class="media-left">
                                                <span
											class="btn btn-white btn-circle">#1</span>
                                            </span>
                                            <span
										class="media-body media-middle">
                                                Question 1?
                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-group-item ">
                                    <a href="#3">
                                        <span class="media">
                                            <span class="media-left">
                                                <span
											class="btn btn-white btn-circle">#2</span>
                                            </span>
                                            <span
										class="media-body media-middle">
                                                Question 2?
                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-group-item ">
                                    <a href="#3">
                                        <span class="media">
                                            <span class="media-left">
                                                <span
											class="btn btn-white btn-circle">#3</span>
                                            </span>
                                            <span
										class="media-body media-middle">
                                                Question 3?
                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-group-item ">
                                    <a href="#3">
                                        <span class="media">
                                            <span class="media-left">
                                                <span
											class="btn btn-white btn-circle">#4</span>
                                            </span>
                                            <span
										class="media-body media-middle">
                                                Question 4?
                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-group-item ">
                                    <a href="#3">
                                        <span class="media">
                                            <span class="media-left">
                                                <span
											class="btn btn-white btn-circle">#5</span>
                                            </span>
                                            <span
										class="media-body media-middle">
                                                Question 5?
                                            </span>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-group-item ">
                                    <a href="#3">
                                        <span class="media">
                                            <span class="media-left">
                                                <span
											class="btn btn-white btn-circle">#6</span>
                                            </span>
                                            <span
										class="media-body media-middle">
                                                Question 6?
                                            </span>
                                        </span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // END Sidebar -->
        </div>
		
	</jsp:attribute>
</template:_user>