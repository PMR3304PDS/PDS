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
            session.setAttribute("Usu_nome", u.getUsu_nome());
            if (v) {
                if (tn.buscarMedico(u.getUsu_cod()) != null) {
                    pageContext.forward("../Medico/modelo.jsp");
                    session.setAttribute("tipo", 'm');
                }
                else if (tn.buscarTecnico(u.getUsu_cod()) != null) {
                    pageContext.forward("../Tecnico/modelo.jsp");
                    session.setAttribute("tipo", 't');
                }
                else if (tn.buscarPaciente(u.getUsu_cod()) != null) {
                    pageContext.forward("../Paciente/modelo.jsp");
                    session.setAttribute("tipo", 'p');
                }
                else {
                    pageContext.forward("temppage.jsp");
                    session.setAttribute("tipo", 'x');
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
                    Email &nbsp;<input type="text" name="usuario" />
                    <br>Senha <input type="password" name="senha" />
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
