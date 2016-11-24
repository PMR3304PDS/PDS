<%--  
    Mudar Senha
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ include file="verifylogin.jsp" %>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@ include file="/Geral/menu.jsp" %>
                </td>
                <td>
                    <%-- Começo JSP --%>
                    <%
                        if(null==request.getParameterValues("enviar"))
                        {
                    %>
                            Cadastro - Alterar a senha
                            <form method="post" action=mudar_senha.jsp>
                                Confime sua senha antiga : <input type="password" name="senha_antiga" />
                                <br>
                                Senha nova : <input type="password" name="senha_nova" />
                                <br>
                                <input type="submit" name="enviar" value="Enviar" />
                            </form>
                    <%
                        }
                        else
                        {
                            String senha_antiga = request.getParameter("senha_antiga");
                            String senha_nova = request.getParameter("senha_nova");

                            transacoes.Usuario tn = new transacoes.Usuario();
                            int cod = ((Integer)session.getAttribute("cod")).intValue();
                            data.UsuarioDO usuario = tn.pesquisarPorId(cod);
                            if(!(usuario.getUsu_senha().equals(senha_antiga)))
                            {
                    %>
                                Senha não é igual a anterior!
                                <form action="mudar_senha.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else if(tn.mudar_senha(usuario,senha_antiga,senha_nova))
                            {
                    %>
                                Senha alterada com sucesso!
                                <form action="login.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else
                            {
                    %>
                                Erro ao mudar senha!
                                <form action="mudar_senha.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                        }
                    %>
                     <%-- Fim JSP --%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>