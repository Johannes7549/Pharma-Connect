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

	<%
        if (session.getAttribute("uname") != null) {
        	String role = (String) session.getAttribute("role");
            System.out.println("Role: " + role); // Add this line for debugging
            if ("Admin".equals(role)) {
            	try {
                    System.out.println("Redirecting to admin-dashboard.jsp");
                    response.sendRedirect("admin-dashboard.jsp");
                    return; // Make sure to return after sending the redirect
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
            	response.sendRedirect("customerHere.jsp");
            }
           
        }else{
    %>
	<div class="site wrap px-3" style="background-color: black;">
		<div class="site-navbar py-2 " >
			<div class="search-wrap">
				<div class="container-fluid">
					<a href="#" class="search-close js-search-close"><span
						class="icon-close2"></span></a>
					<form action="#" method="post">
						<input type="text" class="form-control"
							placeholder="Search keyword and hit enter...">
					</form>
				</div>
			</div>
			<div class=" container">
			<div class="d-flex align-items-center justify-content-between" >
			    <div class="logo">
			        <div class="site-logo">
			            <a href="index.jsp" class="js-logo-clone"><strong class="text-primary">Pharma</strong>&nbsp;Connect</a>
			        </div>
			    </div>
				<div class="main-nav d-none d-lg-block">
			        <nav class="site-navigation text-right text-md-center" role="navigation">
			            <ul class="site-menu js-clone-nav d-none d-lg-block">
			                <li class=""><a href="index.jsp">Home</a></li>
			                <li><a href="customer-search-product.jsp">Search Product</a></li>
			                <li class="has-children"><a href="#">View Products</a>
			                    <ul class="dropdown">
			                        <li><a href="allopathy-medicine.jsp">Allopathy Medicines</a></li>
			                        <li><a href="ayurveda-medicine.jsp">Ayurveda Products</a></li>
			                        <li><a href="generic-medicines.jsp">Generic Medicines</a></li>
			                    </ul>
			                </li>
			                <li class="has-children"><a href="#">Customer</a>
			                    <ul class="dropdown">
			                        <li><a href="customer-login.jsp">Customer Login</a></li>
			                        <li><a href="customer-account.jsp">Customer Account</a></li>
			                    </ul>
			                </li>
			                <li><a href="admin-login.jsp">Admin Login</a></li>
			                <li><a href="contact.jsp">Contact Us</a></li>
			            </ul>
			        </nav>
			    </div>
			    </div>
			</div>
		</div>


		<div class="owl-carousel owl-single px-0">
			<div class="site-blocks-cover overlay"
				style="background-image: url('images/banner-1.jpg');">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 mx-auto align-self-center">
							<div class="site-block-cover-content text-center">
								<h1 class="mb-0">PharmaConnect Opens 24 Hours</h1>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="site-blocks-cover overlay"
				style="background-image: url('images/banner-2.jpg');">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 mx-auto align-self-center">
							<div class="site-block-cover-content text-center" style="color: blue;">
								<h1 class="mb-0" >New Medicine Everyday</h1>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>



		<div class="site-section py-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="feature">
							<span class="wrap-icon flaticon-24-hours-drugs-delivery"></span>
							<h3>
								<a href="#">Free Delivery</a>
							</h3>
							<p>An online pharmacy, internet pharmacy, or mail-order
								pharmacy is a pharmacy that operates over the Internet and sends
								orders to customers through mail, shipping companies, or online
								pharmacy web portal.</p>

						</div>
					</div>
					<div class="col-lg-6">
						<div class="feature">
							<span class="wrap-icon flaticon-medicine"></span>
							<h3>
								<a href="#">New Medicine Everyday</a>
							</h3>
							<p>New launched medicine from WHO available in our PharmaConnect
								portal.</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="site-section" >
			<div class="container">
				<div class="row">
					<div class="title-section text-center col-12">
						<h2 class="text-white">
							Pharmacy <strong class="text-primary">Products</strong>
						</h2>
					</div>
				</div>
				<div class="row" >
				    <%
				        ResultSet resultMedicine = DatabaseConnection.getResultFromSqlQuery("select * from tblmedicine");
				        while (resultMedicine.next()) {
				    %>
				    <div class="col-md-4 mb-4 bg-dark">
				        <div class="text-center item  block-3 products-wrap shadow-lg p-3 ">
				            <a href="medicine-single-add-cart.jsp?id=<%=resultMedicine.getInt("id")%>">
				                <img src="uploads/<%=resultMedicine.getString("medicine_image_name")%>" alt="Image" width="100%" style=" height:200px; object-position:center; object-fit:cover">
				            </a>
				            <h3 class="mt-3">
				                <a class="text-white" href="medicine-single-add-cart.jsp?id=<%=resultMedicine.getInt("id")%>"><%=resultMedicine.getString("medicine_name")%></a>
				            </h3>
				            <p class="price mt-3 text-primary">
				                <del style="color: lightcoral;">
								    <%=resultMedicine.getDouble("medicine_mrp_price") %> Birr
								</del>&nbsp;
				                <%=resultMedicine.getDouble("medicine_discount_price")%> Birr
				            </p>
				        </div>
				    </div>
				    <%
				        }
				    %>
				</div>

				</div>
			</div>
		</div>
		<div class="site-section" style="background-color: black;">
			<div class="container">

				<div class="row justify-content-between" >
					<div class="col-lg-6" >
						<div class="title-section">
							<h2 style="color: white;">
								Happy <strong class="text-primary">Customers</strong>
							</h2>
						</div>
						<div class="block-3 products-wrap">
							<div class="owl-single no-direction owl-carousel">

								<div class="testimony">
									<blockquote>
										<img src="images/person_1.jpg" alt="Image" class="img-fluid">
										<p style="color: white;">&ldquo;Really impressed with the quality of service and
											on quick delivery of report. I do recommend others to use 1mg
											service.&rdquo;</p>
									</blockquote>

									<p class="author">&mdash; Rutuja Lembhe</p>
								</div>

								<div class="testimony">
									<blockquote>
										<img src="images/person_2.jpg" alt="Image" class="img-fluid">
										<p style="color: white;">&ldquo;Appreciate the complete process from app clarity
											to execution of reports on time.&rdquo;</p>
									</blockquote>

									<p class="author">&mdash; Sayali Kurkute</p>
								</div>

								<div class="testimony">
									<blockquote>
										<img src="images/person_3.jpg" alt="Image" class="img-fluid">
										<p style="color: white;">&ldquo;Awesome service. The staff was really courteous
											and the whole process is really smooth.&rdquo;</p>
									</blockquote>

									<p class="author">&mdash; Kishor Kadam</p>
								</div>

								<div class="testimony">
									<blockquote>
										<img src="images/person_4.jpg" alt="Image" class="img-fluid">
										<p style="color: white;">&ldquo;It was Awesome experience with E-Pharmacy
											portal. Easy to order, quick sample collection and within 12
											hours report received.&rdquo;</p>
									</blockquote>

									<p class="author">&mdash; KK</p>
								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-5">
						<div class="title-section" style="color: white;">
							<h2 class="mb-5 text-white">
								Why <strong class="text-primary">Us</strong>
							</h2>
							<div class="step-number d-flex mb-4">
								<span>1</span>
								<p style="color: white;">Making drug affordable - conventional pharma supply
									chains are not optimised and have several gaps, causing wastage
									and greater costs for consumers. e-pharmacies save costs with
									better purchasing margins, efficient supply chains and
									inventory management leading to reduced prices for the end
									consumer.</p>
							</div>
							<div class="step-number d-flex mb-4">
								<span>2</span>
								<p style="color: white;">Online sales of drugs started in the late 1990s and began
									to spread rapidly around the world.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="site-footer " style="background-color: black">
			<jsp:include page="front-side-footer.jsp"></jsp:include>
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
	<% }%>
</body>
</html>