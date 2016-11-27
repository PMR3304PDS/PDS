<%-- 
    *******Dados Pessoais Médico*********
--%>


<%@page import="java.util.Vector"%>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@ page import="utils.*" %>
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
                    <h1>Dados Pessoais</h1><br>
                    <%
                        utils.Utils u = new Utils();
                        transacoes.Medico tm = new transacoes.Medico();
                        data.MedicoDO m = new data.MedicoDO();
                        m = tm.buscar(Integer.parseInt(String.valueOf(session.getAttribute("cod"))));
                        
                        transacoes.Conselhos tc = new transacoes.Conselhos();
                        data.ConselhosDO c = new data.ConselhosDO();
                        c = tc.buscar(m.getConselhos_Con_cod());
                        
                        transacoes.Estado te = new transacoes.Estado();
                        data.EstadoDO e = new data.EstadoDO();
                        e = te.buscar(m.getEstado_Est_cod_conselho_emissor());
                        
                        transacoes.Especialidade tme2 = new transacoes.Especialidade();
                        Vector es = tme2.pesquisarEspecialidadesdoMedico(m.getUsu_cod());
                        
                        transacoes.Endereco tend = new transacoes.Endereco();
                        Vector enderecos = tend.pesquisarPorCodDaPessoa(m.getUsu_cod());
                        
                        transacoes.Telefone tt = new transacoes.Telefone();
                        Vector telefones = tt.pesquisar(m.getUsu_cod());
                       
                        if (m.getUsu_foto()!= null) {
                            byte[] imageBytes = u.getBytes(m.getUsu_foto());
                            response.setContentType("image/jpeg");
                            response.setContentLength(imageBytes.length);
                            response.getOutputStream().write(imageBytes);
                    %>
                            <img src="/PDS/Images/Default.png" height="100" width="100"><br>
                    <%
                        } else {
                    %>
                            <img src="/PDS/Images/Default.png" height="100" width="100"><br>
                    <%
                        }
                    %>
                    Nome Completo: <%= m.getUsu_nome()%><br>
                    RG: <%= m.getUsu_rg()%><br>
                    CPF: <%= m.getUsu_cpf()%><br>
                    <%
                        for (int i = 0; i < telefones.size(); i++){
                            TelefoneDO tel = new TelefoneDO();
                            tel = (TelefoneDO)telefones.elementAt(i);
                        
                    %>
                    Telefone <%= i+1%>: <%= tel.getTel_numero() %> <br>
                    <%
                        }
                    %>
                    <%
                        for (int i = 0; i < enderecos.size(); i++){
                            EnderecoDO end = new EnderecoDO();
                            end = (EnderecoDO)enderecos.elementAt(i);
                            transacoes.Municipio tmue = new transacoes.Municipio();
                            MunicipioDO mu = new MunicipioDO();
                            mu = tmue.buscar(end.getMunicipio_Mun_cod());
                            transacoes.Tipo_Endereco ttend = new transacoes.Tipo_Endereco();
                            Tipo_EnderecoDO tipo = new Tipo_EnderecoDO();
                            tipo = ttend.buscar(end.getTipo_Endereco_TipEnd_cod());
                    %>
                    Endereco <%= i+1%>: <%= end.getEnd_rua() %> - <%= end.getEnd_bairro() %> - <%= tipo.getTipEnd_tipo() %> - <%= mu.getMun_nome() %> <br>
                    <%
                        }
                    %>
                    Número de Registro (CRM): <%= m.getMed_NumRegistro()%><br>
                    Estado: <%= e.getEst_nome()%><br>
                    Conselho: <%= c.getCon_nome()%> - <%= c.getCon_sigla()%> <br>
                    <%
                        for (int i = 0; i < es.size(); i++){
                            EspecialidadeDO especialidade = new EspecialidadeDO();
                            especialidade = (EspecialidadeDO)es.elementAt(i);
                        
                    %>
                    Especialidade <%= i+1%>: <%= especialidade.getEsp_nome()%><br>
                    <%
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

