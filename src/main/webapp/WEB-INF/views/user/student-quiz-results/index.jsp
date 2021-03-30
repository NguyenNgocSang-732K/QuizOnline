<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_user title="Quiz Results">
	<jsp:attribute name="content">
		
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">Home</a></li>
                        <li class="breadcrumb-item active">Quiz Results</li>
                    </ol>
                    <div class="page-heading">
                        <div class="media">
                            <div class="media-left media-middle">
                                <img src="${pageContext.request.contextPath}/resources/user/assets/images/maths.jpg"
								alt="" width="80" class="rounded">
                            </div>
                            <div class="media-body media-middle">
                                <h4 class="mb-0">Title 1</h4>
                                <small class="text-muted">submited on 2nd Feb 2016</small>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Result</h4>
                        </div>
                        <div class="card-body media">
                            <div class="media-body media-middle">
                                <h4 class="mb-0">92.5</h4>
                                <span class="text-muted-light">Verry Good</span>
                            </div>
                            <div class="media-right media-middle">
                                <a href="${pageContext.request.contextPath }/takeQuiz/index"
								class="btn btn-primary">Restart <i
								class="material-icons btn__icon--right">refresh</i></a>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Questions</h4>
                        </div>
                        <ul class="list-group list-group-fit mb-0">
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted-light">1.</div>
                                    </div>
                                    <div class="media-body">Question 1</div>
                                    <div class="media-right">
									<span class="badge badge-success ">Correct</span>
								</div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted-light">2.</div>
                                    </div>
                                    <div class="media-body">Question 2</div>
                                    <div class="media-right">
									<span class="badge badge-success ">Correct</span>
								</div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted-light">3.</div>
                                    </div>
                                    <div class="media-body">Question 3</div>
                                    <div class="media-right">
									<span class="badge badge-success ">Correct</span>
								</div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted-light">4.</div>
                                    </div>
                                    <div class="media-body">Question 4</div>
                                    <div class="media-right">
									<span class="badge badge-danger ">Wrong</span>
								</div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted-light">5.</div>
                                    </div>
                                    <div class="media-body">Question 5</div>
                                    <div class="media-right">
									<span class="badge badge-primary ">Wrong</span>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="text-muted-light">6.</div>
                                    </div>
                                    <div class="media-body">Question 6</div>
                                    <div class="media-right">
									<span class="badge badge-success ">Correct</span>
								</div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
		
	</jsp:attribute>
</template:_user>