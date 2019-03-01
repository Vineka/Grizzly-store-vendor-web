<!Doctype html>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<%@page import="com.cognizant.bean.VendorProductbean"%>
<%@page import="com.cognizant.bean.VendorLoginBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>Vendor-Product Inventory</title>
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
				</a>
					<%
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
			<li class="nav-item"><a class="nav-link"
				href="addProduct.jsp" role="tab">PRODUCTS</a></li>
			<li class="nav-item"><a class="nav-link active" href="inventory.jsp"
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
			</form>
			<div class="scrollbar scrollbar-primary">
				<div class="force-overflow">
					<form method="GET" action="">
	<%
							try {
								Vendor_ProductDao vendorprod = new Vendor_ProductDao();
								List<VendorProductbean> vendor = new ArrayList<VendorProductbean>();
								vendor = vendorprod.readTable();
								
						%>
						<table id="pro-list-table" class="table">
							<thead>
								<tr id="clr">
									<th><label>Products List</label></th>
									<th><label>ID</label></th>
									<th><label>In Stock</label></th>
									<th><label>Req.</label></th>
									<th><label>Buffer</label></th>
									<th><label>Price/Item</label></th>
									<th><label>Pending</label></th>
									<th><label id="rating">Rating</label></th>
									<th style="border-right: 0px;"></th>
								</tr>
							</thead>
							<tbody>
							<% for(VendorProductbean v : vendor){  %>
								<tr>
									<td class="round"><input type="checkbox" id="checkbox" />
										<label for="checkbox"></label> <span
										style="margin-left: 10px;"><%=v.getProduct_name() %></span></td>
									<td><%=v.getProduct_id() %></td>
									<td style="background-color: #f2f2f2;" id="cen"><%=v.getInstock() %></td>
									<td style="background-color: #f2f2f2;" id="cen"><%if(v.getInstock() <= v.getBuffer()){
										int diff=v.getBuffer()-v.getInstock();
										out.println(diff);
									}
									else{
										out.println("0");
									}
										%></td>
								
									<td id="cen"><%=v.getBuffer() %></td>
									<td id="cen"><%=v.getPrice() %></td>
									<td id="rating"><%=v.getPending() %></td>
									<td id="rating"><%=v.getRating() %></td>
									<td style="border-right: 0px;"><input class="op"
										type="button" name="manage" value="Manage" onclick="location.href='edit.jsp?product_name=<%=v.getProduct_name()%>'"
										style="color: grey;"></td>
								</tr>
								<!-- <tr>
									<td class="round"><input type="checkbox" id="checkbox1" />
										<label for="checkbox1"></label> <span
										style="margin-left: 10px;">Shaver</span>
									<td>BS6785</td>
									<td id="cen">23</td>
									<td id="cen">0</td>
									<td id="cen">10</td>
									<td id="cen">4,700.00</td>
									<td id="rating">1</td>
									<td id="rating">4.8</td>
									<td style="border-right: 0px;"><input class="op"
										type="submit" name="manage" value="Manage"
										style="color: grey;"></td>
								</tr>
								<tr>
									<td class="round"><input type="checkbox" id="checkbox2" />
										<label for="checkbox2"></label> <span
										style="margin-left: 10px;">Macbook Pro</span>
									<td>MAC4567</td>
									<td id="cen">15</td>
									<td id="cen">0</td>
									<td id="cen">5</td>
									<td id="cen">1,53,000.00</td>
									<td id="rating">1</td>
									<td id="rating">4.9</td>
									<td style="border-right: 0px;"><input class="op"
										type="submit" name="manage" value="Manage"
										style="color: grey;"></td>
								</tr>
								<tr>
									<td class="round"><input type="checkbox" id="checkbox3" />
										<label for="checkbox3"></label> <span
										style="margin-left: 10px;">iMac 27"</span></td>
									<td>IMAC3452</td>
									<td id="cen">12</td>
									<td id="cen">0</td>
									<td id="cen">5</td>
									<td id="cen">97,000.00</td>
									<td id="rating">0</td>
									<td id="rating">4.6</td>
									<td style="border-right: 0px;"><input class="op"
										type="submit" name="manage" value="Manage"
										style="color: grey;"></td>
								</tr>

								<tr>
									<td class="round"><input type="checkbox" id="checkbox4" />
										<label for="checkbox4"></label> <span
										style="margin-left: 10px;">Micron Pens</span></td>
									<td>SPMP345</td>
									<td style="background-color: #f2f2f2;" id="cen">60</td>
									<td style="background-color: #f2f2f2;" id="cen">15</td>
									<td id="cen">75</td>
									<td id="cen">450.00</td>
									<td id="rating">4</td>
									<td id="rating">4.1</td>
									<td style="border-right: 0px;"><input class="op"
										type="submit" name="manage" value="Manage"
										style="color: grey;"></td>
								</tr>
								<tr>
									<td class="round"><input type="checkbox" id="checkbox5" />
										<label for="checkbox5"></label> <span
										style="margin-left: 10px;">Paint Markers</span></td>
									<td>PMC4567</td>
									<td style="background-color: #f2f2f2;" id="cen">45</td>
									<td style="background-color: #f2f2f2;" id="cen">15</td>
									<td id="cen">60</td>
									<td id="cen">4,200.00</td>
									<td id="rating">2</td>
									<td id="rating">4.2</td>
									<td style="border-right: 0px;"><input class="op"
										type="submit" name="manage" value="Manage"
										style="color: grey;"></td>
								</tr>

 -->							
							<% }
							} catch(Exception e){
							out.println(e.getMessage());
							}
							%>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</section>
	</section>

</body>

</html>