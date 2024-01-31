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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

</head>

<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
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
		<div class=" py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-white">Cart</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<%
					int index = 0;
					int paymentId = 1001;
					ResultSet rsCountCheck = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("customerId") + "'");
					rsCountCheck.next();
					int cartItem = rsCountCheck.getInt(1);
					System.out.println("cartItem  " + cartItem);
					if (cartItem > 0) {
				%>
				<%
					String quantity = (String) session.getAttribute("quantity-short");
					if (quantity != null) {
					session.removeAttribute("quantity-short");
				%>
					<div class="alert alert-danger" id="danger">Medicine quantity is not enough to purchase.</div>
				<%
					}
				%>
				<div class="row mb-5 shadow p-3 mb-5">
					<div class="site-blocks-table">
						<table class="table table-bordered ">
							<thead>
								<tr>
									<th style="color:white;">SR.No</th>
									<th style="color:white;">Medicine</th>
									<th style="color:white;">Quantity</th>
									<th style="color:white;">MRP(Rs)</th>
									<th style="color:white;">Selling Price(Rs)</th>
									<th style="color:white;">Total Price(Rs)</th>
									<th style="color:white;">Action</th>
								
								</tr>
							</thead>
							<%
							    
								ResultSet totalMedicine = DatabaseConnection.getResultFromSqlQuery("select tblmedicine.medicine_image_name,tblmedicine.medicine_name,tblcart.quantity,tblcart.medicine_mrp_price,tblcart.medicine_discount_price,tblcart.total_medicines_price,tblcart.medicine_id from tblmedicine,tblcart where tblmedicine.id=tblcart.medicine_id and customer_id='"+ session.getAttribute("customerId") + "'");
								while (totalMedicine.next()) {
									index++;
							%>
							<tbody>
								<tr>
									<td style="color:white;" class="invert"><%=index%></td>
									<td style="color:white;" class="product-thumbnail"><img
										src="uploads/<%=totalMedicine.getString(1)%>" alt=""
										class="pro-image-front" style="width: 150px; height: 100px;"><br><%=totalMedicine.getString(2)%></td>
									<td style="color:white;">
										<form action="UpdateMedicineQuantity" method="post">
											<div class="input-group mb-3" style="max-width: 80px;">
												<input type="hidden" value="<%=totalMedicine.getInt(7)%>"
													name="medicineId"> <input type="text"
													name="quantity" value="<%=totalMedicine.getInt(3)%>"
													class="form-control text-center"> 
													<input type="submit" value="+" class="btn btn-outline-primary">
											</div>
										</form>
									</td>
									<%
										
										ResultSet rsPaymentId = DatabaseConnection.getResultFromSqlQuery("select max(payment_id) from tblorder");
										if (rsPaymentId.next()) {
										paymentId = rsPaymentId.getInt("max(payment_id)");
										paymentId++;
									}
									%>
									<td style="color:white;"class=""><del><%=totalMedicine.getDouble(4)%>&nbsp;Birr
										</del></td>
									<td style="color:white;"><%=totalMedicine.getDouble(5)%>&nbsp;Birr</td>
									<td style="color:white;"><%=totalMedicine.getDouble(6)%>&nbsp;Birr</td>
									<td style="color:white;"><a href="remove-medicine-from-cart.jsp?medicineId=<%=totalMedicine.getInt(7)%>&quantity=<%=totalMedicine.getInt(3)%>" class="btn btn-primary height-auto btn-sm" onclick="return confirm('Are you sure do you want to delete this medicine?');">X</a></td>
									<td style="color:white;"><button id="orderButton" onclick="disableButton()"><a href="InsertOrder?payment_id=<%=paymentId%>"  id="linkk" class="">Order</a></button></td>
								</tr>
								<%
									}
								%>
								<%
									double finalBill = 0.0;
									ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery("select sum(total_medicines_price) from tblcart where customer_id='"+ session.getAttribute("customerId") + "' ");
									if (totolAmount.next()) {
										finalBill = totolAmount.getInt(1);
									}
								%>
								<tr>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;" colspan="2"><strong>
												Total Amount.:&nbsp;<%=finalBill%>
												Birr
											</strong></td>
											
									
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
				
				
				<h2 class="text-primary pb-3">Accepted Orders</h2>
				
				
				<div class="row mb-5 shadow p-3 mb-5">
					<div class="site-blocks-table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="color:white;">SR.No</th>
									<th style="color:white;">Medicine</th>
									<th style="color:white;">Quantity</th>
									<th style="color:white;">MRP(Rs)</th>
									<th style="color:white;">Selling Price(Rs)</th>
									<th style="color:white;">Total Price(Rs)</th>
									<th style="color:white;">Action</th>
								
								</tr>
							</thead>
							<%
								String Pending = "Delivered";
								ResultSet thisMedicine = DatabaseConnection.getResultFromSqlQuery("select tblmedicine.medicine_image_name,tblorder.medicine_name,tblcart.quantity,tblcart.medicine_mrp_price,tblcart.medicine_discount_price,tblcart.total_medicines_price,tblcart.medicine_id from tblmedicine,tblcart,tblorder where tblmedicine.id=tblcart.medicine_id and tblorder.medicine_order_status ='" + Pending + "' and customer_id='"+ session.getAttribute("customerId") + "'");
								while (thisMedicine.next()) {
									index++;
							%>
							<tbody>
								<tr>
									<td  style="color:white;"class="invert"><%=index%></td>
									<td style="color:white;" class="product-thumbnail"><img
										src="uploads/<%=thisMedicine.getString(1)%>" alt=""
										class="pro-image-front" style="width: 150px; height: 100px;"><br><%=thisMedicine.getString(2)%></td>
									<td style="color:white;">
										<form action="UpdateMedicineQuantity" method="post">
											<div class="input-group mb-3" style="max-width: 80px;">
												<input type="hidden" value="<%=thisMedicine.getInt(7)%>"
													name="medicineId"> <input type="text"
													name="quantity" value="<%=thisMedicine.getInt(3)%>"
													class="form-control text-center"> 
													<input type="submit" value="+" class="btn btn-outline-primary">
											</div>
										</form>
									</td>
									<%
										ResultSet rsPaymentId = DatabaseConnection.getResultFromSqlQuery("select max(payment_id) from tblorder");
										if (rsPaymentId.next()) {
										paymentId = rsPaymentId.getInt("max(payment_id)");
										paymentId++;
									}
									%>
									<td style="color:white;" class=""><del><%=thisMedicine.getDouble(4)%>&nbsp;Birr
										</del></td>
									<td style="color:white;"><%=thisMedicine.getDouble(5)%>&nbsp;Birr</td>
									<td style="color:white;"><%=thisMedicine.getDouble(6)%>&nbsp;Birr</td>
									<td style="color:white;"><a href="remove-medicine-from-cart.jsp?medicineId=<%=thisMedicine.getInt(7)%>&quantity=<%=thisMedicine.getInt(3)%>" class="btn btn-primary height-auto btn-sm" onclick="return confirm('Are you sure do you want to delete this medicine?');">X</a></td>
									<%-- <td><button id="orderButton" onclick="disableButton()"><a href="InsertOrder?payment_id=<%=paymentId%>"  id="linkk" class="">Order</a></button></td> --%>
								</tr>
								<%
									}
								%>
								<%
									double finalBill2 = 0.0;
									ResultSet totolAmount2 = DatabaseConnection.getResultFromSqlQuery("select sum(total_medicines_price) from tblcart where customer_id='"+ session.getAttribute("customerId") + "' ");
									if (totolAmount2.next()) {
										finalBill = totolAmount2.getInt(1);
									}
								%>
								<tr>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;">&nbsp;</td>
									<td style="color:white;" colspan="2"><strong>
												Total Amount.:&nbsp;<%=finalBill2%>
												Birr
											</strong></td>
											
									
								</tr>
								
							</tbody>
						</table>
					</div>
				</div>
				
				
				
				
				
				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5">
							<div class="col-md-6">
								<a href="allopathy-medicine.jsp"
									class="btn btn-outline-primary btn-md btn-block">Continue
									Shopping</a>
							</div>
						</div>
						<form action="GetMedicineOrders" method="post">
						<div class="row">
							<div class="col-md-12">
								<label class="text-black h4" for="coupon">Billing
									Address</label>
								<p>Note: Now only cash on delivery payment mode is
									available.</p>
							</div>
						</div>
						<%
							ResultSet userInfoResult = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where id='"+ session.getAttribute("customerId") + "' and uname='" + session.getAttribute("uname") + "'");
							if (userInfoResult.next()) {
						%>
						<div class="form-group">
							<label class="text-primary">Your Name</label> <input type="text" name="name"
								value="<%=userInfoResult.getString("full_name")%>"
								placeholder="" required="" style="width: 1135px; height: 40px; color:black;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label class="text-primary">Mobile Number</label> <input type="text" name="phone"
								value="<%=userInfoResult.getString("mobile_no")%>"
								placeholder="" required="" style="width: 1135px; height: 40px; color:black;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label class="text-primary">Email Id</label> <input type="text" name="email"
								value="<%=userInfoResult.getString("email_id")%>" placeholder=""
								required="" style="width: 1135px; height: 40px; color:black;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label class="text-primary">Address</label> <input type="text" name="address"
								value="<%=userInfoResult.getString("address")%>" placeholder=""
								required="" style="width: 1135px; height: 100px; color:black;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label class="text-primary">Pin Code</label> <input type="text" name="pincode"
								value="<%=userInfoResult.getString("pincode")%>" placeholder=""
								required="" style="width: 1135px; height: 40px; color:black;"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label class="text-primary">Select Payment Mode</label> <select name="payment"
								style="width: 1135px; height: 40px;" class="form-control">
								<option selected="selected">Chapa</option>
								<!-- <option disabled="disabled">Credit Card</option>
								<option disabled="disabled">Debit Card</option>
								<option disabled="disabled">Online Banking</option>
								<option disabled="disabled">UPI Id</option> -->
							</select>
						</div>
						<div class="row">
							<%
								ResultSet rsPaymentId = DatabaseConnection.getResultFromSqlQuery("select max(payment_id) from tblorder");
								if (rsPaymentId.next()) {
								paymentId = rsPaymentId.getInt("max(payment_id)");
								paymentId++;
							}
							%>
							<div class="col-md-12">
								<input type="hidden" name="payment_id" value="<%=paymentId%>">

								
								<a href="pay.jsp?total_price=<%=finalBill%>" class="btn btn-primary btn-lg btn-block">Buy Products</a>
								
							</div>
						</div>
						</form>
						<%
							}
						%>
					</div>
				</div>
				<%
					}else{	
				%>
					Thanks for giving order.&nbsp;<a href="customer-medicine-invoice.jsp?paymentId=<%=paymentId%>">Print Your Medicine Order
					Bill</a><br>
				<%
					if (index == 0) {
				%>
					<strong>There is no item(s) in your Cart.&nbsp;<a href="index.jsp">Shop Now</a></strong>
				<%
					}
				%>
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
							<h3 class="footer-heading mb-4">
								About <strong class="text-primary">E-Pharmacy System</strong>
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
								<li class="phone"><a href="">+251975149601</a></li>
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
							All rights reserved | E-Pharmacy Management System
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
	<script type="text/javascript">
			$(function() {
				$('#info').delay(1500).show().fadeOut('slow');
			});
	</script>
	 <script>
		function disableButton() {
	        // Disable the button after it's clicked
	        var orderButton = document.getElementById('orderButton');
	        var linkk = document.getElementById('linkk');
	        orderButton.onclick = function() {
	            return false;
	        };
	        linkk.classList.add('disabled-link');
	        orderButton.setAttribute('disabled', 'disabled');
	    }	
	</script>
	<script type="text/javascript">
	
	
		$(function() {
			$('#danger').delay(1500).show().fadeOut('slow');
		});
	</script>
	<%
		} else {
	response.sendRedirect("customer-login.jsp");
	}
	%>
</body>
</html>