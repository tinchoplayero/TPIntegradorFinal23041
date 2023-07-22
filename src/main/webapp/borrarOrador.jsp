<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.cac.db.ConexionDB" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="./css/bootstrap.css">
    <link rel="stylesheet" href="./css/miestilo.css">
    <title>Borrar Oradores</title>
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
                <a class="nav-link" href="#">La Conferencia</a>
                <a class="nav-link" href="#">Los Oradores</a>
                <a class="nav-link" href="#">El Lugar y La Fecha</a>
                <a class="nav-link" href="#">Conviertete en Orador</a>
                <a class="nav-link text-success" href="#">Ver Oradores</a>
                <a class="nav-link" href="tickets.html">Comprar Tickets</a>
              </div>
            </div>
          </div>
      </div>
    </nav>
		
    </header>
<body style="padding-top: 100px; min-height: 100vh">

<div class="container-fluid divisor" id="conv-orador">
    <div class="text-center">
        <p></p>
        <H2>Seguro que desea Borrar el siguiente Orador</H2>
    </div>
    <%
    int idOrador = Integer.parseInt(request.getParameter("id"));
    Connection cn = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        cn = new ConexionDB().conectar();
        st = cn.createStatement();
        String query = "SELECT * FROM inscriptos WHERE id = " + idOrador + ";";
        rs = st.executeQuery(query);

        if (rs.next()) {
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            String horario = rs.getString("horario");
            String tema = rs.getString("tema");
            int activo = rs.getInt("activo");

            // Verificar si se debe actualizar el valor de 'activo' a 2
            if (activo == 1 || activo == 0) {
                // Actualizar 'activo' a 2
                st.executeUpdate("UPDATE inscriptos SET activo = 2 WHERE id = " + idOrador);
            }
    %>
    <form class="row offset-2 col-8" action="oradores.jsp">
        <div class="col mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" class="form-control" placeholder="Nombre" id="nombreOrador" name="nombreOrador" value="<%= nombre %>">
        </div>
        <div class="col">
            <label class="form-label">Apellido</label>
            <input type="text" class="form-control" placeholder="Apellido" id="apellidoOrador" name="apellidoOrador" value="<%= apellido %>">
        </div>
        <div class="col mb-3">
            <label class="form-label">Horario</label>
            <select class="form-select" id="horarioOrador" name="horarioOrador" value="">
                <option selected><%= horario %> (Actual)</option>
                <option value="10:00 Hs">10:00 Hs</option>
                <option value="11:00 Hs">11:00 Hs</option>
                <option value="14:00 Hs">14:00 Hs</option>
                <option value="15:00 Hs">15:00 Hs</option>
                <option value="17:00 Hs">17:00 Hs</option>
                <option value="18:00 Hs">18:00 Hs</option>
            </select>
        </div>
        <div class="col">
            <label class="form-label">Tema</label>
            <input type="text" class="form-control" placeholder="Tema" id="temaOrador" name="temaOrador" value="<%= tema %>">
        </div>
        
		<div class="row align-items-start">
        	<div class="col">
        		<button type="submit" class="btn btn-danger">borrar</button>
        	</div>
        	<div class="col">
       			 <a href="javascript:history.back()" class="btn btn-primary">Volver</a>
        	</div>
        </div>
    </form>
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
