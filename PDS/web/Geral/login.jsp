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
        
        // processa login
        String user = request.getParameter("usuario");
        String passwd = request.getParameter("senha");
        transacoes.Usuario tn = new transacoes.Usuario();
        data.UsuarioDO u = tn.buscar(user);
        boolean v = false;
        if ((user.length() <= 150) && (passwd.length() <= 20) && (u != null)) {
            v = u.getUsu_senha().equals(passwd);
            session.setAttribute("cod", u.getUsu_cod());
            if (v) {
                if (tn.buscarMedico(u.getUsu_cod()) != null) {
                    session.setAttribute("tipo", 'm');
                    pageContext.forward("../Medico/Home.jsp");
                }
                else if (tn.buscarTecnico(u.getUsu_cod()) != null) {
                    session.setAttribute("tipo", 't');
                    pageContext.forward("../Tecnico/Home.jsp");
                }
                else if (tn.buscarPaciente(u.getUsu_cod()) != null) {
                    session.setAttribute("tipo", 'p');
                    pageContext.forward("../Paciente/Home.jsp");
                }
                else {
                    session.setAttribute("tipo", 'x');
                    pageContext.forward("temppage.jsp");
                }
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
                    Email &nbsp;<input type="text" name="usuario" maxlength="150"/>
                    <br>Senha <input type="password" name="senha" maxlength="20"/>
                    <br><input type="submit" name="enviar" value="Enviar" />
                    &nbsp;<a href="EsqueciSenha.jsp">Esqueci minha senha</a>
                    <input type="hidden" name="campo_controle" />
                </form>
            </tr>
            <tr>
                <%@ include file="/Geral/footer.jsp" %>
            </tr>
        </table>
    </body>
</html>