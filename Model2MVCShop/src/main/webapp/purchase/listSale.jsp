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
										+"������ : "+JSONData.receiverName+"<br/>"
										+"����ó : "+JSONData.receiverPhone+"<br/>"
										+"����� : "+JSONData.divyAddr+"<br/>"
										+"��û���� : "+JSONData.divyRequest+"<br/>"
										+"�ֹ��� : "+JSONData.orderDate+"<br/>"
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
	       <h3>���Ż�ǰ</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">��ǰ��</th>
            <th align="left" >������ ID</th>
            <th align="left">������</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��ǰ���� ����</th>
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
						���� �Ϸ� ��ǰ
					</c:when>
					<c:when test="${purchase.tranCode=='2'}">
						�� �� ��
					</c:when>
					<c:when test="${purchase.tranCode =='3'}">
						�� �� �� ��
					</c:when>
				</c:choose>
			  </td>
			  <td>
			  	<c:if test="${purchase.tranCode=='3'}">
					<a href="/purchase/deletePurchase?prodNo=${purchase.purchaseProd.prodNo}">
						<i class="glyphicon glyphicon-ok" >��ǰ����</i>
					</a>
				</c:if>
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>