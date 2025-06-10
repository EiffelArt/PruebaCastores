<%-- 
    Document   : index
    Created on : 6 jun. 2025, 22:36:57
    Author     : Vianey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacen Castores</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <%--
        <%
            response.sendRedirect("UsuarioController?action=listar");
            %>
        --%>
<section class="vh-100" style="background-color: #f8f9fa;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <h3 class="mb-5">Inicio de Sesion</h3>
            <form action="srvValidar?action=validar" method="POST">
            <div data-mdb-input-init class="form-outline mb-4">
              <input type="email" id="correo" name="correo" class="form-control form-control-lg" />
              <label class="form-label" for="correo">Correo</label>
            </div>

            <div data-mdb-input-init class="form-outline mb-4">
              <input type="password" name="contrasena" id="contrasena" class="form-control form-control-lg" />
              <label class="form-label" for="contrasena">Password</label>
            </div>


            <input type="submit" value="Entrar" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg btn-block" type="submit">
            </form>
            <hr class="my-4">
          </div>
        </div>
      </div>
    </div>
  </div>
</section>        
        <!--
        <form action="srvValidar?action=validar" method="POST">
            <input type="text" name="correo" value="" class="form-control" placeholder="Correo">
            <input type="text" name="contrasena" value="" class="form-control" placeholder="Contraseña">
            <input type="submit" name="Validar" value="Validar">
        </form>-->
    </body>
</html>
