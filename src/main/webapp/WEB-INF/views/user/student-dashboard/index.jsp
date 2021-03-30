<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="Dashboard">
	<jsp:attribute name="content">
		
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">
                                Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                    <div class="card card-stats-primary">
                        <div class="card-body">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <i
									class="material-icons text-muted-light">
                                        credit_card</i>
                                </div>
                                <div class="media-body">
                                    Đăng ký của bạn kết thúc vào <strong>ngày 25 tháng 2 năm 2015</strong>
                                </div>
                                <div class="media-right">
                                    <a class="btn btn-success"
									href="#">
                                        Upgrade</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="card-title">Các khoá học</h4>
                                            <p class="card-subtitle">Các khóa học gần đây của bạn</p>
                                        </div>
                                        <div class="media-right">
                                            <a
											class="btn btn-sm btn-primary" href="${pageContext.request.contextPath }/myCourses/index">
                                                Khoá của tôi</a>
                                        </div>
                                    </div>
                                </div>
                                <ul
								class="list-group list-group-fit mb-0">
                                    <li class="list-group-item">
                                        <div
										class="media align-items-center">
                                            <div class="media-body">
                                                <a
												href="${pageContext.request.contextPath }/takeCourse/index">
                                                    HTML cơ bản</a>
                                            </div>
                                            <div class="media-right">
                                                <div class="text-center">
                                                    <div class="mb-1">
                                                        <span
														class="badge badge-pill badge-primary">
                                                            25%</span>
                                                    </div>
                                                    <div
													class="progress" style="width: 100px;">
                                                        <div
														class="progress-bar bg-primary" role="progressbar"
														style="width: 25%" aria-valuenow="25" aria-valuemin="0"
														aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div
										class="media align-items-center">
                                            <div class="media-body">
                                                <a
												href="${pageContext.request.contextPath }/takeCourse/index${pageContext.request.contextPath }/takeCourse/index">
                                                    Từng bước với Angular</a>
                                            </div>
                                            <div class="media-right">
                                                <div class="text-center">
                                                    <div class="mb-1">
                                                        <span
														class="badge badge-pill badge-success">
                                                            100%</span>
                                                    </div>
                                                    <div
													class="progress" style="width: 100px;">
                                                        <div
														class="progress-bar bg-success" role="progressbar"
														style="width: 100%" aria-valuenow="100" aria-valuemin="0"
														aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div
										class="media align-items-center">
                                            <div class="media-body">
                                                <a
												href="${pageContext.request.contextPath }/takeCourse/index">
                                                    Nền tảng Bootstrap</a>
                                            </div>
                                            <div class="media-right">
                                                <div class="text-center">
                                                    <div class="mb-1">
                                                        <span
														class="badge badge-pill badge-warning">
                                                            80%</span>
                                                    </div>
                                                    <div
													class="progress" style="width: 100px;">
                                                        <div
														class="progress-bar bg-warning" role="progressbar"
														style="width: 80%" aria-valuenow="80" aria-valuemin="0"
														aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="card-title">Trắc nghiệm</h4>
                                            <p class="card-subtitle">Hiệu suất của bạn</p>
                                        </div>
                                        <div class="media-right">
                                            <a
											class="btn btn-sm btn-primary" href="#">
                                                Kết quả bài kiểm tra</a>
                                        </div>
                                    </div>
                                </div>
                                <ul
								class="list-group list-group-fit mb-0">
                                    <li class="list-group-item">
                                        <div
										class="media align-items-center">
                                            <div class="media-body">
                                                <a
												href="${pageContext.request.contextPath }/quizResults/index">
                                                    Title of quiz goes here?</a><br>
                                                <small>Course: <a
												href="${pageContext.request.contextPath }/takeCourse/index">
                                                        Basics of HTML</a></small>
                                            </div>
                                            <div
											class="media-right text-center">
                                                <h4 class="mb-0">5.8</h4>
                                                <span
												class="text-muted-light">
                                                    Good</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div
										class="media align-items-center">
                                            <div class="media-body">
                                                <a
												href="${pageContext.request.contextPath }/quizResults/index">
                                                    Directives &amp; Routing</a><br>
                                                <small>Course: <a
												href="${pageContext.request.contextPath }/takeCourse/index">
                                                        Angular in Steps</a></small>
                                            </div>
                                            <div
											class="media-right text-center">
                                                <h4
												class="mb-0 text-success">
                                                    9.8</h4>
                                                <span
												class="text-muted-light">
                                                    Great</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div
										class="media align-items-center">
                                            <div class="media-body">
                                                <a
												href="${pageContext.request.contextPath }/takeQuiz/index">
                                                    Responsive &amp; Retina</a><br>
                                                <small>Course: <a
												href="${pageContext.request.contextPath }/takeCourse/index">
                                                        Bootstrap Foundations</a></small>
                                            </div>
                                            <div
											class="media-right text-center">
                                                <h4
												class="mb-0 text-danger">2.8</h4>
                                                <span
												class="text-muted-light">
                                                    Failed</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title">Phần thưởng</h4>
                                    <p class="card-subtitle">Thành tựu mới nhất của bạn</p>
                                </div>
                                <div class="card-body text-center">
                                    <div
									class="btn btn-primary btn-circle">
									<i class="material-icons">
                                            thumb_up</i>
								</div>
                                    <div
									class="btn btn-danger btn-circle">
									<i class="material-icons">
                                            grade</i>
								</div>
                                    <div
									class="btn btn-success btn-circle">
									<i class="material-icons">
                                            bubble_chart</i>
								</div>
                                    <div
									class="btn btn-warning btn-circle">
									<i class="material-icons">
                                            keyboard_voice</i>
								</div>
                                    <div class="btn btn-info btn-circle">
									<i class="material-icons">
                                            event_available</i>
								</div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header bg-white">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="card-title">Hoạt động diễn đàn</h4>
                                            <p class="card-subtitle">Các chủ đề và nhận xét mới nhất trên diễn đàn</p>
                                        </div>
                                        <div class="media-right">
                                            <a
											class="btn btn-sm btn-primary" href="#"> <i
											class="material-icons">
                                                    keyboard_arrow_right</i></a>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-group list-group-fit">
                                    <li
									class="list-group-item forum-thread">
                                        <div
										class="media align-items-center">
                                            <div class="media-left">
                                                <div
												class="forum-icon-wrapper" id="forum-item-1">
                                                    <a
													href="#" class="forum-thread-icon">
                                                        <i
													class="material-icons">description</i>
                                                    </a>
                                                    <a
													href="#public-profile" class="forum-thread-user">
                                                        <img
													src="${pageContext.request.contextPath}/resources/user/assets/images/people/50/guy-7.jpg" alt="" width="20"
													class="rounded-circle">
                                                    </a>
                                                </div>
                                                <span
												class="mdk-tooltip js-mdk-tooltip" data-for="forum-item-1">
                                                    replied by Brian S.
                                                </span>
                                            </div>
                                            <div class="media-body">
                                                <a
												href="#">
                                                    Am I learning the right way?</a>
                                            </div>
                                            <div class="media-right">
                                                <div
												style="width: 80px; text-align: right;">
                                                    <small
													class="text-muted-light">
                                                        5 min ago</small>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li
									class="list-group-item forum-thread">
                                        <div
										class="media align-items-center">
                                            <div class="media-left">
                                                <div
												class="forum-icon-wrapper" id="forum-item-2">
                                                    <a
													href="#" class="forum-thread-icon">
                                                        <i
													class="material-icons">description</i>
                                                    </a>
                                                    <a
													href="#public-profile" class="forum-thread-user">
                                                        <img
													src="${pageContext.request.contextPath}/resources/user/assets/images/people/50/guy-4.jpg" alt="" width="20"
													class="rounded-circle">
                                                    </a>
                                                </div>
                                                <span
												class="mdk-tooltip js-mdk-tooltip" data-for="forum-item-2">
                                                    posted by Adrian D.
                                                </span>
                                            </div>
                                            <div class="media-body">
                                                <a
												href="#">
                                                    Can someone help me with the
                                                    basic Setup?</a>
                                            </div>
                                            <div class="media-right">
                                                <div
												style="width: 80px; text-align: right;">
                                                    <small
													class="text-muted-light">
                                                        5 min ago</small>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li
									class="list-group-item forum-thread">
                                        <div
										class="media align-items-center">
                                            <div class="media-left">
                                                <div
												class="forum-icon-wrapper" id="forum-item-3">
                                                    <a
													href="#" class="forum-thread-icon">
                                                        <i
													class="material-icons">description</i>
                                                        <img
													src="${pageContext.request.contextPath}/resources/user/assets/images/people/50/guy-2.jpg" alt="" width="20"
													class="forum-thread-user rounded-circle">
                                                    </a>
                                                </div>
                                                <span
												class="mdk-tooltip js-mdk-tooltip" data-for="forum-item-3">
                                                    replied by Michael D.
                                                </span>
                                            </div>
                                            <div class="media-body">
                                                <a
												href="#">
                                                    I think this is the right way?</a>
                                            </div>
                                            <div
											class="media-right text-right" style="min-width: 80px;">
                                                <small
												class="text-muted-light">
                                                    5 min ago</small>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		
	</jsp:attribute>
</template:_user>
