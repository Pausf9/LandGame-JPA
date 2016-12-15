/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbservlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import queryclass.OnlinePlayer;
import queryclass.Played;
import queryclass.Ranking;
import service.ResultadoService;
import service.UsuariosService;

/**
 *
 * @author Pau
 */
@WebServlet(name = "ServletCookies", urlPatterns = {"/ServletCookies"})
public class ServletCookies extends HttpServlet {

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

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LandGamePU");
        EntityManager em = emf.createEntityManager();
        UsuariosService us = new UsuariosService(em);
        ResultadoService result = new ResultadoService(em);       
        //Se recuperan las cookies y se almacenan en un array
        Cookie[] galletas = request.getCookies();
        //Se recupera el nombre del usuario
        String ulog = request.getParameter("namenick");
        try {
            //Se recupera el valor 
            for (int i = 0; i < galletas.length; i++) {
                String nomuser = galletas[i].getValue();
                //Se comprueba que el usuario sera igual
                if (us.checkSignup(nomuser) == true) {
                    ArrayList<Ranking> ran = result.getRanking();
                    ArrayList<OnlinePlayer> op = result.getOnline();
                    ArrayList<Played> play = result.getTopPlayed();                   
                    request.setAttribute("name", ulog);
                    request.setAttribute("ranking", ran);
                    request.setAttribute("onlinelast", op);
                    request.setAttribute("played", play);
                    RequestDispatcher a = request.getRequestDispatcher("juego.jsp");
                    a.forward(request, response);
                }
            }
            RequestDispatcher a = request.getRequestDispatcher("menu.jsp");
            a.forward(request, response);
        } catch (ServletException e) {
            RequestDispatcher a = request.getRequestDispatcher("menu.jsp");
            a.forward(request, response);
        } catch (IOException e) {
            RequestDispatcher a = request.getRequestDispatcher("menu.jsp");
            a.forward(request, response);
        }
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

}
