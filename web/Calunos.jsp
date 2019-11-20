<%-- 
    Document   : Calunos
    Created on : 20/11/2019, 20:32:25
    Author     : Aluno
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="cadastro.Cadastro"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cadastro.Calunos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nm = request.getParameter("nome");
            String sn = request.getParameter("senha");   
        
            Calunos c = new Calunos();
             
             
            c.setJnm(nm);
            c.setJsn(sn);
            
            try {
//Conexão com Banco de dados
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/boletim", "root", "");

// cria um preparedStatement
                String sql = "insert into aluno (nome,senha) values (?,?)";

                PreparedStatement stmt = conexao.prepareStatement(sql);

//preenche os valores            
                stmt.setString(1, c.getJnm());
                stmt.setString(2, c.getJsn());
                
// executa
                stmt.execute();
                stmt.close();
                out.println("Gravado com suCELSO!");
                conexao.close();
                 response.sendRedirect("index.html"); 
            } catch (SQLException e) {
                out.println("Erro " + e);
            }
         
        %>
        
        %>
    </body>
</html>
