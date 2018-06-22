	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>

	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Regjsp</title>
	</head>
	<body>
	<%@ page import ="java.sql.*" %>
	<%@ page import ="javax.sql.*" %>
	<%@page import="java.io.InputStream"%>
	<%@page import="java.io.FileInputStream"%>
	<%@page import="java.io.File"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.Connection"%>
	<%
	String MDB=request.getParameter("mdb"); 
	String payroll=request.getParameter("payroll"); 
	String name=request.getParameter("name"); 
	String cost =request.getParameter("cost"); 
	String dept =request.getParameter("dept"); 
	String a1 =request.getParameter("a1"); 
	String a2 =request.getParameter("a2"); 
	String suburb =request.getParameter("suburb"); 
	String state =request.getParameter("state"); 
	String postcode =request.getParameter("postcode"); 
	String number =request.getParameter("number"); 
	String kin =request.getParameter("kin"); 
	String dob =request.getParameter("dob"); 
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb",
	"username","@password"); 
	Statement st= con.createStatement(); 
	ResultSet rs; 
	InputStream inputStream = null;
	Part filePart = request.getPart("photo");
	if (filePart != null) {
	            // debug messages
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());

	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	st.executeUpdate("insert into register(id,payroll,name,cost,dept,add1,add2,suburb,state,postcode,phno,kin,dob,reg_device,picture) values ('"+MDB+"','"+payroll+"','"+name+"','"+cost+"','"+dept+"','"+a1+"','"+a2+"','"+suburb+"','"+state+"','"+postcode+"','"+number+"','"+kin+"','"+dob+"','"+inputStream+"')"); 
	 
	out.println("Registered"); 


	%>
	<a href ="Login.html">Login</a><br/><br/>
	<a href="index.html">Home</a>
	</body>
	</html>
