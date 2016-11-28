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
                        rec_cod = Integer.parseInt(request.getParameter("rec_cod"));
                        transacoes.Receita tn_rec = new transacoes.Receita();
                        data.ReceitaDO receita = tn_rec.buscar(rec_cod);
                        int pac_cod = receita.getPaciente_Usuario_Usu_cod();
                        transacoes.Usuario tn_usu = new transacoes.Usuario();
                        data.UsuarioDO p = tn_usu.pesquisarPorId(pac_cod);
                        
                        
                        if(tn_rec.excluir(rec_cod))
                        {
                    %>
                            Receita excluida com sucesso!
                            <form action="ListaReceitas.jsp" method="post">
                                <input type='hidden' name='Usu_buscado' value='<%=p.getUsu_nome()%>'>
                                <input type='hidden' name='Paciente_Usuario_Usu_cod' value='<%=p.getUsu_cod()%>'>
                                <input type="submit" name="voltar" value="Voltar" />
                            </form>
                    <%
                        }
                        else
                        {
                    %>
                            Receita não pode ser excluida!
                            <br>
                            <form action="exclui_receita.jsp?rec_cod=<%=rec_cod%>" method="post">
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
