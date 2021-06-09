<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 
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

<!DOCTYPE html>
<html>
<head>

	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style >
		body {padding-top : 70px;}
		
		img {
			  width: 500px;
			  height: 350px;
			  object-fit: cover;
			}
	</style>
	
	<script type="text/javascript">
	
	$('.carousel').carousel({ interval:1000 });
	
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('회원가입')").on("click" , function() {
			self.location = "/user/addUser"
		});
	});
	
	
	$( function() {
		
		$("#userId").focus();
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click" , function() {
			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
		});
	});	
	
	</script>

</head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Model2 MVC Shop</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" name="userId" id="userId" placeholder="ID" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" name="password" id="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">로그인</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Model2MVC Shop</h1>
        <p>Java를 기초로한 Model2 MVC web 프로젝트 입니다.</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">회원가입 &raquo;</a></p>
      </div>
    </div>
    
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