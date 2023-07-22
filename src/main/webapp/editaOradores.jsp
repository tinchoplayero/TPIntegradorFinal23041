<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Carga de Datos</title>
</head>
<body>
<%
    // Recibimos los datos del formulario
    int id = Integer.parseInt(request.getParameter("idOrador"));
    String nombre = request.getParameter("nombreOrador");
    String apellido = request.getParameter("apellidoOrador");
    String horario = request.getParameter("horarioOrador");
    String tema = request.getParameter("temaOrador");
    int activo = Integer.parseInt(request.getParameter("confirmaOrador"));
    
   

    Class.forName("com.mysql.cj.jdbc.Driver");

    try {
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oradores", "root", "");
        Statement stm = cn.createStatement();
        // Utilizamos el id recibido para la condición de actualización
        stm.executeUpdate("UPDATE inscriptos SET nombre='" + nombre + "', apellido='" + apellido + "', horario='" + horario + "', tema='" + tema + "', activo=" + activo + " WHERE id=" + id);
        out.print("Cargado correctamente");
    } catch (Exception e) {
    	e.printStackTrace();
    	out.print("Error al cargar datos id " + id + ": " + e.getMessage());
        
    }
%>
<jsp:include page="oradores.jsp"></jsp:include>
</body>
</html>
