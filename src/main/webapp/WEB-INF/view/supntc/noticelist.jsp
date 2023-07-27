<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공지사항</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 페이징 설정
	var pageSize = 10;  
	var pageBlockSize = 5;    
	
	$(function() {
		// 버튼 이벤트 등록
		ButtonClickEvent();
		
		noticeList();
		
	});

	function ButtonClickEvent() {
		$('a[id=closePop]').click(function(e) {
			e.preventDefault();
			
			var closeId = $(this).attr('id');
			
			switch(closeId) {
			case 'closePop' :
				noticeList();
				break;
			}
		});
		
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); 

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					noticeList();
					break;
				case 'btnSave' : 
					fn_save();
					break;
				case 'btnUpdate' :
					$("#action").val("U");
					fn_save();
					break; 
				case 'btnDelete' :
					$("#action").val("D");	
					fn_save();
					break;	
				case 'btnClose' :
					gfCloseModal();
					noticeList();
					break;
			}
		});
	}
	
	// 게시글 화면 기능(페이지 당)
	function noticeList(pagenum) {
		
		pagenum = pagenum || 1;
		
			var param = { // parameter 값
			  searchKey : $("#searchKey").val()
			  , sname : $("#sname").val()
			  , pageSize : pageSize
			  , pageBlockSize : pageBlockSize
			  , pagenum : pagenum
			}
		
		var listcollabck = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listnotice").empty().append(returnvalue);
			
			var  totalCnt = $("#totalCnt").val();
			
			console.log("totalCnt : " + totalCnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalCnt, pageSize, pageBlockSize, 'noticeList');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#noticePagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);
		}
		
		callAjax("/supntc/noticelist.do", "post", "text", false, param, listcollabck) ;
			
	}
	
	function fn_openpopup() {
		
		popupinit();
		
		// 모달 팝업
		gfModalPop("#layer1");
		
	}
	
	function popupinit(object) {
		
		if(object == "" || object == null || object == undefined) {
			$("#nt_no").val("");
			$("#nt_title").val("");		
			$("#nt_contents").val("");
		 	$("#nt_contents").attr("readonly",false);
 			$("#noti_date").text("");
			$("#noti_writer").text("");
			$("#noti_cnt").text("");
			
			$("#btnSave").show();
			$("#btnUpdate").hide();
			$("#btnDelete").hide();
			
			$("#action").val("I");	
		} else {
			$("#nt_no").val(object.nt_no);
			$("#nt_title").val(object.nt_title);		
			$("#nt_contents").val(object.nt_contents); 
			if("${sessionScope.userType}" === "M") {
				$("#nt_title").attr("readonly", false);
				$("#nt_contents").attr("readonly", false);
			} else {
				$("#nt_title").attr("readonly", true);
				$("#nt_contents").attr("readonly", true);
			}
			
			$("#nt_title").val(object.nt_title);		
			$("#noti_no").text(object.nt_no);
			$("#noti_writer").text(object.enr_user);
			$("#noti_date").text(object.enr_date);
			$("#noti_cnt").text(object.nt_cnt);
			
			$("#btnSave").hide();
			$("#btnUpdate").show();
			$("#btnDelete").show();
			
			$("#action").val("U");	
		}
	}
	
	// 상세 조회
	function fn_selectone(no) {
		
		var param = {
				nt_no : no
		}
		
		var selectoncallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
			
			popupinit(returndata.noticesearch);
			
			// 모달 팝업
			gfModalPop("#layer1");
			
		}
			callAjax("/supntc/noticeselectone.do", "post", "json", false, param, selectoncallback) ;

	}
	
	// 글 등록
	function fn_save() {
		
		if ( ! fn_Validate() ) {
			return;
		}
		
		var param = {
				action : $("#action").val(), 
				nt_no : $("#nt_no").val(), //글 번호
				nt_title : $("#nt_title").val(), //글 제목
				nt_contents : $("#nt_contents").val(), //글 내용
				enr_user : '${loginId}'
		}
		console.log("fn_save_param" + JSON.stringify(param));
		var savecollback = function(reval) {
			console.log( JSON.stringify(reval) );
			
			if(reval.returnval > 0) {
				alert("수행 되었습니다.");
				gfCloseModal();
				
				if($("#action").val() == "U") {
					noticeList($("#pageno").val());
				} else {
					noticeList();
				}
				
			}  else {
				alert("오류가 발생 되었습니다.");				
			}
			
		}
		
		callAjax("/supntc/noticesave.do", "post", "json", false, param , savecollback) ; //serialize() : data를 영구 저장할 때 사용. ex) session
		
	}
	
	// 유효성 검사
	function fn_Validate() {

		var chk = checkNotEmpty(
				[
						[ "nt_title", "제목을 입력해 주세요." ]
					,	[ "nt_contents", "내용을 입력해 주세요" ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}

</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="action"  name="action"  />
	<input type="hidden" id="nt_no"  name="nt_no"  />
	<input type="hidden" id="pageno"  name="pageno"  />
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
				 <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">학습지원</span> <span class="btn_nav bold">공지사항
								</span> <a href="../system/comnCodMgr.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>관리자 공지사항</span> <span class="fr">  
							 <select id="searchKey" name="searchKey" style="width: 150px;" >
							        <option value="" >제목 + 내용</option>
									<option value="title" >제목</option>
									<option value="cont" >내용</option>
							</select> 
							<input type="text" style="width: 300px; height: 25px;" id="sname" name="sname">
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검  색</span></a>
			                <c:if test="${sessionScope.userType eq 'M'}">
								 <a class="btnType blue" href="javascript:fn_openpopup();" name="modal" ><span>작성</span></a>
							</c:if>
							</span>
						</p>
						
						<div class="noticeList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%">
									<col width="40%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody id="listnotice"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="noticePagination"> </div>&nbsp;
						 
					</div> 

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
		<c:if test="${sessionScope.userType == 'T' || sessionScope.userType == 'S' }">
			<dt>
				<strong>공지사항</strong>
			</dt>
		</c:if>
		<c:if test="${sessionScope.userType == 'M' }">
			<dt>
				<strong>공지사항 등록하기</strong>
			</dt>
		</c:if>		
			<dd class="content">
				<table class="row">
					<colgroup>
                                 <col width="70px">
                                 <col width="*">
                                 <col width="70px">
                                 <col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td colspan="4"><input type="text" class="inputTxt p100" name="nt_title" id="nt_title" /></td>
						</tr>
						
						<tr>
							<th scope="row">작성자</th>
							<td id="noti_writer"></td>
							<th scope="row">조회수</th>
							<td id="noti_cnt"></td>
						</tr>
						
						<tr>
								<th scope="row">등록일</th>
							<td colspan="4"  id="noti_date"></td>
						</tr>
						
						<tr>
							<th scope="row">내용</th>
							<td colspan="4"  style="text-align: left;">
							    <textarea id="nt_contents" name="nt_contents" ></textarea>
							</td>
						</tr>
						
					</tbody>
				</table>

				<div class="btn_areaC mt30">
				 <c:if test="${sessionScope.userType eq 'M'}">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>작성</span></a>
					<a href="" class="btnType blue" id="btnUpdate" name="btn"><span>수정</span></a>
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a>
				</c:if>	 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop" id="closePop"><span class="hidden">닫기</span></a>
	</div>

</form>
</body>
</html>