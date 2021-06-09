<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

	function fncGetList(currentPage){
		document.getElementById("currentPage").value = currentPage;
		//alert("${menu}");
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${menu}").submit();
	}
	
	 $(function() {
		 
		 $(  "td:nth-child(1) > i" ).on("mouseenter" , function() {
					var prodNo = $(this).next().val();
				
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									var displayValue = "<img src =/images/uploadFiles/"+JSONData.fileName+" alt=사진없음>";
									
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
		 
		 	$(  "td:nth-child(1) > i" ).on("mouseleave" , function() {
		 		$("img").remove();
		 	});
		 
		});	
</script>

	<style>
        body {
            padding-top : 70px;
        }
        
        img {
        	width: 100px;
			height: 100px;
			object-fit: cover;
        }
   	</style>

</head>

<body >

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>${menu=='manage'?"상품관리":"상품목록"}</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${!empty search.searchCondition && search.searchCondition==0?"selected":""}>상품번호</option>
						<option value="1" ${!empty search.searchCondition && search.searchCondition==1?"selected":""}>상품명</option>
						<option value="2" ${!empty search.searchCondition && search.searchCondition==2?"selected":""}>가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"
				    			 onkeypress="if(event.keyCode == 13){fncGetList('1');}"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">사진보기</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">제조일</th>
            <th align="left">현재상태</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">
			  	<i class="glyphicon glyphicon-search" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			  <td align="left">
			  	<a  id="prodName" href="/product/getProduct?menu=${menu}&prodNo=${product.prodNo}">${product.prodName}</a>
			  </td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.manuDate}</td>
			  <td align="left">
			  	<c:if test="${menu=='manage'}">
					<c:choose>
						<c:when test="${empty product.proTranCode}">
							판매중
						</c:when>
						<c:when test="${product.proTranCode=='1'}">
							구매완료 &nbsp; &nbsp; &nbsp;
							<a href="/purchase/updateTranCode?menu=manage&prodNo=${product.prodNo}&tranCode=2">
								<i class="glyphicon glyphicon-gift" >배송</i>
							</a>
						</c:when>
						<c:when test="${product.proTranCode=='2'}">
							배송중
						</c:when>
						<c:when test="${product.proTranCode=='3'}">
							배송완료
						</c:when>
					</c:choose>
				</c:if>
				<c:if test="${menu=='search'}">
					<c:choose>
						<c:when test="${!empty product.proTranCode}">
							재고없음
						</c:when>
						<c:when test="${empty product.proTranCode}">
							판매중
						</c:when>
					</c:choose>
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>