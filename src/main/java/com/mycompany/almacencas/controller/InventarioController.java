/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.almacencas.controller;

import com.mycompany.almacencas.modelo.dao.MotivoDAO;
import com.mycompany.almacencas.modelo.dao.ProductoDAO;
import com.mycompany.almacencas.modelo.dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import com.google.gson.Gson; // Dependencia Gson
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.stream.Collectors;

/**
 *
 * @author Vianey
 */
public class InventarioController extends HttpServlet {

    private ProductoDAO productoDAO = new ProductoDAO();
    private MotivoDAO motivoDAO = new MotivoDAO();
    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    private final String inventarioPagina = "/View/Alma/Inventario.jsp";
    private final String salidaPagina = "/View/Alma/Salida.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "inventario":
                inventario(request, response);
                break;
            case "salida":
                salida(request, response);
                break;
            case "darsalida":
                darsalida(request, response);
                break;
            default:
                throw new AssertionError();

        }
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

    private void inventario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("productos", productoDAO.AllProducts(2));
        request.getRequestDispatcher(inventarioPagina).forward(request, response);

    }

    private void salida(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("motivos", motivoDAO.AllMotivos());
        request.setAttribute("usuarios", usuarioDAO.AllUsers());
        request.setAttribute("productos", productoDAO.AllProducts(2));
        request.getRequestDispatcher(salidaPagina).forward(request, response);
    }

    private void darsalida(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        String jsonString = request.getReader().lines().collect(Collectors.joining());
        Gson gson = new Gson();
        Object jsonObject = gson.fromJson(jsonString, Object.class); // Parsear el JSON
        int x = 0;
    }

}
