<%-- 
    Document   : contacto
    Created on : 27/05/2022, 06:08:57 AM
    Author     : gamei
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 
        <link href="css.css" rel="stylesheet">
    </head>
    
    <body class="cuerpo" >
        
        <nav class="navbar bg-dark fixed-top">
    
    
  <div class="container-fluid"> <div class="container-fluid">
    <a class="navbar-brand text-white h5" href="#">
      <img src="img/logo.png" alt="" width="30" height="24" >
      Anima Project.
    </a>
  
      
    <a class="navbar-brand" href="#"></a>
     
    <button class="navbar-toggler text-white h5 " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon text-white h5"></span>
    </button>
    
    
    <div class="offcanvas offcanvas-end bg-dark text-white h5" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      
        
        <div class="offcanvas-header">
          
        <h5 class="offcanvas-title text-white h5" id="offcanvasNavbarLabel" >Anima Project Menu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
        
        
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 text-white h5">
          <li class="nav-item">
           <a class="nav-link active text-white h5" aria-current="page" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white h5" href="historia.html">Historia</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white h5" href="historia.html">Nosotros</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link text-white h5" href="newjsp.jsp">Contacto</a>
          </li>
         
         
        </ul>
      
      </div>
    </div>
  </div>
 </div>   
    
</nav>
        
        
        <div><p class="p">Contacto formulario</p></div>
    <center>
        <table width ="380px" class="tabla">
           
                <form action ="https://formspree.io/f/mnqwwveq" method="post">
            <tr>
                <td>
                    <div>
                        <label class="flabel">Nombres</label>
                        <input type="text" class="fcontrol " name="txtNombre" required>

                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <label class="flabel">Apellidos</label>
                        <input type="text" class="fcontrol" name="txtApellido" required>

                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <label class="flabel">Direccion</label>
                        <input type="text" class="fcontrol" name="txtDireccion" required>

                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <label class="flabel">Ciudad</label>
                        <input type="text" class="fcontrol" name="txtCiudad" required>

                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div>
                        <label class="flabel">Telefono</label>
                        <input type="number" class="fcontrol" name="txtTelefono" required>

                    </div>
                </td>
            </tr>
            <tr>
                <td><br>
                    <button type="submit" class="btn-uno" name="btningresar">Ingresar</button>
                </td>
            </tr>     
            </form>
        </table>
    </center>
    <%
            if (request.getParameter("btningresar") != null) {
                String nombre = request.getParameter("txtNombre");
                String apellido = request.getParameter("txtApellido");
                String direccion = request.getParameter("txtDireccion");
                String ciudad = request.getParameter("txtCiudad");
                String telefono = request.getParameter("txtTelefono");
                try {
                    Connection con=null;
                    Statement st=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/form?user=root&password=123456");
                    st = con.createStatement();
                    st.executeUpdate("insert into contactos (nombre,apellido,direccion,ciudad,telefono) values('"+nombre+"','"+apellido+"','"+direccion+"','"+ciudad+"','"+telefono+"');");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
</body>

</html>