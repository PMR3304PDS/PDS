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
        
        <%
            if(null==request.getParameterValues("enviar"))
            {
        %>
        
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
                    Cadastro - Alterar a senha
                    <form method="post" action=mudar_senha.jsp>
                        Confime sua senha antiga : <input type="password" name="senha_antiga" />
                        <br>
                        Senha nova : <input type="password" name="senha_nova" />
                        <br>
                        <input type="submit" name="enviar" value="Enviar" />
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
                
        <%
            }
            else
            {
        %>
        
        <%
            String senha_antiga = request.getParameter("senha_antiga");
            String senha_nova = request.getParameter("senha_nova");
            transacoes.mudar_senha tn = new transacoes.mudar_senha();
            int cod = ((Integer)session.getAttribute("cod")).intValue();
            if(tn.mudar_senha(cod,senha_antiga,senha_nova))
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
        
    </body>
</html>
