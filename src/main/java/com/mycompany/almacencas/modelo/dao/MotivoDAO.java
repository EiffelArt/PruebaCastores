/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.almacencas.modelo.dao;

import com.mycompany.almacencas.config.Conexion;
import com.mycompany.almacencas.modelo.Motivo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Vianey
 */
public class MotivoDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ArrayList<Motivo> AllMotivos() { // 1 = todos sin filtros, 2 = solo activos
        ArrayList<Motivo> list = new ArrayList<>();
        try {
            cn = Conexion.getConnection();
            String query = "SELECT idMotivo, Descripcion FROM motivo";
            ps = cn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Motivo mot = new Motivo();
                mot.setIdMotivo(rs.getInt("idMotivo"));
                mot.setDescripcion(rs.getString("Descripcion"));
                list.add(mot);
            }
        } catch (Exception ex) {
            System.out.println("Error MotivoDAO Linea 37" + ex.toString());
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }

            } catch (Exception ex) {
                System.out.println("Error MotivoDAO Linea 52: " + ex.getMessage().toString());
            }
        }
        return list;
    }
}
