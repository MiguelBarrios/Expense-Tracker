<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<h1>Search Transactions</h1>


	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">id</th>
				<th scope="col">amount</th>
				<th scope="col">Category</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${transactions}" var="t">
				<tr>
					<td><a href="transactionView.do?tid=${t.id}">${t.id}</a></td>
					<td><c:out value="${t.amount}" /></td>
					<td><c:out value="${t.category}" /></td>
					<td><c:out value="${t.transactionDate}" /></td>
					<td>
						<form action = "showUpdateTransactionPage.do">
							<input name="tid" value="${t.id}" style="display: none;"></input>
							<button type="submit" class="btn btn-warning">Edit</button>
						</form>
					</td>
					
					
					

					<td>
						<form action = "removeTransaction.do" method="POST">
							<input name="tid" value="${t.id}" style="display: none;"></input>
							<button type="submit" class="btn btn-danger">Delete</button>
						</form>
					</td>


				</tr>

			</c:forEach>

		</tbody>

	</table>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>





