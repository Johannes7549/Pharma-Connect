<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
    <form method="POST" action="https://api.chapa.co/v1/hosted/pay" id = "paymentForm">
    <input type="hidden" name="public_key" value="CHAPUBK_TEST-rUKme3vQurozLJLNOr450ZCLkhti7eer" />
    <input type="hidden" id = "random" name="tx_ref" value="" />
    <input type="hidden" id="amount" name="amount" value="100" />
    <input type="hidden" name="currency" value="ETB" />
    <input type="hidden" name="email" value="israel@negade.et" />
    <input type="hidden" name="first_name" value="Israel" />
    <input type="hidden" name="last_name" value="Goytom" />
    <input type="hidden" name="title" value="Let us do this" />
    <input type="hidden" name="description" value="Paying with Confidence with cha" />
    <input type="hidden" name="logo" value="https://chapa.link/asset/images/chapa_swirl.svg" />
    <input type="hidden" name="callback_url" value="https://example.com/callbackurl" />
    <input type="hidden" name="return_url" value="http://localhost:8080/E-Pharmacy-System/customerHere.jsp" />
    <input type="hidden" name="meta[title]" value="test" />
    <button type="submit" hidden>Pay Now</button>
</form>

    <%
		
		int removeCartMedicine = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblcart");
	%>
    <script>
    	var paymentForm = document.getElementById('paymentForm');
	    if (paymentForm) {
	        // Submit the form when the page loads
	        window.onload = function() {
	            paymentForm.submit();
	        };
	    }
	    
	    
	    function generateRandomString(length) {
	        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	        let result = '';
	        for (let i = 0; i < length; i++) {
	            result += characters.charAt(Math.floor(Math.random() * characters.length));
	        }
	        return result;
	    }

	    // Set the generated random string as the value of the hidden input
	    document.getElementById('random').value = generateRandomString(20);
	    	
        // Retrieve the total_price from the URL query parameter
        var total_price = <%= request.getParameter("total_price") %>;

        console.log(total_price)
        console.log(document.getElementById("amount").value)
        // Set the value of the amount input field to the total_price
        document.getElementById("amount").value = total_price

        console.log(document.getElementById("amount").value)
        
    </script>
</body>
</html>
