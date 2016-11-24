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
            transacoes.Consulta tn_cns = new transacoes.Consulta();
            data.ConsultaDO consulta = tn_cns.busca_cns(cns_cod);
            
            int med_cod = consulta.getMedico_Usuario_Usu_cod();
            transacoes.Medico tn_med = new transacoes.Medico();
            data.MedicoDO medico = tn_med.buscar(med_cod);
            
            int pac_cod = consulta.getPaciente_Usuario_Usu_cod();
            transacoes.Paciente tn_pac = new transacoes.Paciente();
            data.PacienteDO paciente = tn_pac.buscar(pac_cod);
            
            java.sql.Date data = consulta.getCns_data();
            String resumo = consulta.getCns_resumo();
            %>
            
            <tr>
                <td>
                    <%@ include file="/Geral/menu.jsp" %>
                </td>
                <td>
                    Consulta - <%= paciente.getUsu_nome() %>
                    <br>
                    Medico - <%= medico.getUsu_nome() %>
                    <br>
                    Data - <%= data %>
                    <br><br>
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
