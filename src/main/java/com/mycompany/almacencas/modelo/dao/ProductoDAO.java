/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.almacencas.modelo.dao;

import com.mycompany.almacencas.config.Conexion;
import com.mycompany.almacencas.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Vianey
 */
public class ProductoDAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ArrayList<Producto> AllProducts(int tipo) { // 1 = todos sin filtros, 2 = solo activos
        String filtros="";
        ArrayList<Producto> list = new ArrayList<>();
        try {
            cn = Conexion.getConnection();
            if(tipo == 2){
                filtros = " Where p.estatus = 'A'";
            }
            String query = "SELECT p.nombre, p.descripcion, p.cant_minima, p.codigo, p.estatus, p.existencia, p.fec_creacion, p.foto, c.nombre as nombre_c, p.idProducto, p.precio, u.nombre as nombre_u, us.nombre as nombre_us FROM producto p INNER JOIN unidad u ON p.unidad_med = u.idUnidad INNER JOIN categoria c ON p.idCat = c.idCategoria INNER JOIN usuarios us ON p.user_creo = us.idUsuario " + filtros;
            ps = cn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto prd = new Producto();
                prd.setIdProducto(rs.getInt("idProducto"));
                prd.setNombre(rs.getString("nombre"));
                prd.setDescripcion(rs.getString("descripcion"));
                prd.setCant_minima(rs.getInt("cant_minima"));
                prd.setCodigo(rs.getString("codigo"));
                prd.setEstatus(rs.getString("estatus"));
                prd.setExistencia(rs.getInt("existencia"));
                prd.setFec_creacion(rs.getString("fec_creacion"));
                prd.setFoto(rs.getString("foto"));
                prd.setCategoria(rs.getString("nombre_c"));
                prd.setPrecio(rs.getDouble("precio"));
                prd.setUnidad(rs.getString("nombre_u"));
                prd.setUsuario(rs.getString("nombre_us"));
                list.add(prd);
            }
        } catch (Exception ex) {
            System.out.println("Errooooooooooooooor" + ex.toString());
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
                System.out.println("Exxxxxxxxxx: " + ex.getMessage().toString());
            }
        }
        return list;
    }
    public ArrayList<Producto> ListProducts() {
        ArrayList<Producto> list = new ArrayList<>();
        try {
            cn = Conexion.getConnection();
            String query = "SELECT p.idProducto, p.nombre FROM producto p";
            ps = cn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto prd = new Producto();
                prd.setIdProducto(rs.getInt("idProducto"));
                prd.setNombre(rs.getString("nombre"));
                list.add(prd);
            }
        } catch (Exception ex) {
            System.out.println("Errooooooooooooooor" + ex.toString());
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
                System.out.println("Exxxxxxxxxx: " + ex.getMessage().toString());
            }
        }
        return list;
    }
    public int Nuevo(Producto obj) {
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String query = "INSERT INTO producto (nombre, descripcion, codigo, foto, cant_minima, precio, existencia, estatus, fec_creacion, user_creo, unidad_med, idCat) VALUES"
                    + " (?, ?, ?, '', ?, 0, 0, 'A', NULL, 2, 1, 1)";
            ps = cn.prepareStatement(query);
            ps.setString(1, obj.getNombre());
            ps.setString(2, obj.getDescripcion());
            ps.setString(3, obj.getCodigo());
            ps.setInt(4, obj.getCant_minima());
            //ps.setDouble(5, obj.getPrecio());
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

    public Producto BuscarID(int idProducto) {
        Producto prd = null;
        try {
            cn = Conexion.getConnection();
            String query = "SELECT p.nombre, p.descripcion, p.cant_minima, p.codigo, p.estatus, p.existencia, p.fec_creacion, p.foto, c.nombre as nombre_c, p.idProducto, p.precio, u.nombre as nombre_u, us.nombre as nombre_us FROM producto p INNER JOIN unidad u ON p.unidad_med = u.idUnidad INNER JOIN categoria c ON p.idCat = c.idCategoria INNER JOIN usuarios us ON p.user_creo = us.idUsuario WHERE p.idProducto = ?";
            ps = cn.prepareStatement(query);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();
            while (rs.next()) {
                prd = new Producto();
                prd.setIdProducto(rs.getInt("idProducto"));
                prd.setNombre(rs.getString("nombre"));
                prd.setDescripcion(rs.getString("descripcion"));
                prd.setCant_minima(rs.getInt("cant_minima"));
                prd.setCodigo(rs.getString("codigo"));
                prd.setEstatus(rs.getString("estatus"));
                prd.setExistencia(rs.getInt("existencia"));
                prd.setFec_creacion(rs.getString("fec_creacion"));
                prd.setFoto(rs.getString("foto"));
                prd.setCategoria(rs.getString("nombre_c"));
                prd.setPrecio(rs.getDouble("precio"));
                prd.setUnidad(rs.getString("nombre_u"));
                prd.setUsuario(rs.getString("nombre_us"));
            }
        } catch (Exception ex) {
            System.out.println("Errooooooooooooooor" + ex.toString());
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
                System.out.println("Exxxxxxxxxx: " + ex.getMessage().toString());
            }
        }
        return prd;
    }
    public int Actualizar(Producto obj) {
        int result = 0;
        try {
            cn = Conexion.getConnection();
            String query = "UPDATE producto SET nombre =?, descripcion =?, codigo =?, cant_minima=?, precio=? "
                    + "WHERE idProducto=?";
            ps = cn.prepareStatement(query);
            ps.setString(1, obj.getNombre());
            ps.setString(2, obj.getDescripcion());
            ps.setString(3, obj.getCodigo());
            ps.setInt(4, (int) obj.getCant_minima());
            ps.setDouble(5, obj.getPrecio());
            ps.setInt(6, obj.getIdProducto());
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
