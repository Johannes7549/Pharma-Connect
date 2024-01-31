<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
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
	<div class="site wrap" style="background-color: black;">
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
		<div class="py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a
							href="">View Medicine</a> <span class="mx-2 mb-0"></span>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
				<%
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine where id='" + request.getParameter("id") + "'");
					if (resultset.next()) {
				%>
				<form action="AddProductsToCart" method="post">
					<div class="row">
						<div class="col-md-5 mr-auto">
							<div class="border text-center">
								<input type="hidden" name="medicineId"
									value="<%=resultset.getInt("id")%>"> <img
									src="uploads/<%=resultset.getString("medicine_image_name")%>"
									alt="Image" class=" p-5" width="100%" height="300px">
							</div>
						</div>
						<div class="col-md-6">
							<h4 class="text-black"><%=resultset.getString("medicine_name")%></h4>
							<p><%=resultset.getString("medicine_description")%></p>
							<input type="hidden" name="mrp_price"
								value="<%=resultset.getDouble("medicine_mrp_price")%>">
							<input type="hidden" name="discount_price"
								value="<%=resultset.getDouble("medicine_discount_price")%>">
							<p>
								<del><%=resultset.getDouble("medicine_mrp_price")%>
									Birr
								</del>
								&nbsp; <strong class="text-primary h4"><%=resultset.getDouble("medicine_discount_price")%>
									Birr</strong>
							</p>
							<p>
								Manufacturing Date -
								<%=resultset.getString("medicine_manufacturing_date")%></p>
							<p>
								Expiry Date -
								<%=resultset.getString("medicine_expiry_date")%></p>
							<p>
								<input type="submit" value="Add to cart"
									class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary"
									onclick="return confirm('Are you sure Do you want to add this item in cart?');">
							</p>
						</div>
					</div>
				</form>
				<%
					}
				%>
			</div>
		</div>
		<footer class="site-footer ">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-9 mb-4 mb-lg-0">
						<div class="block-7">
							<h3 class="footer-heading mb-4 text-white">
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
							<h3 class="footer-heading mb-4 text-white">Contact Info</h3>
							<ul class="list-unstyled">
								<li class="phone text-white"><a href="">+251975149601</a></li>
								<li class="email text-white">pharmaconnect@gmail.com</li>
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
</body>
</html>