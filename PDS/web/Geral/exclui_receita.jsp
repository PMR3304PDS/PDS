<%--  
    Exclui Receita
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
                        int rec_cod;
                        try
                        {
                          rec_cod = Integer.parseInt(request.getParameter("rec_cod"));
                        }
                        catch(NumberFormatException e)
                        {
                            rec_cod=0;
                    %>
                            Erro ao tentar encontrar receita no banco de dados!
                            <form action="login.jsp" method="post">
                                <input type="submit" name="voltar" value="Voltar" />
                            </form>
                    <%
                            return;
                        }
                        transacoes.Receita tn_rec = new transacoes.Receita();
                        if(tn_rec.excluir(rec_cod))
                        {
                    %>
                            Receita excluida com sucesso!
                            <form action="login.jsp" method="post">
                                <input type="submit" name="voltar" value="Voltar" />
                            </form>
                    <%
                        }
                        else
                        {
                    %>
                            Receita não pode ser excluida!
                            <br>
                            <form action="exclui_receita.jsp" method="post">
                                <input type="submit" name="voltar" value="Voltar" />
                            </form>
                    <%
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
