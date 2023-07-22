<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carga de Datos</title>
</head>
<body>

<%
	
	String id = request.getParameter("idOrador");	
	String nombre = request.getParameter("nombreOrador");
	String apellido = request.getParameter("apellidoOrador");
	String horario = request.getParameter("horarioOrador");
	String tema = request.getParameter("temaOrador");
	String activo = request.getParameter("confirmaOrador");
		
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try {
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oradores","root","");
	Statement stm = cn.createStatement();
	stm.executeUpdate("UPDATE inscriptos SET nombre='" + nombre + "', apellido='" + apellido + "', horario='" + horario + "', tema='" + tema + "', activo=" + Integer.parseInt(activo) + " WHERE id=3" );
	out.print("Cargado correctamente");
	}catch(Exception e){
		out.print("Error al cargar datos id3");
	}

%>
<jsp:include page="oradores.jsp"></jsp:include>



</body>
</html>