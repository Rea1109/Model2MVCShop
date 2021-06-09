<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


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
    
	    $(function () {
	        $("#divyDate").datepicker({ dateFormat: "yy-mm-dd"});
	    });
	    
		function fncAddPurchase(){
			
			var receiverName = $("input[name='receiverName']").val();
			var receiverPhone = $("input[name='receiverPhone']").val();
			var divyDate = $("input[name='divyDate']").val();
			var divyAddr = $("input[name='divyAddr']").val();
		
			if(receiverName == null || receiverName.length<1){
				alert("구매자 이름은 반드시 입력하여야 합니다.");
				return;
			}
			if(receiverPhone == null || receiverPhone.length<1){
				alert("구매자 번호는 반드시 입력하여야 합니다.");
				return;
			}
			if(divyDate == null || divyDate.length<1){
				alert("배송일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(divyAddr == null || divyAddr.length<1){
				alert("주소는 반드시 입력하셔야 합니다.");
				return;
			}
			
			alert("구매신청 완료");
			
			$("form").attr("method","POST").attr("action","/purchase/addPurchase?prodNo=${product.prodNo}&buyerId=${user.userId}").submit();
		
		}
		
		function resetData(){
			
			alert("구매신청을 취소 합니다");
			$("form").attr("method","POST").attr("action","/product/listProduct?menu=search").submit();
		}
		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( ".btn.btn-primary:contains('구매')" ).on("click" , function() {
				 
				fncAddPurchase();
			});
			
			 $( ".btn.btn-primary.btn:contains('취소')" ).on("click" , function() {
				 
				 resetData();
			});
		});	
    </script>
</head>

<body>

	
	<jsp:include page="/layout/toolbar.jsp" />
   	

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">구매 신청서 </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품 번호</label>
		    <div class="col-sm-4">
		      <span type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}">${product.prodNo}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">상품 가격</label>
		    <div class="col-sm-4">
		      <span type="text" class="form-control" >
		      	${product.price}<i class="glyphicon glyphicon-usd"></i>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		      <span type="text" class="form-control" id="buyerId" name="buyerId" value="${user.userId}">${user.userId}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매 방법</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="구매자 이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="연락처">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="요청사항">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망 일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="배송희망일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구매</button>
			  <button type="button"  class="btn btn-primary btn">취소</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>
</html>