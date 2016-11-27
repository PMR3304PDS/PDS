<%--  
    Edita resumo de consulta
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ include file="../Geral/verifylogin.jsp" %>
        
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
                        int cns_cod;
                        cns_cod = Integer.parseInt(request.getParameter("cns_cod"));
                        transacoes.Consulta tn_cns = new transacoes.Consulta();
                        data.ConsultaDO consulta = tn_cns.busca_cns(cns_cod);

                        if(null==request.getParameterValues("enviar"))
                        {
                    %>
                            Consulta -  Alteração de Resumo
                            <form method="post" action="edita_resumo_consulta.jsp?cns_cod=<%=cns_cod%>">
                                Resumo : <input type="text" name="novo_resumo" value="<%=consulta.getCns_resumo()%>" />
                                <input type="submit" name="enviar" value="Enviar" />
                            </form>
                    <%
                        }
                        else
                        {
                            int pac_cod = consulta.getPaciente_Usuario_Usu_cod();

                            String novo_resumo = request.getParameter("novo_resumo");
                            transacoes.Consulta tn = new transacoes.Consulta();
                            consulta.setCns_resumo(novo_resumo);
                            if(tn.atualizar(consulta))
                            {
                    %>  
                                Consulta atualizada com sucesso!
                                <form action="visualiza_informacoes_gerais_consulta.jsp?pac_cod=<%=pac_cod%>" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else
                            {
                    %>
                                Erro ao atualizar consulta!
                                <form action="edita_resumo_consulta.jsp?cns_cod=<%=cns_cod%>" method="post">
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