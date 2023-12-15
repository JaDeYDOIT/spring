<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>MY SHOP</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/jquery-3.7.1.mini.js"></script>
  <link href="/css/main.css" rel="stylesheet" type="text/css">
  <!-- ajax 사용한 delete
  <script>
  	function cartDelete(cartno){
  		alert("장바구니삭제" + cartno);
  		$.ajax({
  			url : '/cart/delete/' + cartno
  		   ,type :'post'
  		   ,success : function(result){
  			   if(result==1){
  				   alert("품목이 삭제되었습니다");
  				   location.reload();
  			   } else {
  				   alert("품목 삭제 실패");
  			   }//if end
  		   }//delete end
  		});//ajax() end
  	}//cartDelete() end
  </script> -->
  

  <script>
  	function cartDelete(cartno){
  		if(confirm("해당 상품을 삭제할까요?")){
  			//또다른 방법<form action='/cart/delete'></form>
  			//또다른 방법(RESTful) location.href='/cart/delete' + cartno;
  			location.href='/cart/delete?cartno=' + cartno;
  		}//if end
  	}//cartDelete() end
  	
  	function order(){
  		if(confirm("주문할까요?")){
  			location.href='/order/orderform';
  		}//if end
  	}//order() end
  </script> 

	
</head>
<body>

<div class="p-5 bg-success text-white text-center">
  <h1>MY SHOP 🏪</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="/product/list">상품</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="/cart/list">장바구니</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container text-center">
<!-- 본문시작 -->

  <div class="row">
    <div class="col-sm-12">
    	<p><h3>장바구니 목록</h3></p>
    </div><!-- col end -->
  </div><!-- row end -->
  
    <div class="row">
    <div class="col-sm-12">
    	<form name="cartfrm" id="cartfrm" method="post">
    	<input type="hidden" name="cartno" value="${cartno.CARTNO}">
    	<table class="table table-hover">
   		<thead class="table-warning">
   			<th>아이디</th>
   			<th colspan='2'>상품명</th>
   			<th>단가</th>
   			<th>상품수량</th>
   			<th>가격</th>
   			<th>삭제</th>
   		</thead>
   		<tbody>
   			<c:forEach items="${list}" var="row">
   				<tr>
   					<td>${row.id}</td>
   					<td><img alt="thumbnail" src="/storage.${filename}"></td>
   					<td>${product_name}</td> <!-- 상품명 -->
   					<td>${row.price}원</td>
   					<td>${row.qty}</td>
   					<td>${row.price*row.qty}원</td>
   					<td>
   						<input type="button" value="삭제" onclick="cartDelete(${row.cartno})">
   					</td>
   				</tr>
   			</c:forEach>
   		</tbody>
    	</table>
    	</form>
    	<br>
    	<input type="button" value="계속 쇼핑하기" onclick="location.href='/product/list'">
    	<input type="button" value="주문하기" 	   onclick="order()">
    </div><!-- col end -->
  </div><!-- row end -->

<!-- 본문 끝 -->
</div><!-- container end -->

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p>ITWILL 아이티윌 교육센터</p>
</div>

</body>
</html>