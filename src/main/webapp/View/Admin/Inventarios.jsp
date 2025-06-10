<%-- 
    Document   : Inventarios
    Created on : 9 jun. 2025, 22:12:22
    Author     : Vianey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
            <jsp:include page="Menu.jsp"></jsp:include>
        <div class="container-fluid mt-3">
            <div class="card">
                <div class="card-header">
                    <h4>Existencias en Inventario
                            <button class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"><i class="fa fa-plus-circle"></i> Entrada</button>

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
        <!-- MODAL -->
        <div class="modal fade" data-bs-backdrop="static" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Entrada a Inventario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductoController?action=invguardar" method="post">
                            <div class="mb-3">
                                <label for="nombre" class="col-form-label">Producto</label>
                                <select name="idProducto" class="form-control" id="idProducto">
                                    <c:forEach items="${productos}" var="item">
                                        <option value="${item.idProducto}">${item.nombre}</option>
                                    </c:forEach>
                                </select>

                            </div>
                            <div class="mb-3">
                                <label for="cantidad" class="col-form-label">Cantidad</label>
                                <input type="number" min="1" onkeypress="return event.charCode >= 48" pattern="^[0-9]+" class="form-control" id="cantidad" name="cantidad">
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- TERMINA MODAL -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    </body>
</html>
