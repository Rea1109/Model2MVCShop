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
		$("form").attr("method","POST").attr("action","/purchase/listSale").submit();
	}
	
	 $(function() {
		 
		 $(  "td:nth-child(1) > i" ).on("mouseover" , function() {
			 		
					var tranNo = $(this).next().val();
					//alert(tranNo);
					$.ajax( 
							{
								url : "/purchase/json/getPurchase/"+tranNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									var displayValue = "<h6>"
										+"구매자 : "+JSONData.receiverName+"<br/>"
										+"연락처 : "+JSONData.receiverPhone+"<br/>"
										+"배송지 : "+JSONData.divyAddr+"<br/>"
										+"요청사항 : "+JSONData.divyRequest+"<br/>"
										+"주문일 : "+JSONData.orderDate+"<br/>"
										+"</h6>";
										
									$( "#"+tranNo+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
		 
		 $(  "td:nth-child(1) > i" ).on("mouseout" , function() {
			$("h6").remove();
	
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
	       <h3>구매상품</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
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
            <th align="center">상품명</th>
            <th align="left" >구매자 ID</th>
            <th align="left">구매자</th>
            <th align="left">전화번호</th>
            <th align="left">배송현황</th>
            <th align="left">상품상태 수정</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">
			  	<h7>${purchase.purchaseProd.prodName}</h7>
			  	<i class="glyphicon glyphicon-search" id= "${purchase.tranNo}"></i>
			  	<input type="hidden" value="${purchase.tranNo}">
			  </td>
			  <td align="left">
			  	<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			  </td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">
			  	<c:choose>
					<c:when test="${purchase.tranCode=='1'}">
						구매 완료 상품
					</c:when>
					<c:when test="${purchase.tranCode=='2'}">
						배 송 중
					</c:when>
					<c:when test="${purchase.tranCode =='3'}">
						배 송 완 료
					</c:when>
				</c:choose>
			  </td>
			  <td>
			  	<c:if test="${purchase.tranCode=='3'}">
					<a href="/purchase/deletePurchase?prodNo=${purchase.purchaseProd.prodNo}">
						<i class="glyphicon glyphicon-ok" >상품삭제</i>
					</a>
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