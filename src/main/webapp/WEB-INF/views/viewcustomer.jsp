<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View post</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
</head>
<body>

	<div class="container">
		<h3 class="mt-2">
			<span class="float-right">
				<a href="${contextRoot}/newcustomer" class="btn btn-success">New Customer</a>
			</span>
		</h3><hr/>

		<div class="row">
			<div class="col-md-3">
				<img class="img-thumbnail" src="https://placehold.it/250x300" />
			</div>
			<div class="col-md-9">
				<h2>${fullcustomer.name}</h2>
				<hr/>
				<h4>${fullcustomer.dob}</h4>
				<hr/>
				<p>${fullcustomer.email}</p>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-md-12">
				<h4>Sims:</h4>
				<c:if test="${sims.size() == 0}">
					<h4 class="text-center">No sims found</h4>
				</c:if>
				<c:if test="${sims.size() > 0}">
					<ul>
						<c:forEach items="${sims}" var="sim">
							<li class="list-group-item">${sim.simNumber}</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<form:form action="${contextRoot}/customer/${fullcustomer.id}/sims" method="post" modelAttribute="sim">
					Comments:<br/>
					<form:textarea path="text" class="form-control"/><br/>
					<button type = "submit" class="btn btn-primary">Send</button>
					<a href="${contextRoot}/" class="btn btn-primary ml-2">Back to customers</a>
				</form:form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>