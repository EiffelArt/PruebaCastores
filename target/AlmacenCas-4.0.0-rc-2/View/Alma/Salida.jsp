<%-- 
    Document   : Salida
    Created on : 10 jun. 2025, 00:29:52
    Author     : Vianey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salida de Material</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container-fluid mt-3">
                <div class="card">
                    <div class="card-header">
                        <h4>Salida de Materiales
                            <!--<a href="ProductoController?action=nuevo" class="btn btn-success float-end">
                            <i class="fa fa-plus-circle"></i>
                            Nuevo Producto</a>-->
                            <button type="button" class="btn btn-success float-end" onclick="confirmar()"><i class="fa fa-check-circle"></i> Confirmar Salida</button>
                        </h4>
                        <div class="row mb-1">
                            <div class="col-4">
                                <label for="idMotivo" class="col col-form-label">Motivo de Salida</label>
                                <div class="col">
                                    <select name="idMotivo" class="form-control" id="idMotivo">
                                        <option value="*">Seleccione Motivo</option>
                                    <c:forEach items="${motivos}" var="item">
                                        <option value="${item.idMotivo}">${item.descripcion}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <label for="almacen" class="col col-form-label">Almacen</label>
                            <div class="col">
                                <input value="General" type="text" class="form-control" id="almacen" name="almacen" disabled>
                            </div>
                        </div>
                        <div class="col-4">
                            <label for="idUsuario" class="col col-form-label">Colaborador</label>
                            <div class="col">
                                <select name="idUsuario" class="form-control" id="idUsuario">
                                    <option value="*">Seleccione Colaborador</option>
                                    <c:forEach items="${usuarios}" var="item">
                                        <option value="${item.id}">${item.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-1">
                        <div class="col-4">
                            <label for="idProducto" class="col col-form-label">Producto</label>
                            <div class="col">
                                <select name="idProducto" class="form-control" id="idProducto">
                                    <option value="*">Seleccione Producto</option>
                                    <c:forEach items="${productos}" var="item">
                                        <option value="${item.idProducto}">${item.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-4">
                            <label for="cantidad" class="col col-form-label">Cantidad</label>
                            <div class="col">
                                <input type="number" min="1" onkeypress="return event.charCode >= 48" pattern="^[0-9]+" class="form-control" id="cantidad" name="cantidad">
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="col">
                                <label for="cantidad" class="col col-form-label"> </label>
                                <button type="button" onclick="validar()" class="btn btn-info w-100"><i class="fa fa-plus-circle"></i> Agregar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-striped" id="tabla">
                        <thead>
                            <tr>
                                <th>ID Producto</th>
                                <th>Nombre</th>
                                <th>Motivo</th>
                                <th>Cantidad</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.min.js" integrity="sha384-RuyvpeZCxMJCqVUGFI0Do1mQrods/hhxYlcVfGPOfQtPJh0JCw12tUAZ/Mv10S7D" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

        <script type="text/javascript">
            let validar = function () {
                let idMotivo = $("#idMotivo").val();
                let idUsuario = $("#idUsuario").val();
                let idProducto = $("#idProducto").val();
                let cantidad = $("#cantidad").val();
                if(idMotivo == "*" || idUsuario == "*" || idProducto == "*" || cantidad <=0){
                    alert("Complete los campos");
                    return;
                }
                let content = "<tr>";
                content+= "<td>"+idProducto+"</td>";
                content+= "<td>"+$("#idProducto").find("option:selected").text()+"</td>";
                content+= "<td>"+$("#idMotivo").find("option:selected").text()+"</td>";
                content+= "<td>"+ cantidad +"</td>";
                content+= "<td><button class='btn btn-outline-danger quitar'><i class='fa fa-remove text-secondary'></i></button></td>";
                content+= "<td class='-none'>"+ idUsuario +"</td>";
                content+= "<td class='-none'>"+ idMotivo +"</td>";
                content+="</tr>";
                $("#tbody").append(content);
                
                $("#idProducto").val("*").trigger("change");
                $("#idMotivo").val("*").trigger("change");
                $("#cantidad").val("");
            };
            let confirmar = function() {
                let idUsuario = $("#idUsuario").val();
                if(idUsuario == "*"){
                    alert("Seleccione el Colaborador para esta Salida");
                }
                if ($("#tbody tr").length > 0){
                    var list = {
                        'datos' : []
                    };
                    const tabla = document.getElementById('tbody');
                    const filas = tabla.rows;
                    for (let i = 0; i < filas.length; i++) {
                        const fila = filas[i];
                        list.datos.push({
                                "cantidad": fila.cells[2].textContent,
                                "idUsuPrestamo": fila.cells[5].textContent,
                                "idTipoMov": "2",
                                "idMotivo": fila.cells[6].textContent
                            });
                    }
                    json = JSON.stringify(list);
                    var obj = JSON.parse(json); 
                    $.ajax({
                        type: "POST",
                        url: "InventarioController?action=darsalida", 
        data: obj,
        contentType: "application/json", 
        dataType: "json", 
        success: function(response) {
            console.log(response);
        },
        error: function(error) {
            // Manejar errores
            console.error(error);
        }
    });
                    console.log(obj);
                } else{
                    alert("Ingrese al menos un Producto");
                }
            }
            $(document).on("click", ".quitar", function(){
                $(this).closest("tr").remove();
            });


        </script>
    </body>
</html>
