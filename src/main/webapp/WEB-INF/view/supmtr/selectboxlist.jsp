<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 주석!! -->
<!-- option 태그만있음 select id=leclist -->

			<option value="" >전체</option>
			<c:forEach items="${selectBoxList}" var="resultVO" varStatus="status">				
			<option value="${resultVO.lec_no}" >${resultVO.lec_name} </option>
			</c:forEach>									
				