<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Oradores</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h1>Lista de Oradores</h1>

    <form method="post" action="soloMostrarOradores.jsp">
        <label for="nombre">Buscar por nombre:</label>
        <input type="text" id="nombre" name="nombre" placeholder="Ingrese el nombre">
        <input type="submit" value="Buscar">
    </form>

    <table>
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Tema</th>
        </tr>
        <%-- Establecer la conexión con la base de datos --%>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oradores", "root", "");

    
        String nombre = request.getParameter("nombre");

     
        if (nombre != null && !nombre.isEmpty()) {
           
            String query = "SELECT * FROM oradores WHERE nombre LIKE '%" + nombre + "%'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

         
            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getString("apellido") %></td>
                    <td><%= rs.getString("tema") %></td>
                </tr>
                <%
            }
            rs.close();
            stmt.close();
        } else {
          
            String query = "SELECT * FROM oradores";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

           
            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getString("apellido") %></td>
                    <td><%= rs.getString("tema") %></td>
                </tr>
                <%
            }
            rs.close();
            stmt.close();
        }

        // Cerrar la conexión y manejar las excepciones
        conn.close();
        %>
    </table>
</body>
</html>