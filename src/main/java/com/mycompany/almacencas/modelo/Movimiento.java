/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.almacencas.modelo;

/**
 *
 * @author Vianey
 */
public class Movimiento {
    String fec_mov;
    int cantidad;
    int user_mod;
    String user_mod_nombre;
    int idUsuPrestamo ;
    String idUsuPrestamo_nombre ;
    int idTipoMov ;
    String idTipoMov_nombre ;
    int idProducto ;
    String idProducto_nombre ;
    String idMotivo_nombre ;
    int idMotivo ;

    public String getFec_mov() {
        return fec_mov;
    }

    public void setFec_mov(String fec_mov) {
        this.fec_mov = fec_mov;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getUser_mod() {
        return user_mod;
    }

    public void setUser_mod(int user_mod) {
        this.user_mod = user_mod;
    }

    public String getUser_mod_nombre() {
        return user_mod_nombre;
    }

    public void setUser_mod_nombre(String user_mod_nombre) {
        this.user_mod_nombre = user_mod_nombre;
    }

    public int getIdUsuPrestamo() {
        return idUsuPrestamo;
    }

    public void setIdUsuPrestamo(int idUsuPrestamo) {
        this.idUsuPrestamo = idUsuPrestamo;
    }

    public String getIdUsuPrestamo_nombre() {
        return idUsuPrestamo_nombre;
    }

    public void setIdUsuPrestamo_nombre(String idUsuPrestamo_nombre) {
        this.idUsuPrestamo_nombre = idUsuPrestamo_nombre;
    }

    public int getIdTipoMov() {
        return idTipoMov;
    }

    public void setIdTipoMov(int idTipoMov) {
        this.idTipoMov = idTipoMov;
    }

    public String getIdTipoMov_nombre() {
        return idTipoMov_nombre;
    }

    public void setIdTipoMov_nombre(String idTipoMov_nombre) {
        this.idTipoMov_nombre = idTipoMov_nombre;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getIdProducto_nombre() {
        return idProducto_nombre;
    }

    public void setIdProducto_nombre(String idProducto_nombre) {
        this.idProducto_nombre = idProducto_nombre;
    }

    public String getIdMotivo_nombre() {
        return idMotivo_nombre;
    }

    public void setIdMotivo_nombre(String idMotivo_nombre) {
        this.idMotivo_nombre = idMotivo_nombre;
    }

    public int getIdMotivo() {
        return idMotivo;
    }

    public void setIdMotivo(int idMotivo) {
        this.idMotivo = idMotivo;
    }
}
