<%-- 
    *******PDSM005 - Visualização das indicações*********
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
                <br>
                <br>
                <br>
                Histórico de Indicações:
                <br>
                <table>
                    <tr>
                        <th>Paciente</th>
                        <th>Indicado por</th>
                    </tr>  
                    <tr><% 
                    int i;
                    int cod_med=((Integer)session.getAttribute("cod")).intValue();
                    int id_med_indicante;
                    int id_paciente;
                    String nome_medico_indicante;
                    String nome_paciente;
                    data.MedicoDO medico_aux = new data.MedicoDO();
                    data.PacienteDO paciente_aux = new data.PacienteDO();
                    java.util.Vector v_indicacoes = (new transacoes.Indicacao()).pesquisarporCRM(cod_med);
                    for(i=0;i<v_indicacoes.size();i++){
                        id_med_indicante = ((data.IndicacaoDO)(v_indicacoes.elementAt(i))).getMedico_Usuario_Usu_cod_indicante();
                        medico_aux = (new transacoes.Medico()).buscar(id_med_indicante);
                        nome_medico_indicante = medico_aux.getUsu_nome();
                        id_paciente = ((data.IndicacaoDO)(v_indicacoes.elementAt(i))).getPaciente_Usuario_Usu_cod();
                        paciente_aux = (new transacoes.Paciente()).buscar(id_paciente);
                        nome_paciente = paciente_aux.getUsu_nome();
                        %>                        
                        <td><%= nome_medico_indicante%></td>
                        <td><%= nome_paciente%> </td> <%}%>
                </table>
                    <form action="IndicarPaciente.jsp" method="post">
                        <input type="submit" name="Fazer Indicacao" value="Fazer Indicacao">                                         
                    </form>
                    </tr>                
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
