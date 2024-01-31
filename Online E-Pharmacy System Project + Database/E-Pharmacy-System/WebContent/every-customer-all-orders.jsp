<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>PharmaConnect</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<div class="site wrap bg-black">
		<div class="site-navbar py-2">

			<div class="search-wrap">
				<div class="container">
					<a href="#" class="search-close js-search-close"><span
						class="icon-close2"></span></a>
					<form action="#" method="post">
						<input type="text" class="form-control"
							placeholder="Search keyword and hit enter...">
					</form>
				</div>
			</div>
			<div class="container">
				<jsp:include page="front-side-header.jsp"></jsp:include>
			</div>
		</div>
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">View All Orders</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container-fluid">
				<div class="row mb-5 shadow p-3 mb-5">
					<div class="site-blocks-table">
						<table id="table" id="table" class="table table-bordered">
							<thead>
								<tr>
									<th>Order No</th>
									<th>Medicine</th>
									<th>Quantity</th>
									<th>MRP(Rs)</th>
									<th>Selling Price(Rs)</th>
									<th>Total Price(Rs)</th>
									<th>Order Date</th>
									<th>Status</th>
								</tr>
							</thead>
							<%
								int index=0;
								ResultSet totalMedicine = DatabaseConnection.getResultFromSqlQuery("select * from tblorder where email_id='"+session.getAttribute("email")+"'");
								while (totalMedicine.next()) {
									index++;
							%>
							<tbody>
								<tr>
									<td><%=totalMedicine.getInt("order_no")%></td>
									<td class="product-thumbnail"><img
										src="uploads/<%=totalMedicine.getString("medicine_image_name")%>" alt=""
										class="pro-image-front" style="width: 150px; height: 100px;"><br><%=totalMedicine.getString("medicine_name")%></td>
									<td class=""><%=totalMedicine.getDouble("quantity")%></td>
									<td><%=totalMedicine.getDouble("medicine_mrp_price")%>&nbsp;Birr</td>
									<td><%=totalMedicine.getDouble("medicine_discount_price")%>&nbsp;Birr</td>
									<td><%=totalMedicine.getDouble("medicine_total_price")%>&nbsp;Birr</td>
									<td><%=totalMedicine.getString("created_at")%></td>
									<%
										if (totalMedicine.getString("medicine_order_status").equals("Delivered")) {
									%>
										<td><font color="green"><strong>Delivered</strong></font></td>
									<%
										} else if(totalMedicine.getString("medicine_order_status").equals("In Process")) {
									%>
										<td><font color="blue"><strong>In Process</strong></font></td>
									<%
										} else{
									%>
										<td><font color="red"><strong>Pending</strong></font></td>	
									<%
										}
									%>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<footer class="site-footer bg-light">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-9 mb-4 mb-lg-0">

						<div class="block-7">
							<h3 class="footer-heading mb-4">
								About <strong class="text-primary">PharmaConnect</strong>
							</h3>
							<p>The "PharmaConnect" has been developed to
								override the problems prevailing in the practicing manual
								system. This software is supported to eliminate and in some
								cases reduce the hardships faced by this existing system.
								Moreover this system is designed for the particular need of the
								company to carry out operations in a smooth and effective
								manner.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<div class="block-5 mb-5">
							<h3 class="footer-heading mb-4">Contact Info</h3>
							<ul class="list-unstyled">
								<li class="phone"><a href="">+91- 0000000000</a></li>
								<li class="email">pharmaconnect@gmail.com</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-5 mt-5 text-center">
					<div class="col-md-12">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | PharmaConnect
						</p>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
	<%
		} else {
		response.sendRedirect("customer-login.jsp");
	 }
	%>
</body>
</html>