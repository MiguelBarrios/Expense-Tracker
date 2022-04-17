<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyWebApp</title>
<jsp:include page="cssStyles.jsp" />
</head>
<body>

	<jsp:include page="navbar.jsp"/>
	<h1>Add new Transaction</h1>
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
				<tr>
					<td><input type="number" class="form-control" name="amount" step="0.01" required></td>
					<td><select name="category">
							<option value="Food">Food</option>
							<option value="Housing">Housing</option>
							<option value="Transportation">Transportation</option>
							<option value="Utilities">Utilities</option>
							<option value="Insurance">Insurance</option>
							<option value="Medical & Healthcare">Medical & Healthcare</option>
							<option value="Saving/Investing">Saving/Investing</option>
							<option value="Debt">Debt</option>
							<option value="Personal Spending">Personal Spending</option>
							<option value="Recreation & Entertainment">Recreation &
								Entertainment</option>
							<option value="Miscellaneous">Miscellaneous</option>
					</select></td>
					<td><input type="text" class="form-control" name="subCategory"></td>
					<td><input type="date" name="transaction_date" required></td>
					<td><input type="text" class="form-control" name="payee"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="Submit">
	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>