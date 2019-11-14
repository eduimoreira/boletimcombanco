<%-- 
    Document   : index
    Created on : 09/11/2019, 18:14:14
    Author     : Bastos
--%>
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
        <%
            String lg = request.getParameter("login");
            String sn = request.getParameter("senha");
            String ad = "admin";
           try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/aula", "root", "");
                
                //String sqlConsulta = "select * from cliente where nome=";
                 String sqlConsulta = "SELECT * FROM aluno WHERE senha LIKE '%"+sn+"%' and nome LIKE '%"+lg+"%'"; 
                
                //String sqlConsulta = "SELECT idTeste, Nome FROM teste WHERE Nome = 'Marcos'";
                
                PreparedStatement stmt2 = conexao.prepareStatement(sqlConsulta);
                ResultSet rs = stmt2.executeQuery();
                
                while (rs.next()) {
                    //int bdid = rs.getInt("idCli");
                    //String nnome = rs.getString("nome");                    
                    //String ssenha = rs.getString("senha");                    
                   
                    String nnome = ad;                    
                    String ssenha = ad;
                    //out.println("Id: " + bdid+ "<p></p>");
                    out.println("Nome: " + nnome + "<p></p>");                    
                    out.println("Senha: " + ssenha + "<p></p>");
                    
                    response.sendRedirect("Admin.html");
                    
                   // out.println("-----------------------------------------------<br>");
                }                
            } catch (SQLException e) {
                out.println("Erro ao selecionar dados " + e);
            }
        
        %>
    </body>
</html>
