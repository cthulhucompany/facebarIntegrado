<%-- 
    Document   : EntradaIH
    Created on : 15/04/2013, 05:08:35 PM
    Author     : yovas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>faceBar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="stilearning">

        <!-- google font -->
        <link href="http://fonts.googleapis.com/css?family=Aclonica:regular" rel="stylesheet" type="text/css" />

        <!-- styles -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap-responsive.css" rel="stylesheet">
        <link href="css/stilearn.css" rel="stylesheet">
        <link href="css/stilearn-responsive.css" rel="stylesheet">
        <link href="css/stilearn-helper.css" rel="stylesheet">
        <link href="css/stilearn-icon.css" rel="stylesheet">
        <link href="css/font-awesome.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/uniform.default.css" rel="stylesheet">

        <link href="css/datepicker.css" rel="stylesheet">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>

    <body>

        <!--Alfie inicio-->

        <% if (request.getSession().getAttribute("correoNoValido") != null) {%>
        <script>
            alert("Correo electronico no válido\n"
                +"correo fue : <%=(String) request.getSession().getAttribute("correoNoValido")%>");
            <%session.removeAttribute("correoNoValido");%>
        </script>
        <%}%>

        <% if (request.getSession().getAttribute("usuarioBloqueado") != null) {%>
        <script>
            alert("El usuario "
                +"<%=(String) request.getSession().getAttribute("usuarioBloqueado")%> esta bloqueado");
            <%session.removeAttribute("usuarioBloqueado");%>
        </script>
        <%}%>        
        <% if (request.getSession().getAttribute("contraseniaInvalida") != null) {%>
        <script>
            alert("Contraseña no valida\n"
                +"contraseña fue : <%=(String) request.getSession().getAttribute("contraseniaInvalida")%>");
            <%session.removeAttribute("contraseniaInvalida");%>
        </script>
        <%}%>
        <% if (request.getSession().getAttribute("noActivacionCuenta") != null) {%>
        <script>
            alert("Correo electrónico no activado\n"
                +"correo fue : <%=(String) request.getSession().getAttribute("noActivacionCuenta")%>");
            <%session.removeAttribute("noActivacionCuenta");%>
        </script>
        <%}%>

        <!--Alfie termino-->
        
        <% if (request.getSession().getAttribute("correoEnviado") != null) {%>
        <script>
            alert("Se mandó un correo de verificación\n"
                +"a la cuenta: <%=(String) request.getSession().getAttribute("correoEnviado")%>");
            <%session.removeAttribute("correoEnviado");%>
        </script>
        <%}%>

        <% if (request.getSession().getAttribute("bienvenido") != null) {%>
        <script>
            alert("Bienvenido\n"
                +"Se ha validado la cuenta vinculada\n"
                +"al correo: <%=(String) request.getSession().getAttribute("bienvenido")%>");
            <%session.removeAttribute("bienvenido");%>
        </script>
        <%}%>

        <% if (request.getParameter("validaCorreo") != null) {%>
        <%request.getSession().setAttribute("validaCorreo", (String) request.getParameter("validaCorreo"));%>
        <%response.sendRedirect("CreacionCuenta");%>
        <%}%>

        <% if (request.getSession().getAttribute("errorControlador") != null) {%>
        <script>
            alert("Ocurrió el siguiente error con el controlador de la base de datos:\n"
                +"<%=(String) request.getSession().getAttribute("errorControlador")%>");
            <%session.removeAttribute("errorControlador");%>
        </script>
        <%}%>

        <% if (request.getSession().getAttribute("errorConexion") != null) {%>
        <script>
            alert("Ocurrió el siguiente error en la conexion a la base de datos:\n"+
                "<%=(String) request.getSession().getAttribute("errorConexion")%>");
            <%session.removeAttribute("errorConexion");%>
        </script>
        <%}%>

        <!-- section header -->
        <header class="header" data-spy="affix" data-offset-top="0">
            <!--nav bar helper-->
            <div class="navbar-helper">
                <div class="row-fluid">
                    <!--panel site-name-->
                    <div class="span2">
                        <div class="panel-sitename">
                            <h2><span class="color-teal">face</span>Bar</h2>
                        </div>
                    </div>
                    <!--/panel name-->
                </div>
            </div><!--/nav bar helper-->
        </header>

        <!-- section content -->
        <section class="section">
            <div class="container">
                <div class="signin-form row-fluid">
                    <!--Sign In-->
                    <div class="span5 offset1">
                        <div class="box corner-all">
                            <div class="box-header grd-teal color-white corner-top">
                                <span>Iniciar sesi&oacute;n:</span>
                            </div>
                            <div class="box-body bg-white">
                                <form id="sign-in" method="post" action="InicioSesion">
                                    <div class="control-group">
                                        <label class="control-label">Correo electr&oacute;nico</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, email:true, messages:{required:'Por favor ingresa un correo electr&oacute;nico', email:'Por favor ingresa un correo electr&oacute;nico v&aacute;lido'}}" name="login_username" id="login_username" autocomplete="off" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Contrase&ntilde;a</label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, messages:{required:'Por favor ingresa una contrase&ntilde;a'}}" name="login_password" id="login_password" autocomplete="off" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="pull-right helper-font-32">

                                        </div>

                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-block btn-large btn-primary" value="Iniciar sesi&oacute;n" />

                                        <p class="help-block muted helper-font-small"></p>

                                    </div>
                                </form>
                                <p><br><div class="control-group">
                                    <label class="control-label">Instrucciones
                                        <p>Si ya est&aacute;s registrado inicia sesi&oacute;n, si no crea una cuenta nueva</p></label></div></p>	
                            </div>
                        </div>
                    </div><!--/Sign In-->
                    <!--Sign Up-->
                    <div class="span5">
                        <div class="box corner-all">
                            <div class="box-header grd-green color-white corner-top">
                                <span>Crear cuenta</span>
                            </div>
                            <div class="box-body bg-white">
                                <form id="sign-up" method="post" action="CreacionCuenta">
                                    <div class="control-group">
                                        <label class="control-label">Nombre</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, messages:{required:'Por favor ingresa un nombre'}}" name="username" id="username" autocomplete="off" />
                                            <p class="help-block muted helper-font-small"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Correo electr&oacute;nico</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, email:true, messages:{required:'Por favor ingresa un correo electr&oacute;nico', email:'Por favor ingresa un correo electr&oacute;nico v&aacute;lido'}}" name="email" id="email" autocomplete="off" />
                                            <p class="help-block muted helper-font-small"><strong></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Contrase&ntildea</label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, minlength: 6, messages:{required:'Por favor ingresa una contrase&ntilde;a', minlength:'Por favor ingresa al menos 6 caracteres'}}" name="password" id="password" autocomplete="off" />
                                            <p class="help-block muted helper-font-small"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Contrase&ntildea nuevamente</label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, equalTo: '#password', messages:{required:'Por favor ingresa la confirmaci&oacute;n de tu contrase&ntilde;a', equalTo: 'Las constrase&ntilde;as no coinciden'}}" name="password_again" id="password_again" autocomplete="off" />
                                            <p class="help-block muted helper-font-small"></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Fecha de nacimiento</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, date:true, messages:{required:'Por favor ingresa una fecha anterior a hoy', date:'Por favor ingresa una fecha válida anterior a hoy'}}" name="fechaNac" id="fechaNac" autocomplete="off" data-date-format="dd/mm/yyyy"/>
                                            <p class="help-block muted helper-font-small"><strong></p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">G&eacute;nero</label>
                                        <div class="controls">
                                            <label class="radio">
                                                <input type="radio" data-form="uniform" name="optionsRadios" id="optionRadioMasculino" value="M" checked>
                                                M&aacute;sculino     
                                            </label>
                                            <label class="radio">
                                                <input type="radio" data-form="uniform" name="optionsRadios" id="optionRadioFemenino" value="F"">
                                                Femenino
                                            </label>
                                            <p class="help-block muted helper-font-small"></p>
                                        </div>
                                        <p class="help-block muted helper-font-small"></p>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-block btn-large btn-success" value="Crear cuenta" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!--/Sign Up-->
                </div><!-- /row -->
            </div><!-- /container -->

            <!-- modal recover -->
            <div id="modal-recover" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modal-recoverLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 id="modal-recoverLabel">Reset password <small>Username Or Email Address</small></h3>
                </div>
                <div class="modal-body">
                    <form id="form-recover" method="post">
                        <div class="control-group">
                            <div class="controls">
                                <input type="text" data-validate="{required: true, email:true, messages:{required:'Please enter field email', email:'Please enter a valid email address'}}" name="recover" />
                                <p class="help-block helper-font-small">Enter your username or email address and we will send you a link to reset your password.</p>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                    <input type="submit" form="form-recover" class="btn btn-primary" value="Send reset link" >
                </div>
            </div><!-- /modal recover-->
        </section>

        <!-- javascript
        ================================================== -->
        <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/uniform/jquery.uniform.js"></script>
        <script src="js/datepicker/bootstrap-datepicker.js"></script>

        <script src="js/validate/jquery.metadata.js"></script>
        <script src="js/validate/jquery.validate.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                // try your js
                
                // uniform
                $('[data-form=uniform]').uniform();

                // datepicker
                var nowTemp = new Date();
                var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(),0,0,0,0);

                $('#fechaNac').datepicker({
                    onRender: function(date) {
                        return date.valueOf() >= now.valueOf() ? 'disabled' : '';
                    }
                });
		
                // validate
                $('#sign-in').validate();
                $('#sign-up').validate();
                $('#form-recover').validate();
            })
        </script>
    </body>
</html>

