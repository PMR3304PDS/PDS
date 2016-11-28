<%-- 
    *******Nome do UC*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@ include file="/Geral/verifylogin.jsp" %>
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
                        int cod_receita = Integer.parseInt(String.valueOf(request.getParameter("rec_cod")));
                        int cod_paciente = Integer.parseInt(String.valueOf(request.getParameter("pac_cod")));
                        transacoes.Receita tn_rec = new transacoes.Receita();
                        tn_rec.atualizar(cod_receita);
                    %>
                    Receita <%=cod_receita%> alterada com sucesso!
                    <form action="/PDS/Geral/VisualizaReceita.jsp">
                      <input type="hidden" value="<%=cod_receita%>" name='rec_cod'>
                      <input type="hidden" value="<%=cod_paciente%>" name='pac_cod'>
                      <input type="submit" value="Voltar para Receita" ></form>
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
