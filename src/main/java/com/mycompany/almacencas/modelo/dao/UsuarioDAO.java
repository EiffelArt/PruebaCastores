/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.almacencas.modelo.dao;

import com.mycompany.almacencas.config.Conexion;
import com.mycompany.almacencas.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Vianey
 */
public class UsuarioDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public ArrayList<Usuario> AllUsers(){
        ArrayList<Usuario> list = new ArrayList<>();
        try{
            cn = Conexion.getConnection();
            String query = "select * from usuarios";
            ps = cn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuario usr = new Usuario();
                usr.setId(rs.getInt("idUsuario"));
                usr.setNombre(rs.getString("nombre"));
                usr.setCorreo(rs.getString("correo"));
                list.add(usr);
            }
        } catch(Exception ex){
            System.out.println("Errooooooooooooooor" + ex.toString());
            ex.printStackTrace();
        } finally{
            try{
                if(cn != null){
                    cn.close();
                }
                if(rs != null){
                    rs.close();
                }
                if(ps != null){
                    ps.close();
                }

            } catch(Exception ex){
                System.out.println("Exxxxxxxxxx: " + ex.getMessage().toString());
            }
        }
        return list;
    }
    public Usuario validar(Usuario user) throws Exception{
        Usuario us = null;
        try{
            cn = Conexion.getConnection();
            String query = "SELECT u.idUsuario, u.correo, u.nombre, r.nombre as nombre_r FROM usuarios u INNER JOIN rol r ON u.idRol = r.idRol WHERE u.estatus = 1 and u.correo = '" + user.getCorreo() + "' and u.contrasena = '"+ user.getContrasena() +"' ";
            ps = cn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next() == true){
                us = new Usuario();
                us.setId(rs.getInt("idUsuario"));
                us.setCorreo(rs.getString("correo"));
                us.setNombre(rs.getString("nombre"));
                us.setNombreRol(rs.getString("nombre_r"));
            }
            
        } catch(Exception ex){
            System.out.println("Error: " + ex.getMessage());
        } finally{
            try{
                if(cn != null){
                    cn.close();
                }
                if(rs != null){
                    rs.close();
                }
                if(ps != null){
                    ps.close();
                }

            } catch(Exception ex){
                System.out.println("Ex: " + ex.getMessage().toString());
            }

        }
        return us;
    }
}
