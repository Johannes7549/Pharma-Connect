package com.orders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.*;
import java.sql.*;

/**
 * Servlet implementation class GetProductOrders
 */
@WebServlet(name = "InsertOrder", urlPatterns = { "/InsertOrder" })
public class InsertOrder extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs=request.getSession();
		int id = 0;
		int quantity = 0;
		int order_no = 1000;
		int orderMedicine = 0;
		String order_status=null;
		int medicineId=0;
		String medicine_name = null;
		String medicine_price = null;
		String medicine_selling_price = null;
		String medicine_total_price = null;
		String medicine_status = null;
		
		String customerName = null;
		String email_id = null;
		String mobile_number = null;
		String address = null;
		String pincode = null;
		
		
//		String customerName = request.getParameter("name");
//		String mobile_number = request.getParameter("phone");
//		String email_id = request.getParameter("email");
//		String address = request.getParameter("address");
//		String pincode = request.getParameter("pincode");
		String payment_mode = null;
		int paymentId=Integer.parseInt(request.getParameter("payment_id"));
		HttpSession session = request.getSession();
		session.setAttribute("paymentId", paymentId);
		
	
		
		try {
			
			ResultSet cus = DatabaseConnection.getResultFromSqlQuery("select * from tblcustomer where id = " + session.getAttribute("customerId"));
			
			if (cus.next()) {
				customerName = cus.getString(2);
				email_id =cus.getString(3);
				mobile_number =cus.getString(4);
				address =cus.getString(6);
				pincode =cus.getString(7);
				
			}
			
			ResultSet rsMaxOrderNo = DatabaseConnection.getResultFromSqlQuery("select max(order_no) from tblorder");
			if (rsMaxOrderNo.next()) {
				order_no = rsMaxOrderNo.getInt(1);
				order_no=1000+order_no;
			}
			System.out.println("Order Id " + order_no);
			ResultSet totalMedicine = DatabaseConnection.getResultFromSqlQuery("select tblmedicine.medicine_image_name,tblmedicine.medicine_name,tblcart.quantity,tblcart.medicine_mrp_price,tblcart.medicine_discount_price,tblcart.total_medicines_price,tblcart.medicine_id,tblmedicine.id from tblmedicine,tblcart where tblmedicine.id=tblcart.medicine_id and customer_id='"+ session.getAttribute("customerId") + "' ");
			while (totalMedicine.next()) {
				order_no++;
				System.out.println("Order No  " + order_no);
				String medicine_image_name=totalMedicine.getString(1);
				medicine_name = totalMedicine.getString(2);
				quantity = totalMedicine.getInt(3);
				medicine_price = totalMedicine.getString(4);
				medicine_selling_price = totalMedicine.getString(5);
				medicine_total_price = totalMedicine.getString(6);
				medicineId=totalMedicine.getInt(8);
				order_status = "Pending";
				orderMedicine = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblorder(id,order_no,customer_name,email_id,mobile_no,address,pincode,medicine_image_name,medicine_name,quantity,medicine_mrp_price,medicine_discount_price,medicine_total_price,medicine_order_status,payment_mode,payment_id) values('"
								+ id + "','" + order_no + "','" + customerName + "','" + email_id + "','"
								+ mobile_number + "','" + address + "','" + pincode + "','"+medicine_image_name+"','"
								+ medicine_name + "','" + quantity + "','" + medicine_price + "','"
								+ medicine_selling_price + "','" + medicine_total_price + "','" + order_status + "','"
								+ payment_mode + "','"+paymentId+"')");
				int updateMedicineQuantityInMedicine = DatabaseConnection.insertUpdateFromSqlQuery("update tblmedicine set medicine_quantity= medicine_quantity-'" + quantity+ "' where id='" + medicineId + "'");
			}
			
			if (orderMedicine > 0) {
				String message="Thank you for your order.";
				hs.setAttribute("success", message);
				response.sendRedirect("customer-cart.jsp");
			} else {
				response.sendRedirect("customer-cart.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

}
