<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
				alert("������ �̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(receiverPhone == null || receiverPhone.length<1){
				alert("������ ��ȣ�� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(divyDate == null || divyDate.length<1){
				alert("������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(divyAddr == null || divyAddr.length<1){
				alert("�ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			alert("���Ž�û �Ϸ�");
			
			$("form").attr("method","POST").attr("action","/purchase/addPurchase?prodNo=${product.prodNo}&buyerId=${user.userId}").submit();
		
		}
		
		function resetData(){
			
			alert("���Ž�û�� ��� �մϴ�");
			$("form").attr("method","POST").attr("action","/product/listProduct?menu=search").submit();
		}
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( ".btn.btn-primary:contains('����')" ).on("click" , function() {
				 
				fncAddPurchase();
			});
			
			 $( ".btn.btn-primary.btn:contains('���')" ).on("click" , function() {
				 
				 resetData();
			});
		});	
    </script>
</head>

<body>

	
	<jsp:include page="/layout/toolbar.jsp" />
   	

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">���� ��û�� </h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ ��ȣ</label>
		    <div class="col-sm-4">
		      <span type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}">${product.prodNo}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label class="col-sm-offset-1 col-sm-3 control-label">��ǰ ����</label>
		    <div class="col-sm-4">
		      <span type="text" class="form-control" >
		      	${product.price}<i class="glyphicon glyphicon-usd"></i>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
		    <div class="col-sm-4">
		      <span type="text" class="form-control" id="buyerId" name="buyerId" value="${user.userId}">${user.userId}</span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������ �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="������ �̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="����ó">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" placeholder="�ּ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">��û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="��û����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">������ ����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="��������">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >����</button>
			  <button type="button"  class="btn btn-primary btn">���</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>
</html>