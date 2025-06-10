<%-- 
    Document   : Menu
    Created on : 10 jun. 2025, 00:03:25
    Author     : Vianey
--%>

<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><!--<i class="fa-solid fa-truck"></i>--> Almacen Castores</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <!--<li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>-->
                        <li class="nav-item">
                            <a class="nav-link" href="InventarioController?action=inventario">Inventario</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="InventarioController?action=salida">Salidas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" style="text-decoration: underline;" href="srvValidar?action=cerrar">Cerrar Sesion</a>
                        </li>
                        <!--
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Perfil
                          </a>
                          <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Cerrar Sesion</a></li>
                          </ul>
                        </li>-->
                    </ul>
                    <span class="navbar-text">
                        Almacenista - ${usuario.nombre} 
                    </span>
                </div>
            </div>
        </nav>