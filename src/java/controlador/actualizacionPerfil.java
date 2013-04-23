package controlador;

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author p3p3
 */
@WebServlet(name = "actualizacionPerfil", urlPatterns = {"/actualizacionPerfil"})
public class actualizacionPerfil extends HttpServlet {

  private String nuevoNombre;
  private String correo;
  private String contrasena;
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

    session = request.getSession();
    String attribute = (String)session.getAttribute("correo");
    String correoUsuario = (String)session.getAttribute("usuarioActual");
    boolean exito = actualizarDatos(request, response, correoUsuario);
    //PrintWriter out = response.getWriter();
    if (exito) {
        //out.print(correoUsuario);
      response.sendRedirect("PrincipalIH.jsp");
    } else {
      session.setAttribute("ErrorBase", exito);
      response.sendRedirect("actualizacionPerfilIH.jsp");
        //out.print("Ocurrio un error al actualizar la base.");
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

  
  
  private boolean actualizarDatos(HttpServletRequest request,
          HttpServletResponse response,
          String correoUs) throws IOException {
    StringBuilder sb = new StringBuilder();
    nuevoNombre = request.getParameter("required");
    correo = request.getParameter("email");
    contrasena = request.getParameter("password");
    String sessionCorreo = "laura@ciencias.unam.mx"; 
    ConexionBD conexion;
    String salida = null;
    boolean exito = true;
    try {
      conexion  = new ConexionBD("facebar", "postgres", "postgres");
      conexion.conectarBD();
      sb.append("UPDATE usuarios SET nombre ='");
      sb.append(nuevoNombre);
      sb.append("', correoelectronico ='");
      sb.append(correo);
      sb.append("', contrasenia ='");
      sb.append(contrasena);
      sb.append("' WHERE correoelectronico ='");
      sb.append(correoUs);
      sb.append("';");
      salida = sb.toString();
      conexion.actualizarBD(salida);
      
    } catch (ClassNotFoundException cnfe) {
      exito = false;
      System.err.println("Error al cargar el controlador de la base");
    } catch (SQLException sqle) {
      exito = false;
      System.err.println("Error con la base de datos");
    }

    return exito;
  }
}
