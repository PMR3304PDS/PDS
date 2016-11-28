<%-- 
    *******PDSX006 - Editar cadastro médico ou tecnico*********
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
                <% int cod = ((Integer) session.getAttribute("cod")).intValue();
                    transacoes.Medico tn = new transacoes.Medico();
                    data.MedicoDO mdata = new data.MedicoDO();
                    mdata = tn.buscar(cod);
                    transacoes.Usuario tusu = new transacoes.Usuario();
                    data.UsuarioDO udo = new data.UsuarioDO();
                    udo = tusu.pesquisarPorId(cod);
                    if (request.getParameter("Salvar Dados") == null) {%>
                <form action="EditarDadosMedicoTecnico.jsp" method="post">

                    Nome Completo (Obrigatório): <input type="text" name="nome" maxlength= "200" value="<%=udo.getUsu_nome()%>">
                    <br>
                    <br>
                    <% if (mdata != null) {
                    %>

                    Especialidade (Obrigatório): <select multiple="multiple" id="iEsp" Name="especialidade">
                        <%
                            transacoes.Especialidade tesp = new transacoes.Especialidade();
                            java.util.Vector esp_med = new java.util.Vector();
                            esp_med = tesp.pesquisarEspecialidadesdoMedico(cod);
                            java.util.Vector esp = (new transacoes.Especialidade()).pesquisar();
                            for (int i = 0; i < esp.size(); i++) {
                                data.EspecialidadeDO esp_aux = (data.EspecialidadeDO) esp.elementAt(i);
                                for (int j = 0; j < esp_med.size(); j++) {
                                    data.EspecialidadeDO esp_med_aux = (data.EspecialidadeDO) esp_med.elementAt(j);
                                    if (esp_aux.getEsp_cod() == esp_med_aux.getEsp_cod()) {
                        %><option selected value=<%=esp_med_aux.getEsp_cod()%>> <%=esp_med_aux.getEsp_nome()%> </option><%
                                        break;
                                    }
                                }

                            }
                            java.util.Vector vesp_aux = new java.util.Vector();
                            int r = 0;
                            for (int i = 0; i < esp.size(); i++) {
                                data.EspecialidadeDO esp_aux = (data.EspecialidadeDO) esp.elementAt(i);
                                for (int j = 0; j < esp_med.size(); j++) {
                                    data.EspecialidadeDO esp_med_aux = (data.EspecialidadeDO) esp_med.elementAt(j);
                                    if (esp_aux.getEsp_cod() == esp_med_aux.getEsp_cod()) {
                                        r++;
                                    }
                                }
                                if (r == 0) {
                                    vesp_aux.add(esp_aux);
                                }
                                r = 0;
                            }
                            for (int i = 0; i < vesp_aux.size(); i++) {
                                data.EspecialidadeDO esp_med_aux = (data.EspecialidadeDO) vesp_aux.elementAt(i);
                        %><option value=<%=esp_med_aux.getEsp_cod()%>> <%=esp_med_aux.getEsp_nome()%> </option><%
                            }


                        %> 
                    </select>
                    <br>
                    <br>
                    <% }
                        java.util.Vector end = new java.util.Vector();
                        transacoes.Endereco vend = new transacoes.Endereco();
                        end = vend.pesquisarPorCodDaPessoa(cod);
                        data.EnderecoDO edo1 = new data.EnderecoDO();
                        edo1 = (data.EnderecoDO) end.elementAt(0);
                        String endereco1 = edo1.getEnd_rua();
                        String bairro1 = edo1.getEnd_bairro();
                        int num1 = edo1.getEnd_num();
                    %>
                    Endereço de Atedimento 1 (Obrigatório):<input type="text" value="<%=endereco1%>" name="end_1">
                    Número: <input type="text" value="<%=num1%>" name="num_1">
                    Bairro: <input type="text" value="<%=bairro1%>" name="bairro_1">
                    <%
                        transacoes.Tipo_Endereco ttip = new transacoes.Tipo_Endereco();
                        data.Tipo_EnderecoDO tipodo = new data.Tipo_EnderecoDO();
                        tipodo = ttip.buscar(edo1.getTipo_Endereco_TipEnd_cod());
                        String tipo_do_endereco = tipodo.getTipEnd_tipo();
                    %><select name="tipo_end1">
                        <%if (tipo_do_endereco.equals("Particular")) {
                        %><option value="1">Doméstico</option>
                        <option selected value="2">Particular</option>
                        <option value="3">Público</option><%
                            }
                            if (tipo_do_endereco.equals("Doméstico")) {
                        %><option selected value="1">Doméstico</option>
                        <option value="2">Particular</option>
                        <option value="3">Público</option><%
                            }
                            if (tipo_do_endereco.equals("Público")) {
                        %><option value="1">Doméstico</option>
                        <option value="2">Particular</option>
                        <option selected value="3">Público</option><%
                            }
                        %>   
                    </select>
                    Município:<select Name="mun_1">
                        <%
                            transacoes.Municipio tmuni1 = new transacoes.Municipio();
                            data.MunicipioDO munido1 = new data.MunicipioDO();
                            munido1 = tmuni1.buscar(edo1.getMunicipio_Mun_cod());
                            java.util.Vector vmuni1 = new java.util.Vector();
                            vmuni1 = tmuni1.pesquisar();
                            for (int i = 0; i < vmuni1.size(); i++) {
                                data.MunicipioDO muni_aux1 = (data.MunicipioDO) vmuni1.elementAt(i);
                                if (muni_aux1.getMun_cod() == munido1.getMun_cod()) {
                        %><option selected value=<%=muni_aux1.getMun_cod()%>> <%=muni_aux1.getMun_nome()%> </option><%
                        } else {%>
                        <option value=<%=muni_aux1.getMun_cod()%>> <%=muni_aux1.getMun_nome()%> </option>
                        <%
                                }
                            }

                        %> 
                    </select>
                    Estado:<select Name="estado_1">
                        <%                            transacoes.Estado test1 = new transacoes.Estado();
                            data.EstadoDO estadodo1 = new data.EstadoDO();
                            estadodo1 = test1.buscar(munido1.getEstado_Est_cod());
                            java.util.Vector vest1 = new java.util.Vector();
                            vest1 = test1.pesquisar();
                            for (int i = 0; i < vest1.size(); i++) {
                                data.EstadoDO est1_aux = (data.EstadoDO) vest1.elementAt(i);
                                if (est1_aux.getEst_cod() == estadodo1.getEst_cod()) {
                        %><option selected value=<%=est1_aux.getEst_cod()%>> <%=est1_aux.getEst_nome()%> </option><%
                        } else {%>
                        <option value=<%=est1_aux.getEst_cod()%>> <%=est1_aux.getEst_nome()%> </option>
                        <%
                                }
                            }

                        %> 
                    </select>
                    <br>
                    <br>
                    <%  java.util.Vector end2 = new java.util.Vector();
                        transacoes.Endereco vend2 = new transacoes.Endereco();
                        end2 = vend2.pesquisarPorCodDaPessoa(cod);
                        data.EnderecoDO edo2 = new data.EnderecoDO();
                        if (end2.size() >= 2) {
                            edo2 = (data.EnderecoDO) end2.elementAt(1);
                            String endereco2 = edo2.getEnd_rua();
                            String bairro2 = edo2.getEnd_bairro();
                            int num2 = edo2.getEnd_num();
                    %>
                    Endereço de Atedimento 2 (Opcional):<input type="text" value="<%=endereco2%>" name="end_2">
                    Número: <input type="text" value="<%=num2%>" name="num_2">
                    Bairro: <input type="text" value="<%=bairro2%>" name="bairro_2">
                    <%
                        transacoes.Tipo_Endereco ttip2 = new transacoes.Tipo_Endereco();
                        data.Tipo_EnderecoDO tipodo2 = new data.Tipo_EnderecoDO();
                        tipodo2 = ttip2.buscar(edo2.getTipo_Endereco_TipEnd_cod());
                        String tipo_do_endereco2 = tipodo2.getTipEnd_tipo();
                    %><select name="tipo_end2">
                        <%if (tipo_do_endereco2.equals("Particular")) {
                        %><option value="1">Doméstico</option>
                        <option selected value="2">Particular</option>
                        <option value="3">Público</option><%
                            }
                            if (tipo_do_endereco.equals("Doméstico")) {
                        %><option selected value="1">Doméstico</option>
                        <option value="2">Particular</option>
                        <option value="3">Público</option><%
                            }
                            if (tipo_do_endereco.equals("Público")) {
                        %><option value="1">Doméstico</option>
                        <option value="2">Particular</option>
                        <option selected value="3">Público</option><%
                            }
                        %>   
                    </select>
                    Município:<select Name="mun_2">
                        <%
                            transacoes.Municipio tmuni2 = new transacoes.Municipio();
                            data.MunicipioDO munido2 = new data.MunicipioDO();
                            munido2 = tmuni2.buscar(edo2.getMunicipio_Mun_cod());
                            java.util.Vector vmuni2 = new java.util.Vector();
                            vmuni2 = tmuni2.pesquisar();
                            for (int i = 0; i < vmuni2.size(); i++) {
                                data.MunicipioDO muni_aux2 = (data.MunicipioDO) vmuni2.elementAt(i);
                                if (muni_aux2.getMun_cod() == munido2.getMun_cod()) {
                        %><option selected value=<%=muni_aux2.getMun_cod()%>> <%=muni_aux2.getMun_nome()%> </option><%
                        } else {%>
                        <option value=<%=muni_aux2.getMun_cod()%>> <%=muni_aux2.getMun_nome()%> </option>
                        <%
                                }
                            }

                        %> 
                    </select>
                    Estado:<select Name="estado_2">
                        <%  transacoes.Estado test2 = new transacoes.Estado();
                            data.EstadoDO estadodo2 = new data.EstadoDO();
                            estadodo2 = test2.buscar(munido2.getEstado_Est_cod());
                            java.util.Vector vest2 = new java.util.Vector();
                            vest2 = test2.pesquisar();
                            for (int i = 0; i < vest2.size(); i++) {
                                data.EstadoDO est_aux2 = (data.EstadoDO) vest2.elementAt(i);
                                if (est_aux2.getEst_cod() == estadodo2.getEst_cod()) {
                        %><option selected value=<%=est_aux2.getEst_cod()%>> <%=est_aux2.getEst_nome()%> </option><%
                        } else {%>
                        <option value=<%=est_aux2.getEst_cod()%>> <%=est_aux2.getEst_nome()%> </option>
                        <%
                                }
                            }
                        %></select><%
                        } else {
                        %>
                    Endereço de Atedimento 2 (Opcional):<input type="text" name="end_2">
                    Número: <input type="text" name="num_2">
                    Bairro: <input type="text" name="bairro_2">
                    <select name="tipo_end2">
                        <option value="1">Particular</option>
                        <option value="2">Convênio</option>
                        <option value="3">Público</option>
                    </select>
                    Município:
                    <select id="iCidade" Name="mun_2">
                        <%
                            java.util.Vector mun2 = (new transacoes.Municipio()).pesquisar();
                            for (int i = 0; i < mun2.size(); i++) {
                        %>
                        <option value=<%= ((data.MunicipioDO) mun2.elementAt(i)).getMun_cod()%> > <%=((data.MunicipioDO) mun2.elementAt(i)).getMun_nome()%>  </option>
                        <%
                            }
                        %>
                    </select>
                    Estado: <select id="iEst" Name="estado_2">
                        <%
                            java.util.Vector est2 = (new transacoes.Estado()).pesquisar();
                            for (int i = 0; i < est2.size(); i++) {
                        %>
                        <option value=<%=((data.EstadoDO) est2.elementAt(i)).getEst_cod()%> > <%= ((data.EstadoDO) est2.elementAt(i)).getEst_nome()%> </option>
                        <%
                            }
                        %>
                    </select>

                    <%             }

                    %>
                    <br>
                    <br>
                    <%java.util.Vector end3 = new java.util.Vector();
                        transacoes.Endereco vend3 = new transacoes.Endereco();
                        end3 = vend3.pesquisarPorCodDaPessoa(cod);
                        data.EnderecoDO edo3 = new data.EnderecoDO();
                        if (end3.size() >= 3) {
                            edo3 = (data.EnderecoDO) end3.elementAt(2);
                            String endereco3 = edo3.getEnd_rua();
                            String bairro3 = edo3.getEnd_bairro();
                            int num3 = edo3.getEnd_num();
                    %>
                    Endereço de Atedimento 3 (Opcional):<input type="text" value="<%=endereco3%>" name="end_3">
                    Número: <input type="text" value="<%=num3%>" name="num_3">
                    Bairro: <input type="text" value="<%=bairro3%>" name="bairro_3">
                    <%
                        transacoes.Tipo_Endereco ttip3 = new transacoes.Tipo_Endereco();
                        data.Tipo_EnderecoDO tipodo3 = new data.Tipo_EnderecoDO();
                        tipodo3 = ttip3.buscar(edo3.getTipo_Endereco_TipEnd_cod());
                        String tipo_do_endereco3 = tipodo3.getTipEnd_tipo();
                    %><select name="tipo_end3">
                        <%if (tipo_do_endereco3.equals("Particular")) {
                        %><option value="1">Doméstico</option>
                        <option selected value="2">Particular</option>
                        <option value="3">Público</option><%
                            }
                            if (tipo_do_endereco3.equals("Doméstico")) {
                        %><option selected value="1">Doméstico</option>
                        <option value="2">Particular</option>
                        <option value="3">Público</option><%
                            }
                            if (tipo_do_endereco3.equals("Público")) {
                        %><option value="1">Doméstico</option>
                        <option value="2">Particular</option>
                        <option selected value="3">Público</option><%
                            }
                        %>   
                    </select>
                    Município:<select Name="mun_3">
                        <%
                            transacoes.Municipio tmuni3 = new transacoes.Municipio();
                            data.MunicipioDO munido3 = new data.MunicipioDO();
                            munido3 = tmuni3.buscar(edo3.getMunicipio_Mun_cod());
                            java.util.Vector vmuni3 = new java.util.Vector();
                            vmuni3 = tmuni3.pesquisar();
                            for (int i = 0; i < vmuni3.size(); i++) {
                                data.MunicipioDO muni_aux3 = (data.MunicipioDO) vmuni3.elementAt(i);
                                if (muni_aux3.getMun_cod() == munido3.getMun_cod()) {
                        %><option selected value=<%=muni_aux3.getMun_cod()%>> <%=muni_aux3.getMun_nome()%> </option><%
                        } else {%>
                        <option value=<%=muni_aux3.getMun_cod()%>> <%=muni_aux3.getMun_nome()%> </option>
                        <%
                                }
                            }

                        %> 
                    </select>
                    Estado:<select Name="estado_3">
                        <%transacoes.Estado test3 = new transacoes.Estado();
                            data.EstadoDO estadodo3 = new data.EstadoDO();
                            estadodo3 = test3.buscar(munido3.getEstado_Est_cod());
                            java.util.Vector vest3 = new java.util.Vector();
                            vest3 = test3.pesquisar();
                            for (int i = 0; i < vest3.size(); i++) {
                                data.EstadoDO est_aux3 = (data.EstadoDO) vest3.elementAt(i);
                                if (est_aux3.getEst_cod() == estadodo3.getEst_cod()) {
                        %><option selected value=<%=est_aux3.getEst_cod()%>> <%=est_aux3.getEst_nome()%> </option><%
                        } else {%>
                        <option value=<%=est_aux3.getEst_cod()%>> <%=est_aux3.getEst_nome()%> </option>
                        <%
                                }
                            }
                        %></select><%
                        } else {
                        %>
                    Endereço de Atedimento 3 (Opcional):<input type="text" name="end_3">
                    Número: <input type="text" name="num_3">
                    Bairro: <input type="text" name="bairro_3">
                    <select name="tipo_end3">
                        <option value="1">Particular</option>
                        <option value="2">Convênio</option>
                        <option value="3">Público</option>
                    </select>
                    Município:
                    <select id="iCidade" Name="mun_3">
                        <%
                            java.util.Vector mun3 = (new transacoes.Municipio()).pesquisar();
                            for (int i = 0; i < mun3.size(); i++) {
                        %>
                        <option value=<%= ((data.MunicipioDO) mun3.elementAt(i)).getMun_cod()%> > <%=((data.MunicipioDO) mun3.elementAt(i)).getMun_nome()%>  </option>
                        <%
                            }
                        %>
                    </select>
                    Estado: <select id="iEst" Name="estado_3">
                        <%
                            java.util.Vector est3 = (new transacoes.Estado()).pesquisar();
                            for (int i = 0; i < est3.size(); i++) {
                        %>
                        <option value=<%=((data.EstadoDO) est3.elementAt(i)).getEst_cod()%> > <%= ((data.EstadoDO) est3.elementAt(i)).getEst_nome()%> </option>
                        <%
                            }
                        %>
                    </select>

                    <%             }

                    %>
                    <br>
                    <br>
                    <%                        transacoes.Telefone ttel = new transacoes.Telefone();
                        java.util.Vector vtel = new java.util.Vector();
                        vtel = ttel.pesquisar(cod);
                        if (vtel.size() == 1) {
                            data.TelefoneDO teldo1 = (data.TelefoneDO) vtel.elementAt(0);
                            String telefone1 = teldo1.getTel_numero();
                    %>
                    Telefone 1 (Obrigatório):
                    <input type="text" value="<%=telefone1%>" name="tel_1" maxlength="15" onkeypress='return isNumberKey(event)'>
                    <br>
                    Telefone 2 (Opcional):
                    <input type="text" name="tel_2" maxlength="15" onkeypress='return isNumberKey(event)'>
                    <br>
                    <%} else if (vtel.size() == 2) {
                        data.TelefoneDO teldo1 = (data.TelefoneDO) vtel.elementAt(0);
                        data.TelefoneDO teldo2 = (data.TelefoneDO) vtel.elementAt(1);
                        String telefone1 = teldo1.getTel_numero();
                        String telefone2 = teldo2.getTel_numero();
                    %>
                    Telefone 1 (Opcional):
                    <input type="text" value="<%=telefone1%>" name="tel_1" maxlength="15" onkeypress='return isNumberKey(event)'>
                    <br>
                    Telefone 2 (Opcional):
                    <input type="text" value="<%=telefone2%>"name="tel_2" maxlength="15" onkeypress='return isNumberKey(event)'>
                    <br>
                    <%} else if (vtel.isEmpty()) {
                    %>
                    Telefone 1 (Opcional):
                    <input type="text" name="tel_1" maxlength="15" onkeypress='return isNumberKey(event)'>
                    <br>
                    Telefone 2 (Opcional):
                    <input type="text" name="tel_2" maxlength="15" onkeypress='return isNumberKey(event)'>
                    <br>
                    <%}%>
                    <%-- Foto --%>
                    <input type="submit" name="Salvar Dados" value="Salvar Dados">
                </form>
                <% } else {
                    mdata = tn.buscar(cod);
                    if (mdata != null) {
                        if (request.getParameter("nome").isEmpty()
                                || request.getParameter("end_1").isEmpty()
                                || request.getParameter("bairro_1").isEmpty()
                                || request.getParameter("tel_1").isEmpty()
                                || request.getParameterValues("especialidade").length == 0) {
                %> 
                Preencha todos os campos obrigatórios, por favor! 
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%
                } else {
                    transacoes.Usuario tu_up = new transacoes.Usuario();
                    data.UsuarioDO udo_up = new data.UsuarioDO();
                    udo_up = tu_up.pesquisarPorId(cod);
                    udo_up.setUsu_nome(request.getParameter("nome"));
                    transacoes.Medico_has_Especialidade thas_up = new transacoes.Medico_has_Especialidade();
                    String[] vhas_up = request.getParameterValues("especialidade");
                    transacoes.Endereco te_up = new transacoes.Endereco();
                    java.util.Vector vend_up = new java.util.Vector();
                    vend_up = te_up.pesquisarPorCodDaPessoa(cod);
                    data.EnderecoDO edo_up1 = new data.EnderecoDO();
                    edo_up1 = (data.EnderecoDO) vend_up.elementAt(0);
                    edo_up1.setEnd_rua(request.getParameter("end_1"));
                    edo_up1.setEnd_num(Integer.parseInt(request.getParameter("num_1")));
                    edo_up1.setEnd_bairro(request.getParameter("bairro_1"));
                    if (request.getParameter("tipo_end1").equals("1")) {
                        edo_up1.setTipo_Endereco_TipEnd_cod(1);
                    } else if (request.getParameter("tipo_end1").equals("2")) {
                        edo_up1.setTipo_Endereco_TipEnd_cod(2);
                    } else {
                        edo_up1.setTipo_Endereco_TipEnd_cod(3);
                    }
                    transacoes.Municipio tmun_test = new transacoes.Municipio();
                    data.MunicipioDO mundo_test = new data.MunicipioDO();
                    mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_1")));
                    if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_1"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up1.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_1")));
                    transacoes.Telefone ttel_up = new transacoes.Telefone();
                    java.util.Vector vtel_up = new java.util.Vector();
                    vtel_up = ttel_up.pesquisar(cod);
                    boolean result_tel1 = false;
                    boolean result_tel2 = true;
                    if (vtel_up.isEmpty()) {
                        if (request.getParameter("tel_1").isEmpty() == false
                                && request.getParameter("tel_2").isEmpty()) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            teldo_1.setTel_numero(request.getParameter("tel_1"));
                            teldo_1.setUsuario_Usu_Cod(cod);
                            result_tel1 = ttel_up.incluir(teldo_1);
                        }
                        if (request.getParameter("tel_1").isEmpty()
                                && request.getParameter("tel_2").isEmpty() == false) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            teldo_1.setTel_numero(request.getParameter("tel_2"));
                            teldo_1.setUsuario_Usu_Cod(cod);
                            result_tel1 = ttel_up.incluir(teldo_1);
                        }
                        if (request.getParameter("tel_1").isEmpty() == false
                                && request.getParameter("tel_2").isEmpty() == false) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            data.TelefoneDO teldo_2 = new data.TelefoneDO();
                            teldo_1.setTel_numero(request.getParameter("tel_1"));
                            teldo_2.setTel_numero(request.getParameter("tel_2"));
                            teldo_1.setUsuario_Usu_Cod(cod);
                            teldo_2.setUsuario_Usu_Cod(cod);
                            result_tel1 = ttel_up.incluir(teldo_1);
                            result_tel2 = ttel_up.incluir(teldo_2);
                        }

                    }
                    if (vtel_up.size() == 1) {
                        if (request.getParameter("tel_1").isEmpty() == false
                                && request.getParameter("tel_2").isEmpty()) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            teldo_1 = (data.TelefoneDO) vtel_up.elementAt(0);
                            teldo_1.setTel_numero(request.getParameter("tel_1"));
                            result_tel1 = ttel_up.atualizarDados(teldo_1);
                        }
                        if (request.getParameter("tel_1").isEmpty()
                                && request.getParameter("tel_2").isEmpty() == false) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            teldo_1 = (data.TelefoneDO) vtel_up.elementAt(0);
                            teldo_1.setTel_numero(request.getParameter("tel_2"));
                            result_tel1 = ttel_up.atualizarDados(teldo_1);
                        }
                        if (request.getParameter("tel_1").isEmpty() == false
                                && request.getParameter("tel_2").isEmpty() == false) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            data.TelefoneDO teldo_2 = new data.TelefoneDO();
                            teldo_1 = (data.TelefoneDO) vtel_up.elementAt(0);
                            teldo_1.setTel_numero(request.getParameter("tel_1"));
                            teldo_2.setTel_numero(request.getParameter("tel_2"));
                            teldo_2.setUsuario_Usu_Cod(cod);
                            result_tel1 = ttel_up.atualizarDados(teldo_1);
                            result_tel2 = ttel_up.incluir(teldo_2);
                        }

                    }
                    if (vtel_up.size() == 2) {
                        if (request.getParameter("tel_1").isEmpty() == false
                                && request.getParameter("tel_2").isEmpty()) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            teldo_1 = (data.TelefoneDO) vtel_up.elementAt(0);
                            teldo_1.setTel_numero(request.getParameter("tel_1"));
                            result_tel1 = ttel_up.atualizarDados(teldo_1);
                            data.TelefoneDO teldo_2 = new data.TelefoneDO();
                            teldo_2 = (data.TelefoneDO) vtel_up.elementAt(1);
                            result_tel2 = ttel_up.remover(teldo_2);
                        }
                        if (request.getParameter("tel_1").isEmpty()
                                && request.getParameter("tel_2").isEmpty() == false) {
                            data.TelefoneDO teldo_2 = new data.TelefoneDO();
                            teldo_2 = (data.TelefoneDO) vtel_up.elementAt(1);
                            teldo_2.setTel_numero(request.getParameter("tel_2"));
                            result_tel2 = ttel_up.atualizarDados(teldo_2);
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            teldo_1 = (data.TelefoneDO) vtel_up.elementAt(0);
                            result_tel1 = ttel_up.remover(teldo_1);
                        }
                        if (request.getParameter("tel_1").isEmpty() == false
                                && request.getParameter("tel_2").isEmpty() == false) {
                            data.TelefoneDO teldo_1 = new data.TelefoneDO();
                            data.TelefoneDO teldo_2 = new data.TelefoneDO();
                            teldo_1 = (data.TelefoneDO) vtel_up.elementAt(0);
                            teldo_2 = (data.TelefoneDO) vtel_up.elementAt(1);
                            teldo_1.setTel_numero(request.getParameter("tel_1"));
                            teldo_2.setTel_numero(request.getParameter("tel_2"));
                            result_tel1 = ttel_up.atualizarDados(teldo_1);
                            result_tel2 = ttel_up.atualizarDados(teldo_2);

                        }
                    }
                    if ((vend_up.size() == 1) && ((request.getParameter("end_2").isEmpty()
                            || request.getParameter("num_2").isEmpty()
                            || request.getParameter("bairro_2").isEmpty())
                            && (request.getParameter("end_3").isEmpty()
                            || request.getParameter("num_3").isEmpty()
                            || request.getParameter("bairro_3").isEmpty()))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        try {
                            thas_up.remover(mdata);
                        } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 1) && ((request.getParameter("end_2").isEmpty()==false
                            && request.getParameter("num_2").isEmpty()==false
                            && request.getParameter("bairro_2").isEmpty()==false)
                            && (request.getParameter("end_3").isEmpty()
                            || request.getParameter("num_3").isEmpty()
                            || request.getParameter("bairro_3").isEmpty()))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2.setEnd_rua(request.getParameter("end_2"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_2")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_2"));
                        if (request.getParameter("tipo_end2").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end2").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_2")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_2"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_2")));
                    edo_up2.setUsuario_Usu_cod(cod);
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.incluir(edo_up2);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 1) && ((request.getParameter("end_2").isEmpty()
                            || request.getParameter("num_2").isEmpty()
                            || request.getParameter("bairro_2").isEmpty())
                            && (request.getParameter("end_3").isEmpty()==false
                            && request.getParameter("num_3").isEmpty()==false
                            && request.getParameter("bairro_3").isEmpty()==false))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2.setEnd_rua(request.getParameter("end_3"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_3")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_3"));
                        if (request.getParameter("tipo_end3").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end3").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_3")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_3"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_3")));
                    edo_up2.setUsuario_Usu_cod(cod);
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.incluir(edo_up2);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }if ((vend_up.size() == 1) && ((request.getParameter("end_2").isEmpty()==false
                            && request.getParameter("num_2").isEmpty()==false
                            && request.getParameter("bairro_2").isEmpty()==false)
                            && (request.getParameter("end_3").isEmpty()==false
                            && request.getParameter("num_3").isEmpty()==false
                            && request.getParameter("bairro_3").isEmpty()==false))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;                        
                        boolean result_end3 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2.setEnd_rua(request.getParameter("end_2"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_2")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_2"));
                        data.EnderecoDO edo_up3 = new data.EnderecoDO();
                        edo_up3.setEnd_rua(request.getParameter("end_3"));
                        edo_up3.setEnd_num(Integer.parseInt(request.getParameter("num_3")));
                        edo_up3.setEnd_bairro(request.getParameter("bairro_3"));
                        if (request.getParameter("tipo_end2").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end2").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_2")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_2"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_2")));
                    edo_up2.setUsuario_Usu_cod(cod);
                    if (request.getParameter("tipo_end3").equals("1")) {
                            edo_up3.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end3").equals("2")) {
                            edo_up3.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up3.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_3")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_3"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up3.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_3")));
                    edo_up3.setUsuario_Usu_cod(cod);
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.incluir(edo_up2);
                        result_end3 = te_up.incluir(edo_up3);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2 &&result_end3) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 2) && ((request.getParameter("end_2").isEmpty()
                            || request.getParameter("num_2").isEmpty()
                            || request.getParameter("bairro_2").isEmpty())
                            && (request.getParameter("end_3").isEmpty()
                            || request.getParameter("num_3").isEmpty()
                            || request.getParameter("bairro_3").isEmpty()))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        data.EnderecoDO edo_2 = (data.EnderecoDO)vend_up.elementAt(1);
                        te_up.remover(edo_2);
                        try {
                            thas_up.remover(mdata);
                        } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 2) && ((request.getParameter("end_2").isEmpty()==false
                            && request.getParameter("num_2").isEmpty()==false
                            && request.getParameter("bairro_2").isEmpty()==false)
                            && (request.getParameter("end_3").isEmpty()
                            || request.getParameter("num_3").isEmpty()
                            || request.getParameter("bairro_3").isEmpty()))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2 = (data.EnderecoDO)vend_up.elementAt(1);
                        edo_up2.setEnd_rua(request.getParameter("end_2"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_2")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_2"));
                        if (request.getParameter("tipo_end2").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end2").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_2")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_2"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_2")));
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.atualizarDados(edo_up2);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 2) && ((request.getParameter("end_2").isEmpty()
                            || request.getParameter("num_2").isEmpty()
                            || request.getParameter("bairro_2").isEmpty())
                            && (request.getParameter("end_3").isEmpty()==false
                            && request.getParameter("num_3").isEmpty()==false
                            && request.getParameter("bairro_3").isEmpty()==false))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2 = (data.EnderecoDO)vend_up.elementAt(1);
                        edo_up2.setEnd_rua(request.getParameter("end_3"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_3")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_3"));
                        if (request.getParameter("tipo_end3").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end3").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_3")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_3"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_3")));
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.atualizarDados(edo_up2);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }if ((vend_up.size() == 2) && ((request.getParameter("end_2").isEmpty()==false
                            && request.getParameter("num_2").isEmpty()==false
                            && request.getParameter("bairro_2").isEmpty()==false)
                            && (request.getParameter("end_3").isEmpty()==false
                            && request.getParameter("num_3").isEmpty()==false
                            && request.getParameter("bairro_3").isEmpty()==false))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;                        
                        boolean result_end3 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2 = (data.EnderecoDO)vend_up.elementAt(1);
                        edo_up2.setEnd_rua(request.getParameter("end_2"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_2")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_2"));
                        data.EnderecoDO edo_up3 = new data.EnderecoDO();
                        edo_up3.setEnd_rua(request.getParameter("end_3"));
                        edo_up3.setEnd_num(Integer.parseInt(request.getParameter("num_3")));
                        edo_up3.setEnd_bairro(request.getParameter("bairro_3"));
                        if (request.getParameter("tipo_end2").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end2").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_2")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_2"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_2")));
                    if (request.getParameter("tipo_end3").equals("1")) {
                            edo_up3.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end3").equals("2")) {
                            edo_up3.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up3.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_3")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_3"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up3.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_3")));
                    edo_up3.setUsuario_Usu_cod(cod);
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.atualizarDados(edo_up2);
                        result_end3 = te_up.incluir(edo_up3);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2 &&result_end3) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 3) && ((request.getParameter("end_2").isEmpty()
                            || request.getParameter("num_2").isEmpty()
                            || request.getParameter("bairro_2").isEmpty())
                            && (request.getParameter("end_3").isEmpty()
                            || request.getParameter("num_3").isEmpty()
                            || request.getParameter("bairro_3").isEmpty()))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        data.EnderecoDO edo_2 = (data.EnderecoDO)vend_up.elementAt(1);
                        data.EnderecoDO edo_3 = (data.EnderecoDO)vend_up.elementAt(2);
                        te_up.remover(edo_2);
                        te_up.remover(edo_3);
                        try {
                            thas_up.remover(mdata);
                        } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 3) && ((request.getParameter("end_2").isEmpty()==false
                            && request.getParameter("num_2").isEmpty()==false
                            && request.getParameter("bairro_2").isEmpty()==false)
                            && (request.getParameter("end_3").isEmpty()
                            || request.getParameter("num_3").isEmpty()
                            || request.getParameter("bairro_3").isEmpty()))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        data.EnderecoDO edo_up3 = new data.EnderecoDO();
                        edo_up3 = (data.EnderecoDO)vend_up.elementAt(2);
                        te_up.remover(edo_up3);
                        edo_up2 = (data.EnderecoDO)vend_up.elementAt(1);
                        edo_up2.setEnd_rua(request.getParameter("end_2"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_2")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_2"));
                        if (request.getParameter("tipo_end2").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end2").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_2")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_2"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_2")));
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.atualizarDados(edo_up2);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    if ((vend_up.size() == 3) && ((request.getParameter("end_2").isEmpty()
                            || request.getParameter("num_2").isEmpty()
                            || request.getParameter("bairro_2").isEmpty())
                            && (request.getParameter("end_3").isEmpty()==false
                            && request.getParameter("num_3").isEmpty()==false
                            && request.getParameter("bairro_3").isEmpty()==false))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;
                        data.EnderecoDO edo_up3 = new data.EnderecoDO();
                        edo_up3 = (data.EnderecoDO)vend_up.elementAt(1);
                        te_up.remover(edo_up3);
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2 = (data.EnderecoDO)vend_up.elementAt(2);
                        edo_up2.setEnd_rua(request.getParameter("end_3"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_3")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_3"));
                        if (request.getParameter("tipo_end3").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end3").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_3")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_3"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_3")));
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.atualizarDados(edo_up2);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }if ((vend_up.size() == 2) && ((request.getParameter("end_2").isEmpty()==false
                            && request.getParameter("num_2").isEmpty()==false
                            && request.getParameter("bairro_2").isEmpty()==false)
                            && (request.getParameter("end_3").isEmpty()==false
                            && request.getParameter("num_3").isEmpty()==false
                            && request.getParameter("bairro_3").isEmpty()==false))) {
                        boolean result_usu = false;
                        boolean result_mhas = false;
                        boolean result_end1 = false;
                        boolean result_end2 = false;                        
                        boolean result_end3 = false;
                        data.EnderecoDO edo_up2 = new data.EnderecoDO();
                        edo_up2 = (data.EnderecoDO)vend_up.elementAt(1);
                        edo_up2.setEnd_rua(request.getParameter("end_2"));
                        edo_up2.setEnd_num(Integer.parseInt(request.getParameter("num_2")));
                        edo_up2.setEnd_bairro(request.getParameter("bairro_2"));
                        data.EnderecoDO edo_up3 = new data.EnderecoDO();
                        edo_up3 = (data.EnderecoDO)vend_up.elementAt(2);
                        edo_up3.setEnd_rua(request.getParameter("end_3"));
                        edo_up3.setEnd_num(Integer.parseInt(request.getParameter("num_3")));
                        edo_up3.setEnd_bairro(request.getParameter("bairro_3"));
                        if (request.getParameter("tipo_end2").equals("1")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end2").equals("2")) {
                            edo_up2.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up2.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_2")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_2"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up2.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_2")));
                    if (request.getParameter("tipo_end3").equals("1")) {
                            edo_up3.setTipo_Endereco_TipEnd_cod(1);
                        } else if (request.getParameter("tipo_end3").equals("2")) {
                            edo_up3.setTipo_Endereco_TipEnd_cod(2);
                        } else {
                            edo_up3.setTipo_Endereco_TipEnd_cod(3);
                        }
                        mundo_test = tmun_test.buscar(Integer.parseInt(request.getParameter("mun_3")));
                        if (mundo_test.getEstado_Est_cod() != Integer.parseInt(request.getParameter("estado_3"))) {
                %>
                Cidade não pertence à estado selecionado!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%
                    }
                    edo_up3.setMunicipio_Mun_cod(Integer.parseInt(request.getParameter("mun_3")));
                    try {
                        thas_up.remover(mdata);
                    } catch (Exception e) {
                %>                          <%= e.toString()%>
                <%
                    }
                    for (int k = 0; k < vhas_up.length; k++) {
                        data.Medico_has_EspecialidadeDO mhas_ins = new data.Medico_has_EspecialidadeDO();
                        mhas_ins.setEspecialidade_Esp_cod(Integer.parseInt(vhas_up[k]));
                        mhas_ins.setMedico_Usuario_Usu_cod(cod);
                        result_mhas = thas_up.incluir(mhas_ins);
                        if (result_mhas == false) {
                            break;
                        }
                    }
                    try {
                        result_end1 = te_up.atualizarDados(edo_up1);
                        result_end2 = te_up.atualizarDados(edo_up2);
                        result_end3 = te_up.atualizarDados(edo_up3);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }

                    try {
                        result_usu = tn.atualizar(udo_up);
                    } catch (Exception e) {
                %>           <%= e.toString()%>
                <%
                    }
                    if (result_usu && result_mhas && result_end1 && result_tel1
                            && result_tel2 && result_end2 &&result_end3) {
                        // avisar usuario que transacao foi feita com sucesso
                %>
                Transação realizada com sucesso!
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                </form>
                <%     } else {
                %>
                Erro ao atualizar dados do contato
                <form action="EditarDadosMedicoTecnico.jsp" method="post">
                    <input type="submit" name="retry" value="Repetir" />
                </form>
                <%     }
                    }
                    
                    
                    

                            }

                        }
                    }


                %>


            </td>
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>