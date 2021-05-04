<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s-form"
	uri="http://www.springframework.org/tags/form"%>

<template:_admin title="Profile">
	<jsp:attribute name="content">
		<div
			class="mdk-drawer-layout__content mdk-drawer-layout__content--scrollable">
                <div class="container-fluid">

                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath }/dashboard/index">Home</a></li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>

                    <div class="card">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#first"
							data-toggle="tab">Account</a>
                            </li>
                        </ul>
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">
                                    <%--@elvariable id="profile" type="za.co.myProject.UserFormObject"--%>
                                <s-form:form
								action="${pageContext.request.contextPath }/profile"
								class="form-horizontal" method="POST" modelAttribute="profile"
								enctype="multipart/form-data">
								<s-form:hidden path="id" />
								<s-form:hidden path="isActive" />
								<s-form:hidden path="status" />
                                    <div class="form-group row">
                                        <label for="file_upload"
										class="col-sm-3 col-form-label">Avatar</label>
                                        <div class="col-sm-9">
                                            <div class="media">
                                                <div class="media-left">
                                                    <div
													class="icon-block rounded display-image"
													style="background-image:
                                                            url(${pageContext.request.contextPath}/images/${profile.photo}); background-size:cover;">
                                                       <core:if test="${empty profile.photo}">
                                                       <i class="material-icons text-muted-light md-36">photo</i>
                                                       </core:if>
                                                        
                                                    </div>
                                                </div>
                                                <div
												class="media-body media-middle">
                                                    <label
													class="custom-file m-0">
                                                      <input type="file"
													id="file_upload" name="file_upload" />
                                                        <span
													class="custom-file-control"></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="fullname"
										class="col-sm-3 col-form-label">Name</label>
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
													<s-form:input path="fullname" cssClass="form-control"
													placeholder="Name" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email"
										class="col-sm-3 col-form-label">Email</label>
                                        <div class="col-sm-6 col-md-6">
                                            <div class="input-group">
                                                <span
												class="input-group-addon">
                                                    <i
												class="material-icons md-18 text-muted">mail</i>
                                                </span>
                                                <s-form:input
												path="email" cssClass="form-control"
												placeholder="Email Address" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group row">
                                        <label for="email"
										class="col-sm-3 col-form-label">Phone</label>
                                        <div class="col-sm-6 col-md-6">
                                            <div class="input-group">
                                            <span
												class="input-group-addon">
                                                    <i
												class="material-icons md-18 text-muted">phone_iphone</i>
                                                </span>
                                               <s-form:input
												path="phone" cssClass="form-control"
												placeholder="Phone Number" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                     <div class="form-group row">
                                        <label for="email"
										class="col-sm-3 col-form-label">Address</label>
                                        <div class="col-sm-6 col-md-6">
                                            <div class="input-group">
                                              <span
												class="input-group-addon">
                                                    <i
												class="material-icons md-18 text-muted">home</i>
                                                </span>
                                               <s-form:input
												path="address" cssClass="form-control" placeholder="Address" />
                                            </div>
                                        </div>
                                    </div>
                                    

                                   <!--  <div class="form-group row">
                                        <label for="password"
										class="col-sm-3 col-form-label">Change Password</label>
                                        <div class="col-sm-6 col-md-4">
                                            <div class="input-group">
                                                <span
												class="input-group-addon" id="basic-addon3">
                                                    <i
												class="material-icons md-18 text-muted">lock</i>
                                                </span>
                                                <input type="text"
												class="form-control" placeholder="Enter new password">
                                            </div>
                                        </div>
                                    </div> -->
                                    <div class="form-group row">
                                        <div
										class="col-sm-8 offset-sm-3">
                                            <div class="media">
                                                <div class="media-left">
                                               <button type="submit"
													class="btn btn-primary">Save Changes</button>    
                                                </div>
                                                <!-- <div class="media-body media-middle pl-1">
                                                    <label class="custom-control custom-checkbox m-0">
                                                        <input type="checkbox" class="custom-control-input" checked>
                                                        <span class="custom-control-indicator"></span>
                                                        <span class="custom-control-description">Subscribe to
                                                            Newsletter</span>
                                                    </label>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </s-form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	
            
            
	</jsp:attribute>
</template:_admin>
<script
	src="${pageContext.request.contextPath}/resources/admin/account/profile.js"></script>