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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function validateEmail()
	{  
		var x=document.customerForm.email.value;  
		var atposition=x.indexOf("@");  
		var dotposition=x.lastIndexOf(".");  
		if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){ 
			document.getElementById("emailloc").innerHTML="Please enter your correct email address";  
			status=false; 
		}
	}
</script>
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
						<a href="index.jsp" class="text-primary">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-white">Create Customer Account</strong>
					</div>
				</div>
			</div>
		</div>
		<div class="site-section">
			<div class="container">
			 	<%
					String customerAccount = (String) session.getAttribute("customer-account");
				if (customerAccount != null) {
					session.removeAttribute("customer-account");
				%>
				<div class="alert alert-info" id="info">Customer account
					created successfully.</div>
				<%
					}
				%> 

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="panel panel-warning shadow p-3 mb-5" style="background-color: black; border-color: green;">
							<h2 class="text-primary">Customer Account</h2>
							<div class="panel-body">
								<form action="${pageContext.request.contextPath }/CustomerAccount" method="post" name="customerForm" class="text-white">
									<div class="form-row">
										<%
											int customerId = DatabaseConnection.generateCustomerId();
										%>
										<div class="form-group col-md-6">
											<label for="customerId">Customer Id:</label> <input
												type="text" class="form-control" id="customerId"
												placeholder="Customer Id" name="customerId"
												value="<%=customerId%>" readonly>
												
										</div>
								
										<div class="form-group col-md-6"">
											<label for="cname">Full Name:</label> <input type="text"
												class="form-control" id="cname" placeholder="Full Name"
												name="cname" required
												onkeypress="return lettersValidate(event)">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="email">Email Id:</label> <input type="text"
												class="form-control" id="email" placeholder="Email Id"
												name="email" required onblur="return validateEmail()">
											<span id="emailloc"></span>
										</div>
										<div class="form-group col-md-6">
											<label for="mobile">Mobile No:</label> <input type="text"
												class="form-control" id="mobile" placeholder="Mobile No"
												name="mobile" required
												onkeypress="return numberValidate(event)" maxlength="10">
										</div>
									</div>
									<div class="form-group">
										<label for="gender">Select Gender:</label> <select
											class="form-control" id="gender" name="gender">
											<option>Male</option>
											<option>Female</option>
										</select>
									</div>

									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="address">Address:</label>
											<textarea class="form-control" id="address"
												placeholder="Address" name="address" required maxlength="60"></textarea>
										</div>
										<div class="form-group col-md-6">
											<label for="pincode">Pincode:</label> <input type="text"
												class="form-control" id="pincode"
												placeholder="Enter Pincode" name="pincode" required
												oninput="limitNumber(this)" maxlength="6">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="uname">User Name:</label> <input type="text"
												class="form-control" id="uname" placeholder="Enter username"
												name="uname" required
												onkeypress="return lettersValidate(event)">
										</div>
										<div class="form-group col-md-6">
											<label for="upass">Password:</label> <input type="password"
												class="form-control" id="upass" placeholder="Enter password"
												name="upass" required oninput="limitChar(this)"
												maxlength="12">
										</div>
									</div>
									<input type="submit" value="Create Account"
										class="btn btn-success"> <input type="reset"
										class="btn btn-danger" value="Cancel">
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- <p>
					<strong>Important Note -</strong>
				</p>
				<p>1) Name,User Name only allowed in character format.</p>
				<p>2) Password length is upto 12 character & digit.</p>
				<p>3) 10 digit mobile number allowed only.</p> -->
			</div>
		</div>
		<footer class="site-footer " style="background-color: black;">
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
	<script type="text/javascript">
		let limitChar = (element) => {
	        const maxChar = 12;
	        
	        let ele = document.getElementById(element.id);
	        let charLen = ele.value.length;
	        
	        let p = document.getElementById('charCounter');
	        p.innerHTML = maxChar - charLen + ' characters remaining';
	        
	        if (charLen > maxChar) 
	        {
	            ele.value = ele.value.substring(0, maxChar);
	            p.innerHTML = 0 + ' characters remaining'; 
	        }
	    }
		let limitNumber = (element) => {
	        const maxNumber = 6;
	        
	        let ele = document.getElementById(element.id);
	        let numberLen = ele.value.length;
	        
	        let p = document.getElementById('numberCounter');
	        p.innerHTML = maxNumber - numberLen + ' number remaining';
	        
	        if (numberLen > maxNumber) 
	        {
	            ele.value = ele.value.substring(0, maxNumber);
	            p.innerHTML = 0 + ' number remaining'; 
	        }
	    }
		function lettersValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 64 && keycode < 91) || (keycode > 96 && keycode < 123) || keycode == 32)  
	    	{     
	           return true;    
	    	}else{
	          return false;
	    	}
	         
	    }
		function numberValidate(key) {
	    	var keycode = (key.which) ? key.which : key.keyCode;
	   		if ((keycode > 47 && keycode < 58))  
	    	{     
	           return true;    
	    	}else{
	          return false;
	    	} 
	    }
		
		console.log()
	</script>
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		}); -->
	</script>
</body>
</html>