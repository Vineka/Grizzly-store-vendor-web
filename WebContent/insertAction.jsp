

<%@page import="com.cognizant.bean.VendorProductbean"%>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Page</title>
</head>
<body>
	<%
	try{
		Vendor_ProductDao vp = new Vendor_ProductDao();
		VendorProductbean v = new VendorProductbean();
		v.setProduct_id(request.getParameter("product_id"));
		v.setProduct_name(request.getParameter("product_name"));
		v.setCategory(request.getParameter("category"));
		v.setDescription(request.getParameter("description"));
		v.setPrice(Float.parseFloat(request.getParameter("price")));
		int insertStatus = 0;
		insertStatus=vp.insert(v);
		if (insertStatus == 0) {
			out.println("Error While Inserting the data!!!");
		} else {
			response.sendRedirect("addProduct.jsp");
		}
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	%>
</body>
</html>