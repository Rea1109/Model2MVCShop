<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <script type="text/javascript">
   	$('.carousel').carousel({ interval:1000 });
   </script>
   	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,700;1,200&display=swap" rel="stylesheet">
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
            font-family: 'Poppins', sans-serif;
        }
        
        img {
			  width: 500px;
			  height: 350px;
			  object-fit: cover;
			}
   	</style>
   	

</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<div class ="page-header">
			<h1>판매상품</h1>
		</div>
		
		<div id="carouser-example-generic" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	      <ol class="carousel-indicators">
	        <li data-target="#carouser-example-generic" data-slide-to="0" class="active"></li>
	        <li data-target="#carouser-example-generic" data-slide-to="1"></li>
	        <li data-target="#carouser-example-generic" data-slide-to="2"></li>
	      </ol>
	      
	      <div class="carousel-inner" role="listbox">
	        <div align="center" class="item active">
	          <img class="first-slide" src="../images/uploadFiles/iphone-12-red-select-2020.png" alt="First slide">
	        </div>
	        
	        <div class="item">
	          <img align="center" src="../images/uploadFiles/202103301510013984_d.jpg" alt="Second slide">
	        </div>
	        
	        <div class="item">
	          <img align="center" src="../images/uploadFiles/airmao.jpg" alt="Third slide">
	        </div>
	        
	        <div class="item">
	          <img align="center" src="../images/uploadFiles/ererder.jpg" alt="Third slide">
	        </div>
	      </div>
			
		</div>
	</div>
</body>
</html>







