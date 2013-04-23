/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Estados;

/**
 *
 * @author samurai
 */
@WebServlet(name = "actualizacionEstado", urlPatterns = {"/actualizacionEstado"},initParams = {
 @WebInitParam(name = "texto", value = ""),@WebInitParam(name = "imagenURL", value = ""),@WebInitParam(name = "videoURL", value = "")})
public class actualizacionEstado extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // response.setContentType("text/xml");
            /* TODO output your page here. You may use following sample code. */
            
            
           
            out.print("exito");
            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String texto = request.getParameter("texto");
            String imagenURL = request.getParameter("imagenURL");
            String videoURL = request.getParameter("videoURL");
            
            /*Aqui se crea una instancia de el estado */
            Estados estado = new Estados();
            /*Se insertan los parametros */
            // To Do Incorporarlo con la sesión
            Date date = new Date();
            estado.setFechacreacion(date);
        HttpSession ses = request.getSession();
            String usuario_act = (String) ses.getAttribute("usuarioActual");
            /*PrintWriter out = response.getWriter();
            
            out.print(usuario_act);*/
            //
            estado.setPublicador(usuario_act);
            
            estado.setTexto(texto);
            estado.setEnlace(videoURL);
            estado.setFoto(imagenURL);
            /*Se persiste el dato */
            
            
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("Estado");
            EntityManager em = emf.createEntityManager();
            EntityTransaction tx = em.getTransaction();
            tx.begin();
            em.persist(estado);
            tx.commit();
            em.close();
            emf.close();
        
        
        
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
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
}
