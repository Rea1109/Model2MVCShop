<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="com.model2.mvc.service.domain.*" %>


<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	
	
	
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        body {
	            padding-top : 70px;
	        }
    </style>
    
    <script type="text/javascript">
    
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( ".btn.btn-primary:contains('확인')" ).on("click" , function() {
				 
				self.location = "/purchase/listPurchase";
			});

		});	
    </script>
</head>

<body>

	
	<jsp:include page="/layout/toolbar.jsp" />
   	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">구매 신청서 확인</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">물품번호</label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.purchaseProd.prodNo}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.buyer.userId}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">구매 방법</label>
		    <div class="col-sm-4">
		      <span type="text" >
		      	<c:if test="${purchase.paymentOption == '1'}">현금구매</c:if>
				<c:if test="${purchase.paymentOption == '2'}">신용구매</c:if>
		      </span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">구매자 </label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.receiverName}</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.receiverPhone}</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">구매자 주소</label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.divyAddr}</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.divyRequest}</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label  class="col-sm-offset-1 col-sm-3 control-label">배송 희망일</label>
		    <div class="col-sm-4">
		      <span type="text" >${purchase.divyDate}</span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >확인</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>
</html>