<%-- 
    PDSP011 - Acesso do cadastro de técnico ou médico pelo paciente
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="transacoes.*" %>
        <%@ page import="data.*" %>
        
        
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
                    
                    <%
                        int cod = Integer.parseInt(request.getParameter("cod"));
                        String tipo = request.getParameter("tipo");
                        
                        if (tipo.equals("medico")) {
                            transacoes.Medico tn = new transacoes.Medico();
                            MedicoDO medico = tn.buscar(cod);
                    %>
                    <h1>Busca - <%= medico.getUsu_nome()%></h1>
                    <br>
                    <br> 
                    Nome completo: <%= medico.getUsu_nome()%>
                    <br>
                    CRM: <%= medico.getMed_NumRegistro()%>
                    <br>
                    <%
                            transacoes.Estado tn2 = new transacoes.Estado();
                            int cod_estado = medico.getEstado_Est_cod_conselho_emissor();
                            EstadoDO estado = tn2.buscar(cod_estado);
                    %>
                    Estado emissor: <%= estado.getEst_nome()%>
                    <br>
                    <%
                            transacoes.Especialidade tn3 = new transacoes.Especialidade();
                            Vector especialidades = tn3.pesquisarEspecialidadesdoMedico(cod);
                            for (int i = 0; i < especialidades.size(); i++) {
                                EspecialidadeDO esp = (EspecialidadeDO) especialidades.elementAt(i);
                    %>
                    
                    Especialidade <%= i + 1 %>: <%= esp.getEsp_nome() %>
                    <br>
                    <%
                            }
                            transacoes.Endereco tn4 = new transacoes.Endereco();
                            Vector enderecos = tn4.pesquisarPorCodDaPessoa(cod);
                            for (int j = 0; j < enderecos.size(); j++) {
                                EnderecoDO end = (EnderecoDO) enderecos.elementAt(j);
                                
                                transacoes.Municipio tn5 = new transacoes.Municipio();
                                MunicipioDO mun = tn5.buscar(end.getMunicipio_Mun_cod());
                                
                                transacoes.Estado tn6 = new transacoes.Estado();
                                EstadoDO est = tn6.buscar(mun.getEstado_Est_cod());
                    %>
                    
                    Endereço <%= j + 1 %>: <%= end.getEnd_rua() %>, <%= end.getEnd_num()%> - <%= mun.getMun_nome() %>, <%= est.getEst_nome() %>
                    <br>
                    <%
                            }
                            transacoes.Telefone tn7 = new transacoes.Telefone();
                            Vector telefones = tn7.pesquisar(cod);
                            for (int k = 0; k < telefones.size(); k++) {
                                TelefoneDO tel = (TelefoneDO) telefones.elementAt(k);
                    %>
                    
                    Telefone <%= k+1 %>: <%= tel.getTel_numero() %>
                    <br>
                    <%
                            }
                            
                        } else {
                            transacoes.Tecnico tn8 = new transacoes.Tecnico();
                            TecnicoDO tecnico = tn8.buscar(cod);
                    %>
                    <h1>Busca - <%= tecnico.getUsu_nome()%></h1>
                    <br>
                    <br> 
                    Nome completo: <%= tecnico.getUsu_nome()%>
                    <br>
                    
                    <%      transacoes.Endereco tn4 = new transacoes.Endereco();
                            Vector enderecos = tn4.pesquisarPorCodDaPessoa(cod);
                            for (int j = 0; j < enderecos.size(); j++) {
                                EnderecoDO end = (EnderecoDO) enderecos.elementAt(j);
                                
                                transacoes.Municipio tn5 = new transacoes.Municipio();
                                MunicipioDO mun = tn5.buscar(end.getMunicipio_Mun_cod());
                                
                                transacoes.Estado tn6 = new transacoes.Estado();
                                EstadoDO est = tn6.buscar(mun.getEstado_Est_cod());
                    %>
                    
                    Endereço <%= j + 1 %>: <%= end.getEnd_rua() %>, <%= end.getEnd_num()%> - <%= mun.getMun_nome() %>, <%= est.getEst_nome() %>
                    <br>
                    
                    <%
                            }
                            transacoes.Telefone tn7 = new transacoes.Telefone();
                            Vector telefones = tn7.pesquisar(cod);
                            for (int k = 0; k < telefones.size(); k++) {
                                TelefoneDO tel = (TelefoneDO) telefones.elementAt(k);
                    %>
                    
                    Telefone <%= k+1 %>: <%= tel.getTel_numero() %>
                    <br>
                    <%
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
