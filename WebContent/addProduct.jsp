<!Doctype html>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<%@page import="com.cognizant.bean.VendorProductbean"%>
<%@page import="com.cognizant.bean.VendorLoginBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<html>

<head>

<link rel="Stylesheet" href="styles\styles.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
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
<title>Vendor-Add Product</title>
<meta charset="utf-8">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="top-nav">
			<span class="name">GRIZZLY</span>&nbsp;&nbsp;&nbsp; <img id="img1"
				src="images\Capture.JPG" alt="logo" /> &nbsp;&nbsp;&nbsp; <span
				class="name">STORE<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="search" placeholder="Search"
					name="search2"><i class="fa fa-search"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<a class="notification"> <i class="fas fa-bell"
						style="font-size: 20px; color: grey; position: relative; left: 500px;"></i>
						<span class="badge"> </span>
				</a> <%
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
				<%
					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>
			</table>
		</article>
	</section>
	<section class="tab" class="container-fluid">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				href="addProduct.jsp" role="tab">PRODUCTS</a></li>
			<li class="nav-item"><a class="nav-link" href="inventory.jsp"
				role="tab">INVENTORY</a></li>

		</ul>
		<section class="productlist">

			<form method="get" action="">

				<select style="text-align: center;" class="actionlist">
					<option>Choose Action
					<option value="Internet Explorer">Internet Explorer
					<option value="Firefox">Firefox
					<option value="Chrome">Chrome
					<option value="Opera">Opera
					<option value="Safari">Safari
				</select>&nbsp;&nbsp;&nbsp; <input type="text" class="actionlist"
					style="width: 250px; color: black;"
					placeholder="Product Name/ID..." name="cate-search"><i
					class="fa fa-search"></i>&nbsp;&nbsp;&nbsp; <select
					class="actionlist">
					<option>Sort By</option>
					<option value="Time">Time
					<option value="Name">Name
					<option value="Date">Date
				</select>
				<button type="button" class="actionlist" onclick="location.href='add.jsp'"
					style="float: right; width: 200px; height: 40px; background-color: black; color: white;">Add
					Product</button>
			</form>
			<div class="scrollbar scrollbar-primary">
				<div class="force-overflow">

					<form>
						<%
							try {
								Vendor_ProductDao vendorprod = new Vendor_ProductDao();
								List<VendorProductbean> vendor = new ArrayList<VendorProductbean>();
								vendor = vendorprod.readALL();
						%>
						<table id="pro-list-table" class="table">
							<thead>
								<tr id="clr">
									<th><label>Products List</label></th>
									<th><label>ID</label></th>
									<th><label>Brand</label></th>
									<th><label>Category</label></th>
									<th><label id="rating">Offer</label></th>
									<th style="border-right: 0px;"></th>
								</tr>
							</thead>

							<%
								for (VendorProductbean l : vendor) {
							%>
							<tr>
								<td class="round"><input type="checkbox" id="checkbox" /><label
									for="checkbox"></label><span style="margin-left: 10px;"><%=l.getProduct_name()%></span></td>
								<td><%=l.getProduct_id()%></td>
								<td><%=l.getBrand()%></td>
								<td><%=l.getCategory()%></td>
								<td id="rating"><%=l.getOffer()%></td>
								<td style="border-right: 0px;"><input class="op"
									type="button" name="view" value="View"
									onclick="location.href='viewProduct.jsp?product_name=<%=l.getProduct_name()%>'" />
									<input class="op" type="button" name="logout" value="Remove"
									onclick="location.href='remove.jsp?product_name=<%=l.getProduct_name()%>'" /></td>
							</tr>
							<!--    <tr>
               <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Shaver</span></td>
                <td>BS6785</td>
                <td>Braun</td>
                <td>Personal Care</td>
                <td id="rating">4.8</td>
                <td style="border-right: 0px;"><input class="op" type="submit" name="view" value="View">
                    
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
               <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Macbook Pro</span></td>
                 <td>MAC4567</td>
                <td>Apple</td>
                <td>Laptops</td>
                <td id="rating">4.9</td>
                <td style="border-right: 0px;"><input class="op" type="submit" name="view" value="View">
                    
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
                <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">iMac 27"</span></td>
                 <td>IMAC3452</td>
                <td>Apple</td>
                <td>Laptops</td>
                <td id="rating">4.6</td>
                <td style="border-right: 0px;"><input class="op" type="submit" name="view" value="View">
        
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
                <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Micron Pens</span></td>
                 <td>SPMP345</td>
                <td>Sakura Pigma</td>
                <td>Art Supplies</td>
                <td id="rating">4.1</td>
                <td style="border-right: 0px;"><input class="op" type="submit" name="view" value="View">
                    
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr>
            <tr>
              <td class="round"><input type="checkbox" id="checkbox" /><label for="checkbox"></label><span style="margin-left: 10px ; ">Paint Markers</span></td>
                 <td>PMC4567</td>
                <td>Copic</td>
                <td>Art Supplies</td>
                <td id="rating">4.2</td>
                <td style="border-right: 0px;"><input class="op" type="submit" name="view" value="View">
                    
                    <input class="op" type="submit" name="logout" value="Remove"></td>
            </tr> -->
							<%
								}
								} catch (Exception e) {
									out.println(e.getMessage());
								}
							%>
						</table>
					</form>
				</div>
			</div>


		</section>
	</section>

</body>

</html>