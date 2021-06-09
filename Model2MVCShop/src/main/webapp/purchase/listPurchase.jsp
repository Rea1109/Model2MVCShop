<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html>
<head>
<title>���� �����ȸ</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="/css/admin.css" type="text/css">


<style>
        body {
            padding-top : 70px;
        }
</style>

<script type="text/javascript">
function fncGetList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	$("form").attr("method","POST").attr("action","/purchase/listPurchase").submit();
}
</script>
</head>

<body >

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���ų���</h3>
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
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">
			  	<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a>
			  </td>
			  <td align="left">
			  	<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
			  </td>
			  <td align="left">${purchase.receiverName}</td>
			  <td align="left">${purchase.receiverPhone}</td>
			  <td align="left">
			  	<c:choose>
					<c:when test="${purchase.tranCode=='1'}">
						���� �Ϸ�
					</c:when>
					<c:when test="${purchase.tranCode=='2'}">
						�� �� ��  &nbsp; &nbsp; &nbsp;
						<a href="/purchase/updateTranCode?&prodNo=${purchase.purchaseProd.prodNo}&tranCode=3">
							<i class="glyphicon glyphicon-ok" >���ǵ���</i>
						</a>
					</c:when>
					<c:when test="${purchase.tranCode =='3'}">
						�� �� �� �� 
					</c:when>
				</c:choose>
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