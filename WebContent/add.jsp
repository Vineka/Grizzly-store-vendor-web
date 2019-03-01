<!Doctype html>
<%@page import="com.cognizant.bean.VendorLoginBean"%>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<html>

<head>
<link rel="Stylesheet" href="styles\styles.css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


<link rel="stylesheet" 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="login.js"></script>
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Admin-Add Product</title>
<meta charset="utf-8">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		
        <div class="top-nav">
            <span class="name">GRIZZLY</span>&nbsp;&nbsp;&nbsp;
            <img id="img1" src="images\Capture.JPG" alt="logo" /> &nbsp;&nbsp;&nbsp;
            <span  class="name">STORE<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="search" placeholder="Search" name="search2"><i class="fa fa-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

         <a  class="notification">
 <i  class='fas fa-bell' style='font-size:20px; color: grey; position: relative; left: 450px;'></i>
<span class="badge" style="color:black;"> </span>
</a><%
 	try {

 		HttpSession ses = request.getSession();
 		Vendor_ProductDao vp = new Vendor_ProductDao();
 		VendorLoginBean v = vp.read(ses.getAttribute("vendor_name").toString());
 %> <span style="margin-left: 550px;">Welcome, <%=v.getVendor_name()%></span>
					<input class="logot" type="button"
					onclick="location.href='index.html'" name="logout" value="Logout"></a>
	</nav>


	<section style="height: 650px;">
		<nav>
			<a class="profile">PROFILE</a> <a href="#" class="edit">Edit</a>

		</nav>
		<img src="images\logo.jfif" class="prf-img" style="top: 40px;"
			alt="...">
		<article>

			</br>
			<h3 style="position: relative; top: 60px;" align="center">
				M/S
				<%=v.getVendor_name()%></h3>
			<table style="position: relative; top: 70px;" align="center">
				<tr>
					<td>
						<p align="center"
							style="color: grey; text-align: center; font-size: 13px;">
							<span class="fa fa-star checked"></span><%=v.getRating()%></br>
						</p>
					</td>
				</tr>

				<tr>
					<td align="center">
						<h6>Contact</h6>
					</td>
				</tr>
				<tr>
					<td align="center">
						<p style="font-size: 14px;"><%=v.getMobile()%></p>
					</td>
				</tr>
				<tr>
					<td align="center">
						<h6>Address</h6>
					</td>
				</tr>
				<tr>
					<td align="center">
						<p><%=v.getAddress()%></p>
					</td>
				</tr>
				<tr>
					<td align="center"><input type="submit"
						value="Contact Grizzly"
						style="border-radius: 45px; border: none; width: 200px; height: 32px; background-color: lightgrey;" />
					</td>
				</tr>
			</table>
		</article>
	</section>
	<section class="tab" class="container-fluid">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">PRODUCTS</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">VENDORS</a></li>
		</ul>
		<section class="product">
			<img style="margin-left: -12px; width: 620px; height: 620px;"
				src="images\addimage.JPG" />
		</section>
		<section class="enterdetails">

			<form method="get" action="insertAction.jsp">
				<input class="ent" type="text" name="product_id" color="black"
					placeholder="Enter Product ID" required="required" />
				<hr class="line">

				<select name="category" class="ent" style="overflow: scroll;">
					<option style="color: lightgrey;">Category</option>
					<option value="Electronics">Electronics</option>
					<option value="Appliances">Appliances
					<option value="Healthcare">Healthcare
					<option value="Furniture">Furniture
					<option value="Automobile">Automobile
					<option value="Personal Care">Personal Care
					<option value="Cloths">Cloths
					<option value="Laptops">Laptops
					<option value="Art Supplies">Art Supplies
				</select>
				<hr class="line">
				<input class="ent" type="text" name="product_name"
					required="required" color="black" placeholder="Name" />
				<hr class="line">
				<input class="ent" type="text" name="description"
					required="required" color="black" placeholder="Description" />
				<hr class="line">
				<input class="ent" type="text" name="price" required="required"
					color="black" placeholder="Price" />
				<hr class="line">
				<span><input  class="add" type="submit" name="add" value="Add"></span>
				</form>
				 <span><input onclick="location.href='addProduct.jsp'" class="cancel" type="submit" name="cancel"  value="Cancel" color="black"  onclick="location.href='listProducts.jsp?vendor_name=<%=v.getVendor_name()%>'">
</span>	
		</section>
	</section>
	<%
					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>
</body>

</html>