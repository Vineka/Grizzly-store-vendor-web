<!Doctype html>
<%@page import="com.cognizant.bean.VendorLoginBean"%>
<%@page import="com.cognizant.bean.VendorProductbean"%>
<%@page import="com.cognizant.dao.Vendor_ProductDao"%>
<html>

<head>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
    <link rel="Stylesheet" href="styles\styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
        crossorigin='anonymous'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
        crossorigin="anonymous">

    <title>Admin-View Product</title>
    </title>
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
<span class="badge"> </span>
</a>
<%
try {
	HttpSession ses=request.getSession();
		Vendor_ProductDao vp = new Vendor_ProductDao();
		VendorLoginBean v = vp.read(ses.getAttribute("vendor_name").toString());
 %>
<span style="margin-left: 500px;">Welcome, <%=v.getVendor_name() %></span>
<a href="index.html"><input class="logot" type="submit" name="logout" value="Logout"></a>
</nav>

<section style="height: 650px;">
		<nav>
			<a class="profile">PROFILE</a> <a href="#" class="edit">Edit</a>

		</nav>
		<img src="images\logo.jfif" class="prf-img" style="top:40px;"
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
    <section class="img-coro">
     <%
 	try {
 		Vendor_ProductDao deptDAO = new Vendor_ProductDao();
 		String pname=request.getParameter("product_name");
 		VendorProductbean emp = new VendorProductbean();
 			emp=deptDAO.readProd(pname);
 		
 %>
        <b style="font-size: 25px;"><%=emp.getProduct_name() %></b>
<a style="font-size: 20px;">by <%=emp.getBrand() %></a>
<img style="width: 25px; height: 25px; margin-left: 15px; margin-top: 0px;" src="images\icon.png"/>
</br>
<span class="fa fa-star checked" style="color:lightgrey;"></span>&nbsp;<span style="color:grey;font-size: 18px;"> <%=emp.getRating() %> </span>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img style="width: 25px; height: 25px; top:20px; left: 20px; position: absolute; " src="images\icon.png"/>
<img src="images\204027-1.png  " class="d-block w-100" width="460px" height="455px" alt="Product Image Carousel">

<div class="carousel-caption">

    <h3 style="color: black;">Product Image Carousel</h3>
</div>
</div>
<div class="carousel-item">
    <img src="images\BT9280_15-IMS-en_IN.jfif" class="d-block w-100" width="460px" height="455px" alt="Product Image Carousel">
    <div class="carousel-caption">
        <h3 style="color: black;">Product Image Carousel</h3>
</div>
</div>
<div class="carousel-item">
    <img src="images\images.jfif" class="d-block w-100" width="460px" height="455px" alt="Product Image Carousel">
    <div class="carousel-caption">
        <h3 style="color: black;">Product Image Carousel</h3>
</div>
</div>
</div>
<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon"  style="height:455px; color:black; " aria-hidden="true"></span>
<span class="sr-only">Previous</span>
</a>
<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" style="height:455px; color:black;  " aria-hidden="true"></span>
<span class="sr-only">Next</span>
</a>
</div>
<div class="desp">
    <h3 >Product Description     
        <img style="width: 25px; height: 25px; margin-top: -2px; margin-left:15px;" src="images\icon.png"/></h3>
</br>
<p><%=emp.getDescription() %></p>
</br>


</br>
<p>
    <span style="font-weight:10px; font-size: 25px;">Rs.<%=emp.getPrice() %>/-    </span>15%off <img style="width: 25px; height: 25px; margin-top: -2px; margin-left:15px;" src="images\icon.png"/> </p>
<%
					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>
</div>
</section>
</section>
<section class="option">

    <input class="btn btn-primary btn-circle" style="background-color:black; border:none; border-radius: 48px; width: 110px;" type="submit" name="Finish" value="Finish" onclick="location.href='index.html'">
    <input class="btn btn-primary btn-circle" style="background-color:lightgrey; border:none; border-radius: 48px; width: 110px; position:relative; top: 20px;" type="reset" name="cancel" value="Cancel" color="black">
</section>

</body>

</html></html>