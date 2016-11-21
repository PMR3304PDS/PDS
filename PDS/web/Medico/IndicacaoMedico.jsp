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
        <%@ page import = "transacoes.Usuario"%>
        <%@ page import = "transacoes.Medico"%>
        <%@ page import = "data.IndicacaoDATA"%>
        <%@ page import = "data.IndicacaoDO"%>
        <%@ page import = "data.MedicoDO"%>
        <%@ page import = "data.PacienteDO"%>
        <%@ page import = "data.UsuarioDO"%>
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
                    <%     if ( null == request.getParameterValues("incluir") ) {
%>
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
                    <script>
                    function isNumberKey(evt){
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode < 48 || charCode > 57))
                                return false;
                            return true;
                        }
                    </script>
                    <%      }else { 
                                String documento = request.getParameter("documento");
                                String CRM = request.getParameter("CRM");
                                String num_documento = request.getParameter("num_documento_paciente");
                                String num_crm = request.getParameter("num_CRM_medico");
                                String estado = request.getParameter("estado");
                                UsuarioDO usu_aux = new UsuarioDO();
                                MedicoDO med_aux = new MedicoDO();
                                IndicacaoDO indicacao = new IndicacaoDO();
                                if (documento.equals("RG")){
                                    if ((new Usuario()).pesquisarPorRg2(num_documento)== null
                                        || (new Medico()).pesquisarPorCrm2(num_crm, estado)== null){
                                            %> Não foi possível inserir <% 
                                    }
                                    else {
                                        usu_aux = ((new Usuario()).pesquisarPorRg2(num_documento));
                                        med_aux = ((new Medico()).pesquisarPorCrm2(num_crm, estado));
                                        indicacao.setMedico_Usuario_Usu_cod_indicado(Integer.parseInt(med_aux.getMed_NumRegistro()));
                                        indicacao.setMedico_Usuario_Usu_cod_indicante(cod_med);
                                        indicacao.setPaciente_Usuario_Usu_cod(usu_aux.getUsu_cod());
                                        (new Indicacao()).incluir(indicacao);
                                        }
                                }
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
