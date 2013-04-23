/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ConexionBD;

/**
 *
 * @author marcos
 */
@WebServlet(name = "InicioSesion", urlPatterns = {"/InicioSesion"})
public class InicioSesion extends HttpServlet {
    private HttpSession session;

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
        session = request.getSession();
        String user = request.getParameter("login_username");
        String passwd = request.getParameter("login_password");
        
        //boolean valido = validarEnBase(user, passwd);
        int validar = validoEnBase(user, passwd);
        //System.out.println(validar);
    /*    if(valido) {
            session.setAttribute("usuarioActual", user);
            session.setAttribute("bienvenida", user);
            response.sendRedirect("actualizacionPerfilIH.html");
        } else {
            //si se puede mandar un alert
            session.setAttribute("correoNoValido", user);
            response.sendRedirect("EntradaIH.jsp");
        }*/
        switch(validar){
            case 0:
                session.setAttribute("correoNoValido", user);
                response.sendRedirect("EntradaIH.jsp");
                break;
            case 1:
                session.setAttribute("contraseniaInvalida", passwd);
                response.sendRedirect("EntradaIH.jsp");
                break;
            case 2:
                session.setAttribute("noActivacionCuenta", user);
                response.sendRedirect("EntradaIH.jsp");
                break;
            case 3  :
                session.setAttribute("usuarioActual", user);
                response.sendRedirect("PrincipalIH.jsp");
                break;
            case 4:
                
                response.sendRedirect("EntradaIH.jsp");
                    break;                              
            case 5:
                session.setAttribute("usuarioBloqueado", user);
                response.sendRedirect("EntradaIH.jsp");
                break;
            }
  }

        private int validoEnBase(String user, String passwd) {
        int salida = 4;
        try {
            ConexionBD conexion = new ConexionBD("facebar", "postgres", "postgres");
            conexion.conectarBD();
            ResultSet resul;
            resul = null;
            System.out.println(user);
            //System.out.println("0");
            resul = conexion.consultarBD("SELECT * FROM usuarios "
                    + "WHERE correoelectronico='"  + user  +"'; ");
            boolean entro = resul.next();
            salida=0;
            /*System.out.println(entro);
            System.out.println(resul.getString("contrasenia"));
            System.out.println(entro);*/
            if(entro){
                salida=1;
                System.out.println("1");
            String pss = resul.getString("contrasenia");
            System.out.println("hola");
            String act = resul.getString("status");
            //System.out.println(pss + "  "+ passwd);
            if( pss.equals(passwd) ){
                salida=2;
                //System.out.println("2");
            
            if(act.equals("A")){
                salida=3;
                //System.out.println("3");
            }
            if(act.equals("B")){
                salida=5;
            }    
            }
            
                
            }
            
            conexion.desconectarBD();
        }  catch (ClassNotFoundException ex) {
            session.setAttribute("errorControlador", ex.getMessage());
        } catch (SQLException ex) {
            session.setAttribute("errorConexion", ex.getMessage());
        }
        return salida;
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
}




