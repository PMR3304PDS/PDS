<%-- 
    *******PDSM005 - Indicação de outros médicos para pacientes*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import = "java.util.*"%>
        <%@ page import = "transacoes.Indicacao"%>
        <%@ page import = "transacoes.Medico"%>7
        <%@ page import = "transacoes.Paciente"%>
        <%@ page import = "data.IndicacaoDATA"%>
        <%@ page import = "data.IndicacaoDO"%>
        <%@ page import = "data.MedicoDO"%>
        <%@ page import = "data.PacienteDO"%>
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
                Histórico de Indicações:
                <br>
                <table>
                    <tr>
                        <th>Paciente</th>
                        <th>Indicado por</th>
                    </tr>  
                    <tr><% int i;
                    int cod_med=Integer.parseInt(request.getParameter("cod"));
                    int id_med_indicante;
                    int id_paciente;
                    String nome_medico_indicante;
                    String nome_paciente;
                    MedicoDO medico_aux = new MedicoDO();
                    PacienteDO paciente_aux = new PacienteDO();
                    Vector v_indicacoes = (new Indicacao()).pesquisarporCRM(cod_med);
                    Vector v_medicos_indicantes = new Vector();
                    Vector pacientes = new Vector();
                    for(i=0;i<v_indicacoes.size();i++){
                        id_med_indicante = ((IndicacaoDO)(v_indicacoes.elementAt(i))).getMedico_Usuario_Usu_cod_indicante();
                        medico_aux = (new Medico()).buscar(id_med_indicante);
                        nome_medico_indicante = medico_aux.getUsu_nome();
                        id_paciente = ((IndicacaoDO)(v_indicacoes.elementAt(i))).getPaciente_Usuario_Usu_cod();
                        paciente_aux = (new Paciente()).buscar(id_paciente);
                        nome_paciente = paciente_aux.getUsu_nome();
                        %>                        
                        <td><%= nome_medico_indicante%></td>
                        <td><%= nome_paciente%> </td> <%}%>
                    </tr>
                </table>
                <br>
                Realizar Indicação:
                <br>
                Paciente: 
                    <form action="IndicacaoMedico.jsp" method="Get">          
                        RG<input type="radio" name="documento" value="RG">
                        CPF<input type="radio" name="documento" value="CPF">  
                        <input type="text" name="num_documento_paciente">
                        <br>
                Medico: 
                        <br>
                        CRM<input type="radio" name="CRM" value="CRM"> 
                        <input type="text" name="num_CRM_medico">
                        Estado <select name="estado">
                        <option value="estado1">estado1</option>
                        <option value="estado2">estado2</option>
                        </select>
                        <br>
                        <br>
                        <input type="submit" value="Indicar">
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
