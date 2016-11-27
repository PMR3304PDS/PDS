<%-- 
    *******Visualização Dados Pessoais do Paciente*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@ page import="java.util.*"%>
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
                        
                        int usu_cod = Integer.parseInt(String.valueOf(session.getAttribute("cod")));
                        
                        transacoes.Paciente tp = new transacoes.Paciente();
                        data.PacienteDO p = new data.PacienteDO();
                        p = tp.buscar(usu_cod);
                        
                        transacoes.Endereco te = new transacoes.Endereco();
                        Vector end = te.pesquisarPorCodDaPessoa(usu_cod);
                        data.EnderecoDO e = new data.EnderecoDO();
                        e = (data.EnderecoDO)end.elementAt(0);
                        
                        int mun = e.getMunicipio_Mun_cod();
                        
                        transacoes.Municipio tm1 = new transacoes.Municipio();
                        data.MunicipioDO mu = tm1.buscar(mun);
                        int estcod = mu.getEstado_Est_cod();
                        
                        transacoes.Estado te2 = new transacoes.Estado();
                        data.EstadoDO est = new data.EstadoDO();
                        est = te2.buscar(estcod);
                        
                        transacoes.Telefone tt = new transacoes.Telefone();
                        Vector telefones = tt.pesquisar(usu_cod);
                        data.TelefoneDO t1 = (data.TelefoneDO)telefones.elementAt(0);
                        data.TelefoneDO t2 = new data.TelefoneDO();
                        if (telefones.size() > 1){
                            t2 = (data.TelefoneDO)telefones.elementAt(1);
                        }
                        
                        if (p.getUsu_foto()!= null) {
                            byte[] imageBytes = u.getBytes(p.getUsu_foto());
                            response.setContentType("image/jpeg");
                            response.setContentLength(imageBytes.length);
                            response.getOutputStream().write(imageBytes);
                    %>
                            <img src="/PDS/Images/Default.png" height="100" width="100"><br>
                    <%
                        }
                        else {
                    %>
                            <img src="/PDS/Images/Default.png" height="100" width="100"><br>
                    <%
                        }
                    %>
                    Nome Completo: <%= p.getUsu_nome()%><br>
                    RG: <%= p.getUsu_rg()%><br>
                    CPF: <%= p.getUsu_cpf()%><br>
                    Data de Nascimento: <%= p.getPac_nascimento()%><br>
                    E-mail: <%= p.getUsu_login()%><br>
                    Estado: <%= est.getEst_nome()%><br>
                    Município: <%= mu.getMun_nome()%><br>
                    Bairro: <%= e.getEnd_bairro()%><br>
                    <%= e.getEnd_rua()%>,&nbsp;
                    <%= e.getEnd_num()%><br>
                    Telefone(s):<br>
                    &nbsp;<%=t1.getTel_numero()%><br>
                    <%
                        if (telefones.size() > 1) {        
                    %>
                    &nbsp;<%=t2.getTel_numero()%><br>
                    <%
                        }
                        %>
                    <div align="right">
                        <a href="/PDS/Paciente/Atualizar_Cadastro.jsp">Editar</a><br>
                    </div>
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
