<%--  
    Visualiza informações gerais do exame
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
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
                        int pac_cod = Integer.parseInt(request.getParameter("pac_cod"));
                        
                        transacoes.Usuario tu = new transacoes.Usuario();
                        data.UsuarioDO paciente = tu.pesquisarPorId(pac_cod);                        
                        
                        transacoes.Exame tc = new transacoes.Exame(); 
                        java.util.Vector exames = tc.pesquisarPorCod(pac_cod);
                        
                        if((exames ==null)||(paciente==null))
                        {
                            %>
                                Paciente não tem exames!
                                <form action="Home.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                            <%
                        }
                        else
                        {
%>
                                <br>  
                                <h2>Exames - <%= paciente.getUsu_nome() %></h2> 
<%
                            for(int i=0;i<exames.size();i++)
                            {
                                data.ExameDO exame = (data.ExameDO) exames.elementAt(i);                                                                                           

                                %>
                                    <br>
                                    <h3>Exame <%= i+1 %></h3>
                                    <br>                                    
                                    Codigo exame - <%= exame.getExa_cod() %>
                                    <br>
                                    <br>
                                    Resumo - <%= exame.getExa_resumo() %>
                                    <br>
                                    <br>
                                    Data upload - <%= exame.getExa_data_upload() %>
                                    <br>
                                    <br>
                                    Data previsão - <%= exame.getExa_previsao() %>
                                <%
                                    }
                                }
                                %>
                                <br><br><br>
                        <form action="VisualizaDocumentos.jsp" method="post">
                            <input type='hidden' name='pac_cod' value='<%=pac_cod%>'>
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
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

