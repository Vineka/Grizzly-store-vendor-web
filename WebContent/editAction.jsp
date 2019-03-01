<%@page import="com.cognizant.bean.VendorProductbean"%>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Action PAge</title><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
<%
	try{
		Vendor_ProductDao vp = new Vendor_ProductDao();
		VendorProductbean v = new VendorProductbean();
		v.setProduct_name(request.getParameter("product_name"));
		v.setInstock(Integer.parseInt(request.getParameter("instock")));
		v.setBuffer(Integer.parseInt(request.getParameter("buffer")));
		int status = 0;
		status=vp.update(v);
		if (status == 0) {
			out.println("Error While Updating the data!!!");
		} else {
			response.sendRedirect("inventory.jsp");
		}
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	%>
</body>
</html>