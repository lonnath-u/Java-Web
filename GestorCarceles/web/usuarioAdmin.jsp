<%-- 
    Document   : index
    Created on : Dec 4, 2020, 4:16:14 PM
    Author     : USUARIO
--%>

<%@page import="Modelo.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    Usuario user = (Usuario)sesion.getAttribute("user");
    CarcelDAO carcelDAO = new CarcelDAO();
    Carcel tmpoCarcel = carcelDAO.getCarcel(user.getIdcarcel());
    MunicipioDAO tmpoMunicipio = new MunicipioDAO();
    DepartamentoDAO tmpoDepartamento = new DepartamentoDAO();
    Municipio tmpoMun = tmpoMunicipio.getMunicipio(tmpoCarcel.getId_municipio());  

%>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN</title>
        <link rel="stylesheet"  href="css/style.css">
    </head>
    <body>
        <div class="clase2 ">

            <ul class="nav justify-content-end clase6 ">
                <li class="nav-item ">
                    <a class="nav-link active text-white" href="Control?accion=cerrarSesion">Cerrar Sesion</a>
                </li>

            </ul>


            <table  class="clase4"><tr >
                    <td style="width: 10% ;" colspan="1" class="text-white"> Bienvenido</td>
                    <td style="width: 90%; "  colspan="2" class="text-white"><%=tmpoCarcel.getNombre() %> </td>
                </tr>  
                <tr >
                    <td colspan="1" style="width:33%;" class="text-white"> Direccion: <%=tmpoCarcel.getDireccion() %></td>
                    <td colspan="1" style="width:33%;" class="text-white"> Municipo: <%=tmpoMunicipio.nombreMunicipio(tmpoCarcel.getId_municipio()) %></td>
                    <td colspan="1" style="width:33%;" class="text-white"> Departamento: <%=tmpoDepartamento.getNombreDepartamento(tmpoMun.getId_departamento()) %> </td>
                </tr>  

            </table>
            <nav class="navbar navbar-light bg-light">
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Buscar por Cedula " aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
                
                <div class="justify-content-end"><a href="registrarUsuario.jsp" class="text-blue">AÑADIR<img src="imagenes/aniadir.png" class="rounded-circle" style="width: 100px; height: 50px;"></a></div>
            </nav>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Cedula</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Usuario</th>
                         <th scope="col">Password</th>
                         <th scope="col">Telefono</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                     
                    </tr>
                </thead>
                <tbody>
                     <%  
                        UsuarioDAO usuarios = new UsuarioDAO();
                        List<Usuario> listU = usuarios.getUsuarios(tmpoCarcel.getId());
                        Iterator<Usuario> iterU = listU.iterator();
                        Usuario tmpo = null;
                        while(iterU.hasNext()){
                            tmpo = iterU.next();
                        
                        
                    %>
                    <tr  id="<%=tmpo.getUsuario() %>">
                        <th scope="row"><%=tmpo.getCedula() %></th>
                        <td><%=tmpo.getNombre() %></td>
                        <td><%=tmpo.getApellido() %></td>
                        <td><%=tmpo.getUsuario() %></td>
                        <td><%=tmpo.getPassword() %></td>
                        <td><%=tmpo.getTelefono() %></td>
                 
                        <td><a href="Control?accion=modificarUser&user=<%=tmpo.getUsuario() %>">MODIFICAR</a></td>
                        <td><a href="Control?accion=eliminarUser&user=<%=tmpo.getUsuario() %>">ELIMINAR</a></td>
                    </tr>
                   
                    <%
                        }
                    %>
                </tbody>
            </table>


        </div>
        <div class = "clase1">

            <div class="list-group" >
                <a class="text-center clase6" href="#"><img src="imagenes\Homero.jpg" alt=""  style=" width: 60%; height: 60%; "class="rounded-circle"><div class="text-white text-center">Homero Simpson</div></a>
                <a class="list-group-item list-group-item-action text-center clase3 clase6 text-white dirStyle" href="#">USUARIOS</a>
                
            </div>
        </div>




        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

    </body>
</html>
