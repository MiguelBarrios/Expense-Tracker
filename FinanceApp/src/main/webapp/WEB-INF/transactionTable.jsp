<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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