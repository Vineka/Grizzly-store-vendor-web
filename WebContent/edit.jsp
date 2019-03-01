<%@page import="com.cognizant.bean.VendorProductbean"%>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
	<h1 align="center">Edit The Quantity</h1></br></br>
	<form method="get" action="editAction.jsp">
	
	<%
	String pname=request.getParameter("product_name");
	Vendor_ProductDao vp = new Vendor_ProductDao();
	VendorProductbean v = vp.readEdit(pname);
	%>
	<table align="center" class="table-responsive-lg" border="1"> 
		<thead  ><tr>
			<th>Quantity Field</th>
			<th>Value</th>
		</tr></thead>
		<tr><td>Product Name</td><td><input type="text" name="product_name" value="<%=v.getProduct_name() %>"  readonly="readonly"></td></tr>
		<tr><td>InStock</td><td><input type="number" name="instock" value="<%= v.getInstock() %>"  /></td></tr>
		<tr><td>Buffer</td>	<td><input type="number" name="buffer" value="<%= v.getBuffer() %>" ></td></tr>
		<tr>
		<td><input type="reset"  value="Clear"></td>
		<td><input type="submit"  value="Update"></td>
		</tr>
	</table>	
	</form>
</body>
</html>