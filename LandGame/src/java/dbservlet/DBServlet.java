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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import queryclass.OnlinePlayer;
import queryclass.Played;
import queryclass.Ranking;
import service.ResultadoService;
import service.UsuariosService;

/**
 *
 * @author Pau
 */
public class DBServlet extends HttpServlet {

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

        //AIXÒ SOBRA!!!! S'HA D'AGAFAR DES DE DBLISTENER
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LandGamePU");
        EntityManager em = emf.createEntityManager();
        UsuariosService us = new UsuariosService(em);
        ResultadoService result = new ResultadoService(em);
        //Coje los valores para pasalos a la Base de Datos
        String ulog = request.getParameter("userlog");
        String plog = request.getParameter("passlog");
        //Es true si están en la Base de Datos
        if (us.checkLogin(ulog, plog) == true) {
            //Se crean las Cookies
            Cookie name = new Cookie("name", ulog);
            String codigoString = us.coduser(ulog);
            Cookie iduser = new Cookie("iduser", codigoString);
            name.setMaxAge(60 * 20);
            iduser.setMaxAge(60 * 20);
            response.addCookie(name);
            response.addCookie(iduser);

            ArrayList<Ranking> ran = result.getRanking();
            ArrayList<OnlinePlayer> op = result.getOnline();
            ArrayList<Played> play = result.getTopPlayed();
            request.setAttribute("name", ulog);
            request.setAttribute("ranking", ran);
            request.setAttribute("onlinelast", op);
            request.setAttribute("played", play);
            RequestDispatcher a = request.getRequestDispatcher("juego.jsp");
            a.forward(request, response);
        } else {
            //Mensaje de Error al no estar registrado el usuario o contraseña
            String respuesta = "User or password aren't in database";
            request.setAttribute("respuesta", respuesta);
            RequestDispatcher a = request.getRequestDispatcher("error.jsp");
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
    @Override /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("LandGamePU");
        EntityManager em = emf.createEntityManager();
        UsuariosService us = new UsuariosService(em);
        //Se recuperan el usuario y la contraseña
        String ulog = request.getParameter("usersign");
        String plog = request.getParameter("passsign");
        //Encripta la contraseña
        String encryptedPass = BCrypt.hashpw(plog, BCrypt.gensalt());
        //Si existe es true
        if (us.checkSignup(ulog) == false) {
            //Se añade el usuario
            us.adduser(ulog, encryptedPass);
            //se envía un mensaje para que el usuario sepa que se ha registrado
            String respuesta = "The user has been registered";
            request.setAttribute("respuesta", respuesta);
            RequestDispatcher a = request.getRequestDispatcher("error.jsp");
            a.forward(request, response);
        } else {
            //de existir el usuario introducido se envía un mensaje de error
            String respuesta = "The user is already registered";
            request.setAttribute("respuesta", respuesta);
            RequestDispatcher a = request.getRequestDispatcher("error.jsp");
            a.forward(request, response);
        }
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
