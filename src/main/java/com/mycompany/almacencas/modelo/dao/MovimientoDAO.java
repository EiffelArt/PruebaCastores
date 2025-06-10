/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.almacencas.modelo.dao;

import com.mycompany.almacencas.config.Conexion;
import com.mycompany.almacencas.modelo.Motivo;
import com.mycompany.almacencas.modelo.Movimiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Vianey
 */
public class MovimientoDAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int Nuevo(Movimiento obj) {
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String query = "INSERT INTO motivo (fec_mov, cantidad, user_mod , idUsuPrestamo , idTipoMov , idProducto , idMotivo ) VALUES"
                    + " (GETDATE(), ?, ?, ?, ?, ?, ?)";
            ps = cn.prepareStatement(query);
            ps.setInt(1, obj.getCantidad());
            ps.setInt(2, obj.getUser_mod());
            ps.setInt(3, obj.getIdUsuPrestamo());
            ps.setInt(4, obj.getIdMotivo());
            ps.setInt(5, obj.getIdProducto());
            ps.setInt(6, obj.getIdTipoMov());
            result = ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error ProductoDAO Linea 82: " + ex.getMessage());
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }

            } catch (Exception ex) {
                System.out.println("Error: " + ex.getMessage().toString());
            }
        }
        return result;
    }
}
