<%--  
    Exclui Exame
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
                    <%
                        int exa_cod;
                        try
                        {
                          exa_cod = Integer.parseInt(request.getParameter("exa_cod"));
                        }
                        catch(NumberFormatException e)
                        {
                            exa_cod=0;
                    %>
                        Erro ao tentar encontrar exame no banco de dados!
                        <form action="login.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
                    <%
                            return;
                        }
                        transacoes.Exame tn_exa = new transacoes.Exame();
                        if(tn_exa.excluir(exa_cod))
                        {
                    %>
                        Exame excluido com sucesso!
                        <form action="login.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
                    <%
                        }
                        else
                        {
                    %>
                        Exame n�o pode ser excluido!
                        <br>
                        <form action="exclui_exame.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
                    <%
                        }
                    %>
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
