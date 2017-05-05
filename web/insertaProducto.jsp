<%-- 
    Document   : insertaProducto
    Created on : 04-may-2017, 12:43:00
    Author     : ALUMNO IG
--%>

<%@page import="almacen.Modelo"%>
<%@page import="almacen.Fichero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
            int idProducto;
            String nombre=request.getParameter("nombre");
            String descripcion=request.getParameter("descripcion");
            float precio;
            String fecha=request.getParameter("fecha");
            String respuesta;
           
            try{
                Fichero f = new Fichero("fichero.bin","ab");
                  
                if(nombre==null 
                        || descripcion==null 
                        || request.getParameter("precio") == null
                        || request.getParameter("fecha") == null
                        || request.getParameter("idProducto") == null
                        )
                {
                    respuesta="Alguno de los campos quedó sin rellenar";
                }
                else{
                    idProducto = Integer.parseInt(request.getParameter("idproducto"));
                    precio=Float.parseFloat(request.getParameter("precio"));
                    f.escribirObjeto(new Modelo(idProducto,nombre,descripcion,precio,fecha));
                    respuesta="Se insertó con éxito";
                    
                }
                f.close();
            }catch(NumberFormatException nfe){
                respuesta="Error en los numeros";
            }
    %>
    <body>
        <h1>Hello World!</h1>
        <form action="insertaProducto.jsp" method="POST">
            Id Producto: <input type="number" name="idproducto"><br>
            Nombre: <input type="text" name="nombre"><br>
            Descripcion: <input type="text" name="descripcion"><br>
            Precio: <input type="number" name="precio"><br>
            Fecha de entrada: <input type="text" name="fecha"><br>
            <input type="submit" value="Nuevo Producto">
        </form>
    </body>
</html>
