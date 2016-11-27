<%-- 
    *******Visualização de dados pessoais do Técnico*********
--%>

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
        <%@page import="java.util.Vector"%>
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
                        transacoes.Tecnico ttec = new transacoes.Tecnico();
                        data.TecnicoDO t = new data.TecnicoDO();
                        t = ttec.buscar(Integer.parseInt(String.valueOf(session.getAttribute("cod"))));
                        
                        transacoes.Conselhos tc = new transacoes.Conselhos();
                        data.ConselhosDO c = new data.ConselhosDO();
                        c = tc.buscar(t.getConselhos_Con_cod());
                        
                        transacoes.Estado te = new transacoes.Estado();
                        data.EstadoDO e = new data.EstadoDO();
                        e = te.buscar(t.getEstado_Est_cod_conselho_emissor());
                        
                        transacoes.Endereco tend = new transacoes.Endereco();
                        Vector enderecos = tend.pesquisarPorCodDaPessoa(t.getUsu_cod());
                        
                        transacoes.Telefone tt = new transacoes.Telefone();
                        Vector telefones = tt.pesquisar(t.getUsu_cod());
                       
                        if (t.getUsu_foto()!= null) {
                            byte[] imageBytes = u.getBytes(t.getUsu_foto());
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
                    Nome Completo: <%= t.getUsu_nome()%><br>
                    RG: <%= t.getUsu_rg()%><br>
                    CPF: <%= t.getUsu_cpf()%><br>
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
                    Estado: <%= e.getEst_nome()%><br>
                    Conselho: <%= c.getCon_nome()%> - <%= c.getCon_sigla()%> <br> 
                    
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
