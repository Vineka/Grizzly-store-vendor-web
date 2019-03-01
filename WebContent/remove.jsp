<%@page import="com.cognizant.dao.Vendor_ProductDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Page</title>
</head>
<body>
<%
Vendor_ProductDao delDAO= new Vendor_ProductDao();
int status=0;
status = delDAO.delete(request.getParameter("product_name"));
if(status==0){
	out.println("Error While Deleting the Record");
}
else
{
	response.sendRedirect("addProduct.jsp");
}
%>
</body>
</html>