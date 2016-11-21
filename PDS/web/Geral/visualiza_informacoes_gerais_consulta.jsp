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
            
            <%
            int cns_cod;
            try
            {
              cns_cod = Integer.parseInt(request.getParameter("cns_cod"));
            }
            catch(NumberFormatException e)
            {
                cns_cod=0;
            %>
                Erro ao tentar verificar consulta!
                <form action="login.jsp" method="post">
                    <input type="submit" name="Editar Resumo" value="Editar resumo" />
                </form>
            <%
            }
            transacoes.vis_inf_cns tn = new transacoes.vis_inf_cns();
            
            data.ConsultaDO consulta = tn.busca_cns(cns_cod);
            
            int med_cod = consulta.getMedico_Usuario_Usu_cod();
            data.MedicoDO medico = tn.busca_med(med_cod);
            
            int pac_cod = consulta.getPaciente_Usuario_Usu_cod();
            data.PacienteDO paciente = tn.busca_pac(pac_cod);
            
            java.sql.Date data = consulta.getCns_data();
            String resumo = consulta.getCns_resumo();
            %>
            
            <tr>
                <td>
                    <%@ include file="/Geral/menu.jsp" %>
                </td>
                <td>
                    Consulta - <%= paciente.getUsu_nome() %>
                    Medico - <%= medico.getUsu_nome() %>
                    Data - <%= data %>
                    <br>
                    Resumo - <%= resumo %>
                    
                    <%
                    int medicoatual = ((Integer)session.getAttribute("cod")).intValue();
                    if(medicoatual==med_cod)
                    {
                    %>
                    <br>
                    <form action="edita_resumo_consulta.jsp?cns_cod=<%=cns_cod%>" method="post">
                        <input type="submit" name="Editar Resumo" value="Editar resumo" />
                    </form>
                    <%
                    }
                    %>
                    <br>
                    <form action="login.jsp" method="post">
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
