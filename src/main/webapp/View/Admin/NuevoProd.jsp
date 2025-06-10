<%-- 
    Document   : NuevoProd.jsp
    Created on : 8 jun. 2025, 20:30:34
    Author     : Vianey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Producto</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <div class="container-fluid mt-3">
            <div class="card">
                <div class="card-header">
                    ${producto.idProducto == 0 ? "Nuevo " : "Actualizar" } Producto
                </div>
                <div class="card-body">
                    <form action="ProductoController?action=guardar" method="post">
                        <div class="row mb-3">
                            <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
                            <div class="col-sm-10">
                                <input value="${producto.nombre}" type="text" class="form-control" id="nombre" name="nombre">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="descripcion" class="col-sm-2 col-form-label">Descripcion</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="descripcion" id="descripcion" rows="3">${producto.descripcion}</textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="codigo" class="col-sm-2 col-form-label">Codigo</label>
                            <div class="col-sm-10">
                                <input value="${producto.codigo}" type="text" class="form-control" id="codigo" name="codigo">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="precio" class="col-sm-2 col-form-label">Precio</label>
                            <div class="col-sm-10">
                                <input value="${producto.precio}" type="numeric" class="form-control" id="precio" name="precio">
                            </div>
                        </div>
                        <input type="hidden" name="idProducto" value="${producto.idProducto}">
                        <button type="submit" class="btn btn-primary w-100">${producto.idProducto == 0 ? "Crear" : "Actualizar" }</button>
                    </form>
        </div>
    </body>
</html>
