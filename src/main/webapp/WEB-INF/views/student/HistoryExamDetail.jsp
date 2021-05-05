<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>
<template:_admin title="">
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
                        <li class="breadcrumb-item active">Quiz</li>
                    </ol>
                    <div class="card-group">
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="mb-0">
                                    <strong>${lstQuestion.size() }</strong>
                                </h4>
                                <small class="text-muted-light">TOTAL</small>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="text-success mb-0">
                                    <strong>${result.answer_correct }</strong>
                                </h4>
                                <small class="text-muted-light">CORECT</small>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="text-danger mb-0">
                                    <strong>${result.answer_uncorrect }</strong>
                                </h4>
                                <small class="text-muted-light">WRONG</small>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body text-center">
                                <h4 class="text-primary mb-0">
                                    <strong>${result.score }%</strong>
                                </h4>
                                <small class="text-muted-light">MARK</small>
                            </div>
                        </div>
                    </div>
                <core:set var="indexQuestion" value="0" />

                <form
					action="${pageContext.request.contextPath }/student/ExecuteExam"
					method="post" id="formExam">
                    <!-- Body exam -->
                    <input type="hidden" name="examId"
						value="${exam.id }" />
                    <core:forEach var="question" items="${lstQuestion }"
						varStatus="loop">
                        <%-- <input type="hidden" name="questions[${indexQuestion }].question_id" value="${question.id }" /> --%>
                        <div class="card">
                            <div id="10" class="card-header bg-white">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <h4 class="mb-0">
                                            <strong>Câu ${loop.index+1 }</strong>
                                        </h4>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="card-title">
                                            <core:out
												value="${question.content }" escapeXml="false"></core:out> (${question.score }đ)
                                        </h4>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <core:forEach var="answer"
									items="${question.answers }">
                                    <div class="form-group">
                                        <core:choose>
                                            <core:when
												test="${question.answerType==1}">
                                                <label
													class="custom-control custom-checkbox mb-0">
                                                    <input
													type="checkbox" ${answer.status==1?'checked':''} class="custom-control-input"
													name="questions_${question.id }" value="${answer.id}">
                                                    <span
													class="custom-control-indicator"></span>
                                                    <span
													class="custom-control-description ${answer.iscorrect?'isCorrect':''}">
                                                        <core:out
															value="${ answer.content}" escapeXml="false"></core:out>
                                                    </span>
                                                </label>
                                            </core:when>
                                            <core:when
												test="${question.answerType==2}">
                                                <label
													class="custom-control custom-radio mb-0">
                                                    <input type="radio" ${answer.status==1?'checked':''}
													class="custom-control-input"
													name="questions_${question.id }" value="${answer.id}">
                                                    <span
													class="custom-control-indicator"></span>
                                                    <span
													class="custom-control-description ${answer.iscorrect?'isCorrect':''}">
                                                        <core:out
															value="${ answer.content}" escapeXml="false"></core:out>
                                                    </span>
                                                </label>
                                            </core:when>

                                        </core:choose>
                                    </div>
                                </core:forEach>
                            </div>

                          <%--   <core:if
								test="${lstQuestion.size() == loop.index+1}">
                                <div class="card-footer">
                                    <button type="submit"
										class="btn btn-success float-right">
                                        Submit <i
											class="material-icons btn__icon--right">
                                            send
                                        </i>
                                    </button>
                                </div>
                            </core:if> --%>

                        </div>

                        <core:set var="indexQuestion"
							value="${indexQuestion+1 }" />
                    </core:forEach>
                    <!-- End Body exam -->
                </form>
            </div>
        </div>
    </jsp:attribute>
</template:_admin>
<!-- Required by countdown -->
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/vendor/moment.min.js"></script>
<!-- Easy Countdown -->
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/vendor/jquery.countdown.min.js"></script>
<!-- Init -->
<script
	src="${pageContext.request.contextPath}/resources/admin/assets/js/countdown.js"></script>
