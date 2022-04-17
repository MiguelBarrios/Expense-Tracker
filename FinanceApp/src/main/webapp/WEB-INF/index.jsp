<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Finance App</title>
<jsp:include page="cssStyles.jsp" />
</head>
<body>

	<div id="container_main">
		<jsp:include page="navbar.jsp" />
		<h3>Add New Transaction</h3>


		<!-- CREATE NEW TRANSACTION FORM -->
		<form action="addTransaction.do" method="POST">
			<table class="table">
				<thead>
					<tr>
						<th>Amount</th>
						<th>category</th>
						<th>Sub-category</th>
						<th>Transaction Date</th>
						<th>Payee</th>
					</tr>
				</thead>
				<tbody>
					<div class="form-group">
						<tr>
							<td><input type="number" name="amount" step="0.01" class="form-control" required></td>
							<td><select name="category" class="form-control">
									<option value="Food">Food</option>
									<option value="Housing">Housing</option>
									<option value="Transportation">Transportation</option>
									<option value="Utilities">Utilities</option>
									<option value="Insurance">Insurance</option>
									<option value="Medical & Healthcare">Medical &
										Healthcare</option>
									<option value="Saving/Investing">Saving/Investing</option>
									<option value="Debt">Debt</option>
									<option value="Personal Spending">Personal Spending</option>
									<option value="Recreation & Entertainment">Recreation
										& Entertainment</option>
									<option value="Miscellaneous">Miscellaneous</option>
							</select></td>
							<td><input type="text" class="form-control"
								name="subCategory"></td>
							<td><input type="date" name="transaction_date" class="form-control" required></td>
							<td><input type="text" class="form-control" name="payee"></td>
							<td><button class = "btn btn-success" type="submit" value="Submit">Add</button></td>
						</tr>

					</div>

				</tbody>
			</table>
		</form>

		<br>

		<!-- Message -->
		<c:if test="${not empty messageFlag}">
			<c:choose>
				<c:when test="${messageFlag}">
					<h3 style="color: green;">${message}</h3>
				</c:when>
				<c:otherwise>
					<h3 style="color: red;">${message}</h3>
				</c:otherwise>
			</c:choose>

		</c:if>


		<!--  All Transactions View -->
		<h3>Transactions(${transactions.size()})</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">amount</th>
					<th scope="col">Category</th>
					<th scope="col">Sub Category</th>
					<th scope="col">Merchant</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${transactions}" var="t">
					<tr>
						<td>${t.transactionDate}</td>
						<td>${t.amount}</td>
						<td>${t.category}</td>
						<td>${t.subCategory}</td>
						<td>${t.payee}</td>
						<td>
							<form action="showUpdateTransactionPage.do">
								<input name="tid" value="${t.id}" style="display: none;"></input>
								<button type="submit" class="btn btn-warning">Edit</button>
							</form>
						</td>
						<td>
							<form action="removeTransaction.do" method="POST">
								<input name="tid" value="${t.id}" style="display: none;"></input>
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>