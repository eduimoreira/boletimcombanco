<%-- 
    Document   : turmas
    Created on : 20/11/2019, 21:28:57
    Author     : Aluno
--%>
<link rel="stylesheet" type="text/css" href="css/home.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>

      
         <div><center><br><h1 class="title header">ALUNOS</h1></center>
            <div class="login-page">
            <div class="form">
              <!--<form action="registrar.jsp" class="register-form">
                <input type="text" name="colegio" placeholder="Nome do Colégio"/>
                <input type="text" name="turmas" placeholder="Turma"/>
                <input type="text" name="professor" placeholder="Professor da Turma"/>
                <input type="text" name="alunos" placeholder="Aluno"/>
                <button>Criar</button>
                <p class="message">Já é Cadastrado? <a href="#">Cadastro</a></p>
                <script src="js/script.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
             
                </form>-->
                <form action="Calunos.jsp" class="login-form" >
                 <%
                            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/aula", "root", "");
                
                //String sqlConsulta = "select * from cliente where nome=";
                 String sqlConsulta = "SELECT * FROM aluno"; 
                
                //String sqlConsulta = "SELECT idTeste, Nome FROM teste WHERE Nome = 'Marcos'";
                
                PreparedStatement stmt2 = conexao.prepareStatement(sqlConsulta);
                ResultSet rs = stmt2.executeQuery();
                
                while (rs.next()) {
                    %>   <option value = "<% out.println(rs.getString("nome"));%>"> <% out.println(rs.getString("nome")); %> </option> <%
                    
                   
                }               
            }catch (SQLException e) {
                out.println("Erro ao selecionar dados " + e);
            }
        %>
                
              
           
               
                <script src="js/script.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
              </form>
            </div>
            </div>
        </div>
        
        
        
        
        
        
        
        <div class="page-container">
         

          <div class="sidebar-menu">
            <header class="logo">
              <a href="#" class="sidebar-icon">
                <span class="fa fa-bars"></span>
              </a>

              <a href="#">
                <span id="logo" class="fa fa-codepen fa-5x"></span>
                <script src="js/home.js"></script>
                <!--<img id="logo" src="" alt="Logo"/>-->
              </a>                    
            </header>

            <div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>

            <div class="menu">
              <ul id="menu" >
                <li id="menu-home" ><a href="home.html"><i class="fa fa-home"></i><span>Home</span></a></li>
                <li id="menu-comunicacao" ><a href="#"><i class="fa fa-envelope"></i><span>Comunicação</span><span class="fa fa-angle-double-right" style="float: right"></span></a>
                    <ul id="menu-comunicacao-sub" >
                        <li id="menu-mensagens" style="width: 120px" ><a href="#">Mensagens<i class="fa fa-angle-right" style="float: right; margin-right: -8px; margin-top: 2px;"></i></a>
                            <ul id="menu-mensagens-sub" >
                                <li id="menu-mensagens-enviadas" ><a href="#">Enviados</a></li>
                                <li id="menu-mensagens-recebidas" ><a href="#">Recebidos</a></li>
                                <li id="menu-mensagens-nova" ><a href="#">Nova Mensagem</a></li>
                            </ul>
                        </li>
                        <li id="menu-arquivos" ><a href="#">Arquivos</a></li>
                    </ul>
                </li>
                <li id="menu-academico" ><a href="#"><i class="fa fa-graduation-cap"></i><span>Acadêmico</span><span class="fa fa-angle-right" style="float: right"></span></a>
                    <ul id="menu-academico-sub" >				
                        <li id="menu-academico-avaliacoes" ><a href="#">Avaliações</a></li>
                        <li id="menu-academico-boletim" ><a href="#">Boletim</a></li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa fa-table"></i><span>Agenda</span><span class="fa fa-angle-right" style="float: right"></span></a>
                    <ul>				
                        <li><a href="#">Avaliações Agendadas</a></li>
                        <li><a href="#">Faltas</a></li>
                        <li><a href="#">Calendário</a></li>
                    </ul>
                </li>
                <li><a href="#"><i class="fa fa-history"></i><span>Rematrícula</span></a></li>
                <li><a href="#"><i class="fa fa-gears"></i><span>Dados Cadastrais</span></a></li>
                <li><a href="#"><i class="fa fa-institution"></i><span>Instituição</span><span class="fa fa-angle-right" style="float: right"></span></a>
                    <ul>				
                        <li><a href="Cturma.html">Cadastrar Turmas</a></li>
                        <li><a href="Calunos.html">Cadastrar Aluno</a></li>
                        <li><a href="Cprof.html">Cadastrar Professor</a></li>
                        <li><a href="turmas.jsp">Mostrar Turmas</a></li>
                        <li><a href="#">Mapa</a></li>
                    </ul>
                </li>
            </ul>
            </div>
          </div>
        </div>
   
    </body>
</html>
