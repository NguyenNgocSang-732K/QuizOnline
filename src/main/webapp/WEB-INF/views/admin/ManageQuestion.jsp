<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s-form"
           uri="http://www.springframework.org/tags/form" %>

<template:_admin title="Dashboard">
	<jsp:attribute name="content">
         <core:forEach items="${questionModels}" var="question">
                <tr>
                    <td>${question.id}</td>
                </tr>
            </core:forEach>

	</jsp:attribute>
</template:_admin>