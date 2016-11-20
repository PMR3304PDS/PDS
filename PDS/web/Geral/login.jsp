<%-- 
    Document   : login
    Created on : Nov 1, 2016, 5:56:21 PM
    Author     : Renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
    <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <%@ include file="/Geral/header.jsp" %>
            </tr>
            <tr>
                <h2>
                    Login 
                </h2>
<%
    if ( request.getParameter("campo_controle") != null ) {
        if (request.getParameter("forgot") == "Esqueci minha senha") {
            pageContext.forward("temppage.jsp");
        }
        // processa login
        String user = request.getParameter("usuario");
        String passwd = request.getParameter("senha");
        transacoes.Usuario tn = new transacoes.Usuario();
        data.UsuarioDO u = tn.buscar(user);
        boolean v = false;
        if ((user.length() <= 150) && (passwd.length() <= 20) && (u != null)) {
            v = u.getUsu_senha().equals(passwd);
            if (v) {
                session.setAttribute("user_name", u.getUsu_nome());
                if (tn.buscarMedico(u.getUsu_cod()) != null)
                    pageContext.forward("../Medico/modelo.jsp");
                else if (tn.buscarTecnico(u.getUsu_cod()) != null)
                    pageContext.forward("../Tecnico/modelo.jsp");
                else if (tn.buscarPaciente(u.getUsu_cod()) != null)
                    pageContext.forward("../Paciente/modelo.jsp");
                else
                    pageContext.forward("temppage.jsp");
            }
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
                    <a href="temppage.jsp">Esqueci minha senha</a>
                    <input type="hidden" name="campo_controle" />
                </form>
            </tr>
            <tr>
                <%@ include file="/Geral/footer.jsp" %>
            </tr>
        </table>
    </body>
</html>
