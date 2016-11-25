<%-- 
    *******PDSM - 005 Indicar Paciente*********
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
                    <script>
                        function isNumberKey(evt) {
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode < 48 || charCode > 57))
                                return false;
                            return true;
                        }
                    </script> 
                    <% if (request.getParameter("Indicar") == null) {   %>  
                    <br>
                    Realizar Indicação:
                    <br>
                    Paciente:   
                    <form action="IndicarPaciente.jsp" method="get">          
                        RG<input type="radio" name="documento" value="RG">
                        CPF<input type="radio" name="documento" value="CPF">  
                        <input type="text" name="num_documento_paciente" maxlength="11" onkeypress='return isNumberKey(event)'>
                        <br>
                        Medico: 
                        <br>
                        CRM: <input type="text" name="num_CRM_medico" maxlength="10" onkeypress='return isNumberKey(event)'>
                        Estado <select name="estado">
                            <option value="1">Acre</option>
                            <option value="2">Alagoas</option>
                            <option value="3">Amapá</option>
                            <option value="4">Amazonas</option>
                            <option value="5">Bahia</option>
                            <option value="6">Ceará</option>
                            <option value="7">Distrito Federal</option>
                            <option value="8">Espírito Santo</option>
                            <option value="9">Goiás</option>
                            <option value="10">Maranhão</option>
                            <option value="11">Mato Grosso</option>
                            <option value="12">Mato Grosso do Sul</option>
                            <option value="13">Minas Gerais</option>
                            <option value="14">Pará</option>
                            <option value="15">Paraíba</option>
                            <option value="16">Paraná</option>
                            <option value="17">Pernambuco</option>
                            <option value="18">Piauí</option>
                            <option value="19">Rio de Janeiro</option>
                            <option value="20">Rio Grande do Norte</option>
                            <option value="21">Rio Grande do Sul</option>
                            <option value="22">Rondônia</option>
                            <option value="23">Roraima</option>
                            <option value="24">Santa Catarina</option>
                            <option value="25">São Paulo</option>
                            <option value="26">Sergipe</option>
                            <option value="27">Tocantins</option>
                        </select>
                        <br>
                        <br>
                        <input type="submit" name="Indicar" value="Indicar">
                    </form>
                    <% } else {
                        if (request.getParameter("documento") == null
                                || request.getParameter("num_documento_paciente") == null
                                || request.getParameter("num_CRM_medico") == null
                                || request.getParameter("estado") == null) {
                    %> Preencha todos os campo, por favor! 
                    <form action="./IndicarPaciente.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                    </form><%
                    } else {
                        int cod_med = ((Integer) session.getAttribute("cod")).intValue();
                        String documento = request.getParameter("documento");
                        String num_documento = request.getParameter("num_documento_paciente");
                        String num_crm = request.getParameter("num_CRM_medico");
                        String estado = request.getParameter("estado");
                        data.UsuarioDO usu_aux = new data.UsuarioDO();
                        data.MedicoDO med_aux = new data.MedicoDO();
                        data.IndicacaoDO indicacao = new data.IndicacaoDO();
                        transacoes.Medico tm = new transacoes.Medico();
                        med_aux = tm.pesquisarPorCrm2(num_crm, Integer.parseInt(estado));
                        if (med_aux == null) {
                    %> Número de CRM ou estado errado 
                    <form action="./IndicarPaciente.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                    </form><%
                    } else {
                        transacoes.Usuario tu = new transacoes.Usuario();
                        if (documento.equals("RG")) {
                            usu_aux = tu.pesquisarPorRg2(num_documento);
                            if (usu_aux == null) {
                    %>Número de RG errado
                    <form action="./IndicarPaciente.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                    </form><%
                    } else {
                        System.out.println(med_aux.getUsu_cod());
                        indicacao.setMedico_Usuario_Usu_cod_indicado(med_aux.getUsu_cod());
                        indicacao.setMedico_Usuario_Usu_cod_indicante(cod_med);
                        indicacao.setPaciente_Usuario_Usu_cod(usu_aux.getUsu_cod());
                        transacoes.Indicacao ti = new transacoes.Indicacao();
                        if (ti.incluir(indicacao)) {
                    %>  Inclusão realizada com sucesso!
                    <form action="./VisualizarIndicacaoMedico.jsp" method="post">
                        <input type="submit" name="voltar" value="Voltar" />
                    </form> <%
                    } else {%>
                    Erro ao incluir usuário            
                    <form action="./IndicarPaciente.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                    </form>
                    <% }
                            }
                        }
                        if (documento.equals("CPF")) {
                            usu_aux = tu.pesquisarPorCpf2(num_documento);
                            if (usu_aux == null) {
                    %>Número de CPF errado
                    <form action="./IndicarPaciente.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                    </form><%
                    } else {
                        indicacao.setMedico_Usuario_Usu_cod_indicado(med_aux.getUsu_cod());
                        indicacao.setMedico_Usuario_Usu_cod_indicante(cod_med);
                        indicacao.setPaciente_Usuario_Usu_cod(usu_aux.getUsu_cod());
                        transacoes.Indicacao ti = new transacoes.Indicacao();
                        if (ti.incluir(indicacao)) {
                    %>  Inclusão realizada com sucesso!
                    <form action="./VisualizarIndicacaoMedico.jsp" method="post">
                        <input type="submit" name="voltar" value="Voltar" />
                    </form> <%
                    } else {%>
                    Erro ao incluir indicação!           
                    <form action="./IndicarPaciente.jsp" method="post">
                        <input type="submit" name="retry" value="Repetir" />
                    </form>
                    <% }
                                        }
                                    }
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
