package com.cognizant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import com.cognizant.bean.VendorProductbean;
import com.cognizant.bean.VendorLoginBean;

public class Vendor_ProductDao {
	public static Connection Connect() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/test";
		conn = DriverManager.getConnection(url, "root", "root");
		return conn;
	}

	public VendorLoginBean read(String Username) throws Exception {
		VendorLoginBean deptList = new VendorLoginBean();
		Connection conn = Connect();
		String readQuery = "select vendor_name,rating,address,mobile from vendordetails where vendor_name='" + Username
				+ "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			deptList.setVendor_name(rs.getString(1));
			deptList.setRating(rs.getFloat(2));
			deptList.setAddress(rs.getString(3));
			deptList.setMobile(rs.getLong(4));
		}
		conn.close();
		return deptList;
	}

	public List<VendorProductbean> readALL() throws Exception {
		List<VendorProductbean> ProdList = new ArrayList<VendorProductbean>();
		Connection conn = Connect();
		String readQuery = "select product.product_name,product.brand,product.category,product.product_id,vendor_quantity_table.offer from product join vendor_quantity_table on product.product_name = vendor_quantity_table.product_name";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			VendorProductbean prod = new VendorProductbean();
			prod.setProduct_name(rs.getString(1));
			prod.setBrand(rs.getString(2));
			prod.setCategory(rs.getString(3));
			prod.setProduct_id(rs.getString(4));
			prod.setOffer(rs.getString(5));
		
			ProdList.add(prod);
		}
		conn.close();
		return ProdList;
	}
	public VendorProductbean readProd(String pname) throws Exception {
		VendorProductbean deptList =new VendorProductbean();
		Connection conn = Connect();
		String readQuery = "select product_name,rating,brand,price,description from product where product_name='"+pname+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while(rs.next()) {
			deptList.setProduct_name(rs.getString(1));
			deptList.setRating(rs.getFloat(2));
			deptList.setBrand(rs.getString(3));
			deptList.setPrice(rs.getFloat(4));
			deptList.setDescription(rs.getString(5));
		}
		conn.close();
		return deptList;
	}
	public int delete(String pname) throws Exception {
		Connection conn=Connect();
		String deleteQuery = "delete from product where product_name='"+pname+"'";
		String del="delete from vendor_quantity_table where product_name='"+pname+"'";
		Statement stmt= conn.createStatement();
		Statement st=conn.createStatement();
		int delStatus=0;
		delStatus = stmt.executeUpdate(deleteQuery);
		delStatus = st.executeUpdate(del);
	return delStatus;
	}
	public List<VendorProductbean> readTable() throws Exception {
		List<VendorProductbean> ProdList = new ArrayList<VendorProductbean>();
		Connection conn = Connect();
		String readQuery = "select p.product_name,p.product_id,v.instock,v.buffer,p.price,v.pending,p.rating from product p join vendor_quantity_table v on p.product_name=v.product_name";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			VendorProductbean prod = new VendorProductbean();
			prod.setProduct_name(rs.getString(1));
			prod.setProduct_id(rs.getString(2));
			prod.setInstock(rs.getInt(3));
			prod.setBuffer(rs.getInt(4));
			prod.setPrice(rs.getFloat(5));
			prod.setPending(rs.getInt(6));
			prod.setRating(rs.getFloat(7));
			ProdList.add(prod);
			System.out.println(rs.getFloat(7));
		}
		conn.close();
		return ProdList;
	}
	public int update(VendorProductbean v) throws Exception{
		Connection conn=Connect();
		String updateQuery = "update vendor_quantity_table set instock=?,buffer=? where product_name=?";
		PreparedStatement pstmt= conn.prepareStatement(updateQuery);
		pstmt.setInt(1, v.getInstock());
		pstmt.setInt(2, v.getBuffer());
		pstmt.setString(3, v.getProduct_name());
		int updateStatus=0;
		updateStatus = pstmt.executeUpdate();
		System.out.print(updateStatus);
		conn.close();
	return updateStatus;
	}
	public VendorProductbean readEdit(String pname) throws Exception{
		Connection conn=Connect();
		String readQuery = "select product_name,instock,buffer from vendor_quantity_table where product_name='"+pname+"'";
		VendorProductbean v =new VendorProductbean();
		Statement stmt= conn.createStatement();
		ResultSet rs=stmt.executeQuery(readQuery);
		if(rs.next()) {
			v.setInstock(rs.getInt(2));
			v.setBuffer(rs.getInt(3));
			v.setProduct_name(rs.getString(1));
		}
		conn.close();
		return v;
	}
	public int insert(VendorProductbean prod) throws Exception{
		Connection conn=Connect();
		String insertQuery = "insert into product(product_id,category,product_name,description,price) values(?,?,?,?,?)";
		String insertQ="insert into vendor_quantity_table(product_name) values(?)";
			PreparedStatement pstmt= conn.prepareStatement(insertQuery);
			PreparedStatement ps = conn.prepareStatement(insertQ);
			pstmt.setString(1,prod.getProduct_id());
			pstmt.setString(2, prod.getCategory());
			pstmt.setString(3, prod.getProduct_name());
			pstmt.setString(4, prod.getDescription());
			pstmt.setFloat(5, prod.getPrice());	
			ps.setString(1, prod.getProduct_name());
			pstmt.executeUpdate();
			int insertStatus=0;
			insertStatus = ps.executeUpdate();
			conn.close();
		return insertStatus;
	}
}
