<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="cssStyles.jsp" />
</head>
<body>

	<div class="container_main">
		<jsp:include page="navbar.jsp" />
		<h1>Edit Transaction</h1>
		<form action="updateTransaction.do" method="POST">
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
						<input name="id" value="${transaction.id}" style="display: none;"></input>
						<td><input type="number" class="form-control" name="amount"
							step="0.01" value="${transaction.amount}" required></td>
						<td><select id="categorySelector" name="category" class="form-control">
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
								<option value="Recreation & Entertainment">Recreation &
									Entertainment</option>
								<option value="Miscellaneous">Miscellaneous</option>
						</select></td>
						<td><input type="text" class="form-control"
							name="subCategory" value="${transaction.subCategory}"></td>
						<td><input type="date" name="transaction_date" class="form-control" required
							value="${transaction.transactionDate}"></td>
						<td><input type="text" class="form-control" name="payee"
							value="${transaction.payee}"></td>
						<td>
							<button class ="btn btn-success" type="submit" value="Submit">Update</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>

	</div>


	<script>
		// set category select tag to current value
		let element = document.getElementById("categorySelector");
		element.value = "${transaction.category}";
	</script>
</body>
</html>