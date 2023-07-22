<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.cac.db.ConexionDB" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./css/bootstrap.css">
    <link rel="stylesheet" href="./css/miestilo.css">
    <title>Listado de Oradores</title>
</head>
 <header>
		<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img src="./assets/img/codoacodo.png" alt="Logo" width="100"  class="d-inline-block align-text-center">
          Conf en Bs As</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
          <div class="textoDerecha">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
              <div class="navbar-nav">
                <a class="nav-link" href="index.html">La Conferencia</a>
                <a class="nav-link" href="index.html#oradores">Los Oradores</a>
                <a class="nav-link" href="index.html#lugar">El Lugar y La Fecha</a>
                <a class="nav-link" href="index.html#conv-orador">Conviertete en Orador</a>
                <a class="nav-link text-success" href="#">Ver Oradores</a>
                <a class="nav-link" href="tickets.html">Comprar Tickets</a>
              </div>
            </div>
          </div>
      </div>
    </nav>
		
    </header>
<body style="padding-top: 100px; min-height: 100vh">
<div class="container">
    <h1>Listado de Oradores Confirmados</h1>
    <table class="table table-success table-striped">
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Horario</th>
            <th>Tema</th>
            <th>Activo</th>
            <th>Acciones</th>
            
        </tr>
        <%
        	
        	Connection cn = null;
            Statement st = null;
            ResultSet rs = null;
            
            
            	          
            try{    
            	
            	cn = new ConexionDB().conectar();
                st = cn.createStatement();
                String query = "SELECT * FROM inscriptos WHERE activo = 1 ORDER BY horario ASC;";
                rs = st.executeQuery(query);
               
                while (rs.next()) {
                	String id = rs.getString("id");
                    String nombre = rs.getString("nombre");
                    String apellido = rs.getString("apellido");
                    String horario = rs.getString("horario");
                    String tema = rs.getString("tema");
                    int activo = rs.getInt("activo");
        %>
        <tr>
            <td><%= nombre %></td>
            <td><%= apellido %></td>
            <td><%= horario %></td>
            <td><%= tema %></td>
            <td><%= activo %></td>
            <td><button type="button" onclick="location.href='editar.jsp?id=<%= id %>'" class="btn btn-success">Editar</button>
				<button type="button" onclick="location.href='borrarOrador.jsp?id=<%= id %>'" class="btn btn-danger">Borrar</button>
			</td>
        </tr>
        <%
                }
            } catch (SQLException e) {
            	out.print("Error");
                e.printStackTrace();
            } finally {
                // Cierro los recursos
                try {
                    if (rs != null) rs.close();
                    if (st != null) rs.close();
                    if (cn != null) cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
    
    
    
    
       <h1>Listado de Oradores NO Confirmados</h1>
    <table class="table table-primary table-striped">
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Horario</th>
            <th>Tema</th>
            <th>Activo</th>
            <th>Acciones</th>
            
        </tr>
        <%
        	
        	
            
            	          
            try{    
            	
            	cn = new ConexionDB().conectar();
                st = cn.createStatement();
                String query = "SELECT * FROM inscriptos WHERE activo = 0 ORDER BY horario ASC;";
                rs = st.executeQuery(query);
               
                while (rs.next()) {
                	String id = rs.getString("id");
                    String nombre = rs.getString("nombre");
                    String apellido = rs.getString("apellido");
                    String horario = rs.getString("horario");
                    String tema = rs.getString("tema");
                    int activo = rs.getInt("activo");
        %>
        <tr>
            <td><%= nombre %></td>
            <td><%= apellido %></td>
            <td><%= horario %></td>
            <td><%= tema %></td>
            <td><%= activo %></td>
            <td><button type="button" onclick="location.href='editar.jsp?id=<%= id %>'" class="btn btn-success">Editar</button>
				<button type="button" onclick="location.href='borrarOrador.jsp?id=<%= id %>'" class="btn btn-danger">Borrar</button>
			</td>
        </tr>
        <%
                }
            } catch (SQLException e) {
            	out.print("Error");
                e.printStackTrace();
            } finally {
                // Cierro los recursos
                try {
                    if (rs != null) rs.close();
                    if (st != null) rs.close();
                    if (cn != null) cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
			    <div class="container">
			  <div class="row ">
			    <div class="col">
			      <button type="button" onclick="location.href='eliminados.jsp'" class="btn btn-danger">Ver eliminados</button>
			    </div>
			    </div>
			  </div>
</div>			
</body>
<footer class="mt-3 estilo-footer" >
        <div class="container text-center ">
            <div class="row align-items-center">
                <div class="col">
                  Preguntas Frecuentes
                </div>
                <div class="col">
                  Contáctanos
                </div>
                <div class="col">
                  Prensa
                </div>
                <div class="col">
                  Conferencias
                </div>
                <div class="col">
                  Terminos y condiciones
                </div>
                <div class="col">
                  Privacidad
                </div>
                <div class="col">
                  Estudiantes
                </div>
            </div>
          </div>
        </footer>
</html>
