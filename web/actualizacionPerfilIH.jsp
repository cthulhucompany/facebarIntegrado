<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>faceBar - Actualizar Perfil</title>
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
    <link href="css/colorpicker.css" rel="stylesheet">
sp    <link href="css/select2.css" rel="stylesheet">
    <link href="css/bootstrap-wysihtml5.css" rel="stylesheet">

    <link href="css/responsive-tables.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
    
    <% if (request.getSession().getAttribute("ErrorBase") != null) {%>
    <script>
      alert("Error al actualizar datos \n");
      <% session.removeAttribute("ErrorBase");%>
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
              <h2><a href="PrincipalIH.jsp"><span class="color-teal">face</span>Bar</a></h2>
            </div>
          </div>
          <!--/panel name-->

          <div class="span6">
            <!--panel search-->
            <div class="panel-search">
              <form>
                <div class="input-icon-append">
                  <button type="submit" rel="tooltip-bottom" 
                          title="buscar" class="icon">
                    <i class="icofont-search"></i>
                  </button>
                  <input class="input-large search-query grd-white" 
                         maxlength="23" 
                         placeholder="Buscar aqui..." type="text">
                </div>
              </form>
            </div><!--/panel search-->
          </div>
          <div class="span4">
            <!--panel button ext-->
            <div class="panel-ext"> </div>


            
            <div class="btn-group user-group">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <img class="corner-all" align="middle" src="img/user-thumb.jpg" title="Opciones" alt="john doe" /> <!--this for display on PC device-->
                <button class="btn btn-small btn-inverse">informacion</button> <!--this for display on tablet and phone device-->
              </a>
              <ul class="dropdown-menu dropdown-user" role="menu" aria-labelledby="dLabel">
                <li>
                 
                </li>
                <li class="dropdown-footer">
                  <div>
                    <a class="btn btn-small pull-right" 
                       href="EntradaIH.jsp">Cerrar Cesion</a>
                    <a class="btn btn-small" href="EntradaIH.jsp">Agregar Cuenta</a>
                  </div>
                </li>
              </ul>
            </div>
          </div><!--panel button ext-->
        </div>
      </div>
  <!--/nav bar helper-->
  </header>

  <!-- section content -->
  <section class="section">
    <div class="row-fluid">
      <!-- span side-left -->
      <div class="span1">
        <!--side bar-->
        <aside class="side-left">
          <ul class="sidebar">
            <li>
              <a href="PrincipalIH.jsp" title="Noticias">
                <div class="helper-font-24">
                  <i class="icofont-comment-alt"></i>
                </div>
                <span class="sidebar-text">Noticias</span>
              </a>
            </li>
            <li>
              <a href="#" title="Amigos">
                <div class="helper-font-24">
                  <i class="icofont-user"></i>
                </div>
                <span class="sidebar-text">Amigos</span>
              </a>
            </li>
            <li class="active">
              <a href="actualizacionPerfilIH.jsp" title="Perfil">

                <div class="helper-font-24">
                  <i class="icofont-eye-open"></i>
                </div>
                <span class="sidebar-text">Perfil</span>
              </a>
              
            </li>



          </ul>
        </aside><!--/side bar -->
      </div><!-- span side-left -->

      <!-- span content -->
      <div class="span9">
        <!-- content -->
        <div class="content">
          <!-- content-header -->


          <!-- content-breadcrumb -->
          <div class="content-breadcrumb">
            <!--breadcrumb-nav-->
            
            <!--breadcrumb-->
            <ul class="breadcrumb">
              <li><a href="PrincipalIH.jsp"><i class="icofont-home"></i> Principal</a> <span class="divider">&rsaquo;</span></li>
              <li><a href="actualizacionPerfilIH.jsp">Actualizar Perfil</a> <span class="divider">&rsaquo;</span></li>
              <li class="active">Actualizar</li>
            </ul><!--/breadcrumb-->
          </div><!-- /content-breadcrumb -->

          <!-- content-body -->
          <div class="content-body">
            <!-- form -->
            <div class="row-fluid">
              <div class="span12">


                <!-- =========================================
                                    VALIDATION
                =========================================== -->
                <!--validation-->
                <div id="validation" class="row-fluid">
                  <!--span-->
                  <div class="span12">
                    <!--box-->
                    <div class="box corner-all">
                      <!--box header-->
                      <div class="box-header grd-white color-silver-dark corner-top">
                        <div class="header-control">
                          <a data-box="collapse"><i class="icofont-caret-up"></i></a>
                          <a data-box="close">&times;</a>
                        </div>
                        <span>Validando Datos</span>
                      </div><!--/box header-->
                      <!--box body-->
                      <div class="box-body">
                        <!--validation-->
                        <form class="form-horizontal" 
                              id="form-validate"
                              method="post"
                              action="actualizacionPerfil">
                          <fieldset>
                            <legend>Actualizar Perfil</legend>
                            <div class="control-group">
                              <label class="control-label" for="required">Nuevo Nombre</label>
                              <div class="controls">
                                <input type="text" 
                                       class="grd-white" 
                                       data-validate="{required: true, messages:{required: 'Por favor ingresa el nuevo nombre'}}"
                                       name="required" 
                                       id="required" />
                              </div>
                            </div>
                            
                            
                            <div class="control-group">
                              <label class="control-label" for="email"> Nuevo Correo electr&oacute;nico</label>
                              <div class="controls">
                                <input type="text" class="grd-white" 
                                       data-validate="{required: true, email:true, messages:{required:'Por favor ingresa un correo', email:'Direccion de correo '}}" 
                                       name="email" 
                                       id="email" />
                              </div>
                            </div>
                            
                            
                            <div class="control-group">
                              <label class="control-label" for="password">Nueva Contrase&ntilde;a</label>
                              <div class="controls">
                                <input type="password" class="grd-white" 
                                       data-validate="{required: true, messages:{required:'Por favor ingresa la contrasena'}}" 
                                       name="password" 
                                       id="password" />
                              </div>
                            </div>
                            <div class="control-group">
                              <label class="control-label" for="cpassword">Confirmar contrase&ntilde;a</label>
                              <div class="controls">
                                <input type="password" class="grd-white" 
                                       data-validate="{required: true, equalTo: '#password', messages:{required:'Por favor ingresa la contrasena', equalTo: 'Las contrasenias no coinciden'}}" 
                                       name="cpassword" 
                                       id="cpassword" />
                              </div>
                            </div>
                            <div class="form-actions">
                              <button type="sumbit" class="btn btn-success">Guardar Cambios</button>
                              <button type="button" href="PrincipalIH.jsp" class="btn">Cancelar</button>
                            </div>
                          </fieldset>
                        </form><!--/validation-->
                      </div><!--/box body-->
                    </div><!--/box-->
                  </div><!--/span--> 
                </div><!--/validation-->


              </div><!--/span-->
            </div><!--/row-fluid-->
            <!--/form-->
          </div><!--/content-body -->
        </div><!-- /content -->
      </div><!-- /span content -->

      <!-- span side-right -->
      <div class="span2">
        <!-- side-right -->

      </div><!-- /span side-right -->
    </div>
  </section>

  <!-- section footer -->
  <footer>
    <a rel="to-top" href="#top"><i class="icofont-circle-arrow-up"></i></a>
  </footer>

  <!-- javascript
  ================================================== -->
  <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
  <script src="js/jquery.js"></script>
  <script src="js/jquery-ui.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/uniform/jquery.uniform.js"></script>

  <script src="js/datepicker/bootstrap-datepicker.js"></script>
  <script src="js/colorpicker/bootstrap-colorpicker.js"></script>
  <script src="js/select2/select2.js"></script>
  <script src="js/wysihtml5/wysihtml5-0.3.0.js"></script>
  <script src="js/wysihtml5/bootstrap-wysihtml5.js"></script>
  <script src="js/validate/jquery.validate.js"></script>
  <script src="js/validate/jquery.metadata.js"></script>
  <script src="js/wizard/jquery.ui.widget.js"></script> <!-- this required for jquery.wizard-->
  <script src="js/wizard/jquery.wizard.js"></script>
  <script src="js/responsive-tables/responsive-tables.js"></script>

  <!-- required stilearn template js, for full feature-->
  <script src="js/holder.js"></script>
  <script src="js/stilearn-base.js"></script>

  <script type="text/javascript">
                    $(document).ready(function() {
                      // try your js

                      // auto complete
                      $('#inputAuto').typeahead({
                        source: ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Dakota", "North Carolina", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
                      });

                      // select2
                      $('#inputTags').select2({tags: ["red", "green", "blue"]});
                      $('[data-form=select2]').select2();
                      $('[data-form=select2-group]').select2();

                      // this select2 on side right
                      $('#tagsSelect').select2({
                        tags: ["red", "green", "blue"],
                        tokenSeparators: [",", " "]
                      });


                      // datepicker
                      $('[data-form=datepicker]').datepicker();

                      // coloricker
                      $('[data-form=colorpicker]').colorpicker();


                      // uniform
                      $('[data-form=uniform]').uniform()

                      // wysihtml5
                      $('[data-form=wysihtml5]').wysihtml5();


                      // validate form
                      $('#form-validate').validate();

                      // wizard
                      $('#form-wizard').wizard({
                        stepsWrapper: "#wrapped",
                        submit: ".submit",
                        beforeSelect: function(event, state) {
                          var inputs = $(this).wizard('state').step.find(':input');
                          return !inputs.length || !!inputs.valid();
                        }
                      }).submit(function(event) {
                        event.preventDefault();
                        alert('Form submitted!');
                      }).wizard('form').validate({
                        errorPlacement: function(error, element) {
                          if (element.is(':radio') || element.is(':checkbox')) {
                            $('#error-gender').html(error);
                          } else {
                            error.insertAfter(element);
                          }
                        }
                      });

                    });

  </script>
</body>
</html>