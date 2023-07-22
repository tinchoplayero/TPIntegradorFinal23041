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
	String nombre = request.getParameter("nombreOrador");
	String apellido = request.getParameter("apellidoOrador");
	String horario = request.getParameter("horarioOrador");
	String tema = request.getParameter("temaOrador");
	String tHorario = ""; 
		
	
	switch (horario) {
    case "1":
        horario = "10:00 Hs";
        break;
    case "2":
    	horario = "11:00 Hs";
        break;
    case "3":
    	horario = "14:00 Hs";
        break;
    case "4":
    	horario = "15:00 Hs";
        break;
    case "5":
    	horario = "17:00 Hs";
        break;
    case "6":
    	horario = "18:00 Hs";
        break;
	}
	
		
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try {
	Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oradores","root","");
	Statement stm = cn.createStatement();
	stm.executeUpdate("INSERT INTO inscriptos (nombre,apellido,horario,tema) VALUES ('"+nombre+"','"+apellido+"','"+horario+"','"+tema+"')");
	out.print("Cargado correctamente");
	}catch(Exception e){
		out.print("Error al cargar datos");
	}

%>
<jsp:include page="index.html"></jsp:include>



</body>
</html>