/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.almacencas.controller;

import com.mycompany.almacencas.modelo.Producto;
import com.mycompany.almacencas.modelo.dao.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Vianey
 */
public class ProductoController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductoDAO productoDAO = new ProductoDAO();
    private final String listarPagina = "/View/Admin/Productos.jsp";
    private final String nuevoPagina = "/View/Admin/NuevoProd.jsp";
    private final String inventarioPagina = "/View/Admin/Inventarios.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "listar":
                list(request, response);
                break;
            case "nuevo":
                nuevo(request, response);
                break;
            case "guardar":
                guardar(request, response);
                break;
            case "editar":
                editar(request, response);
                break;
            case "inventario":
                inventario(request, response);
                break;
            case "invguardar":
                invguardar(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("productos", productoDAO.AllProducts(1));
        request.getRequestDispatcher(listarPagina).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void nuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("producto", new Producto());
        request.getRequestDispatcher(nuevoPagina).forward(request, response);
    }

    private void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto obj = new Producto();
        obj.setIdProducto(Integer.parseInt(request.getParameter("idProducto")));
        obj.setNombre(request.getParameter("nombre"));
        obj.setDescripcion(request.getParameter("descripcion"));
        obj.setCodigo(request.getParameter("codigo"));
        obj.setCant_minima(Integer.parseInt(request.getParameter("cant_minima")));
        //obj.setPrecio(Double.parseDouble(request.getParameter("precio")));
        //int result = productoDAO.Nuevo(obj);
        int result;
        if (obj.getIdProducto() == 0) {
            result = productoDAO.Nuevo(obj);
        } else {
            result = productoDAO.Actualizar(obj);
        }
        if (result > 0) {
            request.getSession().setAttribute("success", "Registro guardado correctamente.");
            response.sendRedirect("ProductoController?action=listar") ;
        } else {
            request.getSession().setAttribute("error", "Error al guardar los datos.");
            request.setAttribute("producto", obj);
            request.getRequestDispatcher(nuevoPagina).forward(request, response);
        }
    }

    private void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idProducto"));
        Producto prd = productoDAO.BuscarID(id);
        if (prd != null) {
            request.setAttribute("producto", prd);
            request.getRequestDispatcher(nuevoPagina).forward(request, response);
        } else {
            request.getSession().setAttribute("error", "No se encontro un producto con el ID " + id);
            response.sendRedirect("ProductoController?action=listar");
        }
    }

    private void inventario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //request.setAttribute("listap", productoDAO.ListProducts());
        request.setAttribute("productos", productoDAO.AllProducts(2));
        request.getRequestDispatcher(inventarioPagina).forward(request, response);        
    }

    private void invguardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        if (cantidad <= 0){
            request.getSession().setAttribute("error", "Ingrese una cantidad valida.");
            response.sendRedirect("ProductoController?action=inventario");
        } else{
            request.getRequestDispatcher("inventario").forward(request, response);
        }
    }

}
