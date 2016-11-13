<%-- 
    Document   : login
    Created on : Nov 1, 2016, 5:56:21 PM
    Author     : Renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<header>
   <title>Login POLIdataSUS</title>
</header>
<body>
   Bem-vindo ao POLIdataSUS! 
   <br>Tecle seu usuário e senha
   para ter acesso ao sistema.
<%
    if ( request.getParameter("campo_controle") != null ) {
        // processa login
        String user = request.getParameter("usuario");
        String passwd = request.getParameter("senha");
        transacoes.UsuarioTransacao tn = new transacoes.UsuarioTransacao();
        data.UsuarioDO u = tn.buscar(user);
        boolean v = false;
        if (u != null)
            v = u.getUsu_senha().equals(passwd);
        if (v) {
           session.setAttribute("user_name", u.getUsu_nome());
           pageContext.forward("main.jsp");
        } else {
%>
        <font color="red">
            <br>Usuário ou Senha inválidos!
        </font>
   <%
        }
    }
    // show login form
%>
   <form method="post" action=login.jsp>
       Email <input type="text" name="usuario" />
       <br>Senha <input type="password" name="senha" />
       <br><input type="submit" name="enviar" value="Enviar" />
       <input type="hidden" name="campo_controle" />
   </form>
</body>
</html>
