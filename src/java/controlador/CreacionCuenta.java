/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ConexionBD;

/**
 *
 * @author yovas
 */
@WebServlet(name = "CreacionCuenta", urlPatterns = {"/CreacionCuenta"})
public class CreacionCuenta extends HttpServlet {

    private String username;
    private String email;
    private String password;
    private String fechaNac;
    private String optionsRadios;
    private HttpSession session;
    private final Properties properties = new Properties();
    private String passwordMail;
    private Session sessionMail;

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

        session = request.getSession();

        if (session.getAttribute("validaCorreo") != null) {
            validaCorreo(request, response);
        } else {
            crearCuenta(request, response);
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

    private void crearCuenta(HttpServletRequest request, HttpServletResponse response) throws IOException {
        username = request.getParameter("username");
        email = request.getParameter("email");
        password = request.getParameter("password");
        fechaNac = request.getParameter("fechaNac");
        optionsRadios = request.getParameter("optionsRadios");

        try {

            ConexionBD conexion = new ConexionBD("facebar", "postgres", "postgres");
            conexion.conectarBD();
            ResultSet consulta = conexion.consultarBD("SELECT * FROM usuarios "
                    + "WHERE correoelectronico='" + email + "';");
            
            if (consulta.next()) {
                enviarCorreo(request,response,consulta.getString("contrasenia"));
                session.setAttribute("correoEnviado", email);
                response.sendRedirect("EntradaIH.jsp");
            } else {
                conexion.insertarBD("INSERT INTO usuarios VALUES('"
                        + email + "','"
                        + username + "','"
                        + password + "',DEFAULT,'"
                        + fechaNac + "','"
                        + optionsRadios + "',DEFAULT);");
                conexion.desconectarBD();
                enviarCorreo(request, response, password);
                session.setAttribute("correoEnviado", email);
                response.sendRedirect("EntradaIH.jsp");
            }
        } catch (ClassNotFoundException ex) {
            session.setAttribute("errorControlador", ex.getMessage());
            response.sendRedirect("EntradaIH.jsp");
        } catch (SQLException ex) {
            session.setAttribute("errorConexion", ex.getMessage());
            response.sendRedirect("EntradaIH.jsp");
        }
    }

    private void validaCorreo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        email = (String) session.getAttribute("validaCorreo");
        session.removeAttribute("validaCorreo");
        try {
            ConexionBD conexion = new ConexionBD("facebar", "postgres", "postgres");
            conexion.conectarBD();
            conexion.actualizarBD("UPDATE usuarios SET status='A'"
                    + " WHERE correoElectronico ='"
                    + email + "';");
            conexion.desconectarBD();
            session.setAttribute("bienvenido", email);
            response.sendRedirect("EntradaIH.jsp");
        } catch (ClassNotFoundException ex) {
            session.setAttribute("errorControlador", ex.getMessage());
            response.sendRedirect("EntradaIH.jsp");
        } catch (SQLException ex) {
            session.setAttribute("errorConexion", ex.getMessage());
            response.sendRedirect("EntradaIH.jsp");
        }
    }

    private void enviarCorreo(HttpServletRequest request, HttpServletResponse response, String password) {
        initMail();
        sendEmail(password);
    }

    private void initMail() {
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", 587);
        properties.put("mail.smtp.mail.sender", "cthulhucompany@gmail.com");
        properties.put("mail.smtp.user", "cthulhucompany@gmail.com");
        properties.put("mail.smtp.auth", "true");

        sessionMail = Session.getDefaultInstance(properties);
        sessionMail.setDebug(true);
    }

    public void sendEmail(String password) {
        try {
            MimeMessage message = new MimeMessage(sessionMail);
            message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("Cuenta de faceBar");
            message.setText("Estimado usuario de faceBar para activar su cuenta acceda al siguiente hipervínculo\n\n"
                    + "http://localhost:8080/facebar3.0/EntradaIH.jsp?validaCorreo="+email
                    + "\n\nTu usuario es: \t\t" + email
                    + "\nTu contraseña es: \t" + password);
            Transport t = sessionMail.getTransport("smtp");
            t.connect((String) properties.get("mail.smtp.user"), "delirable");
            t.sendMessage(message, message.getAllRecipients());
            t.close();
        } catch (MessagingException ex) {
            Logger.getLogger(CreacionCuenta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
