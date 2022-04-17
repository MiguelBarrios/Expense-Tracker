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
<jsp:include page="cssStyles.jsp" />
</head>
<body>

	<div class="container_main">
		<jsp:include page="navbar.jsp" />
		<h1>Search</h1>
		<form class="form-group" action="searchtransactions.do">
			<div class="form_container">
				<div class="formRow">
					<div>
						<label>Filter by category</label> 
					</div>
					<div>
						<select name="category" class="form-control">
							<option disabled selected value> -- select an option -- </option>
							<option value="Food">Food</option>
							<option value="Housing">Housing</option>
							<option value="Transportation">Transportation</option>
							<option value="Utilities">Utilities</option>
							<option value="Insurance">Insurance</option>
							<option value="Medical & Healthcare">Medical & Healthcare</option>
							<option value="Saving/Investing">Saving/Investing</option>
							<option value="Debt">Debt</option>
							<option value="Personal Spending">Personal Spending</option>
							<option value="Recreation & Entertainment">Recreation & Entertainment</option>
							<option value="Miscellaneous">Miscellaneous</option>
						</select>
					</div>	
				</div>
				
				<button class = "btn btn-success" type="submit" value="Submit">Search</button>
				
			</div>

			
		</form>

		<h3>Transactions(${transactions.size()})</h3>
		<jsp:include page="transactionTable.jsp" />

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>





