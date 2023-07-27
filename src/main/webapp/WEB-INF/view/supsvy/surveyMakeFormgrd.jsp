 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


							<!--for(1): 문항을 먼저 만들어주고   -->
							<c:if test="${totalcnt eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							
		             		<c:if test="${totalcnt > 0 }">
		             			<c:forEach items="${surveyFormList}" var="svy">
			             			<tr id="">
											<th scope="row" class="qst" id="qst${svy.sv_qst_no}" name="qst${svy.sv_qst_no}">Q${svy.sv_qst_no}. ${svy.qst_content}</th>
											<td colspan="6">
											    	<c:if test="${svy.qst_type eq '1' }">
											    		<c:if test="${svy.sv_qst_no eq '1' }">
											    		 	 <input style="" type="text" name="answer${svy.sv_qst_no}" id="answer${svy.sv_qst_no} - ${svyans.ex_num}" value="${svyans.ex_num}" placeholder="예) happyjob@gmail.com"  style="height:1.5rem;">${svyans.ex_content}<br>	
											    		</c:if> 
											    		<c:if test="${svy.sv_qst_no ne '1' }"> 
											    			<textarea style=""  name="answer${svy.sv_qst_no}" id="answer${svy.sv_qst_no} - ${svyans.ex_num}" value="${svyans.ex_num}" placeholder="자유롭게 기술하시기 바랍니다."  style="overflow:auto"></textarea>	 
											    		</c:if> 
											    	</c:if>
											    	
											    	
												    <c:if test="${svy.qst_type eq '2' }">
													<!-- for(2) 예시(라디오) 를 만들어주고   -->
		                                                <c:forEach items="${svy.exList}" var="svyans">                                                 
		                                                  <input type="radio" name="answer${svy.sv_qst_no}" id="answer${svy.sv_qst_no} - ${svyans.ex_num}" value="${svyans.ex_num}"> ${svyans.ex_content}<br>
		                                                </c:forEach>										    
												    </c:if>										
											</td>  
									</tr>
		             			</c:forEach>
		             		</c:if>
		             		
							  
							<input type="hidden" id="qtotalcnt" name="qtotalcnt" value ="${totalcnt}"/> 
							<input type="hidden" id="qtype" name="qtype" value ="${qtype}"/> 
							<input type="hidden" id="sv_no" name="sv_no" value ="${sv_no}"/> 
							
							