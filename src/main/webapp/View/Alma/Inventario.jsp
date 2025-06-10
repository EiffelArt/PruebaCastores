<%-- 
    Document   : Inventario
    Created on : 10 jun. 2025, 00:54:58
    Author     : Vianey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
            <jsp:include page="Menu.jsp"></jsp:include>
        <div class="container-fluid mt-3">
            <div class="card">
                <div class="card-header">
                    <h4>Existencias en Inventario
                    </h4>
                </div>
                <div class="card-body">
                    <jsp:include page="../Mensaje.jsp" />
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Codigo</th>
                                <th>Stock</th>                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productos}" var="item">
                                <tr class="bg-red">
                                    <td>${item.idProducto}</td>
                                    <td>${item.nombre}</td>
                                    <td>${item.descripcion}</td>
                                    <td>${item.codigo}</td>
                                    <td class="${item.existencia < item.cant_minima || item.existencia ==0  ? 'text-danger' : 'text-success'}">${item.existencia}</td>
                                    <td>${item.estatus == "A" ? "<i class='fa-solid fa-check text-success'></i>" : "<i class='fa-solid fa-xmark text-danger'></i>"}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${productos.size() == 0}">
                                <tr>
                                    <td colspan="5">No se encontraron registros</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>
