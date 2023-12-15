<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>list.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/js/jquery-3.7.1.mini.js"></script>
  <link href="/css/main.css" rel="stylesheet" type="text/css">
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
    	<p><h3>상품목록</h3></p>
    	<p>
    		<button type="button" onclick="location.href='write'" class="btn bg-warning">상품등록</button>
    		<button type="button" onclick="location.href='list'" class="btn btn-primary">상품전체목록</button>
    	</p>
    </div><!-- col end -->
  </div><!-- row end -->
  
  
  <div class="row">
    <div class="col-sm-12">
    	<!-- 검색 -->
    	<form method="get" action="search">
    		상품명 : <input type="text" name="product_name" value="${product_name}"><!-- value값으로 기존 검색어 살아있음 -->
    			   <input type="submit" value="검색" class="btn btn-outline-light text-dark">
    	</form>
    	<hr>
    </div><!-- col end -->
  </div><!-- row end -->
  
  
  <div class="row">
    	<!-- varStatus="상태용 변수" -->
    	<c:forEach items="${list}" var="row" varStatus="vs">
    		<div class="col-sm-4 col-md-4">
	    		<c:choose>
	    			<c:when test="${row.FILENAME != '-'}">
	    				<a href="detail/${row.PRODUCT_CODE}">
	    					<img src="/storage/${row.FILENAME}" class="img-responsive margin" style="width:100%">
	    				</a>
	    			</c:when>
	    			<c:otherwise>
	    				등록된 사진 없음!<br>
	    			</c:otherwise>
	    		</c:choose>
		    	상품명 :
		    		<%-- <a href="detail?product_code=${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a> --%> <!-- 칼럼명 대문자로 쓰기(Map에서 Key값이라서 그럼) -->
					<!-- 결과값 : http://localhost:9095/product/detail?product_code=42 -->		    		
		    		
		    		<!-- RESTful Web Service URL 형식으로 서버에 요청(위와 같음) -->
		    		<!-- 결과값 : http://localhost:9095/product/detail/42 -->
		    		<a href="detail/${row.PRODUCT_CODE}">${row.PRODUCT_NAME}</a>
		    		
		    	<br>
		    	상품가격 : <fmt:formatNumber value="${row.PRICE}" pattern="#,###"/>
		    	<hr>
	    	</div>
	    	<!-- 한 줄에 3칸씩 -->
	    	<c:if test="${vs.count mod 3==0}">
	    	  </div><!-- row end -->
	    		<div style="height:50px"></div>
	    		<div class="row"></div>
	    	</c:if>
    	</c:forEach>
  </div><!-- row end -->
  
<!-- 본문 끝 -->
</div><!-- container end -->

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p>ITWILL 아이티윌 교육센터</p>
</div>

</body>
</html>