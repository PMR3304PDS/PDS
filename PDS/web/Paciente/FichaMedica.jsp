<%-- 
    *******Visualização da Ficha Médica do Paciente*********
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
        <%@ include file="/Geral/verifylogin_paciente.jsp" %>
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
                    <h1>Ficha Médica</h1><br>
                    <%
                        utils.Utils u = new Utils();
                        transacoes.Paciente tp = new transacoes.Paciente();
                        data.PacienteDO p = new data.PacienteDO();
                        p = tp.buscar(Integer.parseInt(String.valueOf(session.getAttribute("cod"))));
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
                    Data de Nascimento: <%= p.getPac_nascimento()%><br>
                    Peso: <%= p.getFormattedPac_peso()%><br>
                    Altura: <%= p.getFormattedPac_altura()%><br>
                    Alergias: <%= p.getFormattedPac_alergias()%><br>
                    Medicamentos: <%= p.getFormattedPac_medicamentos()%><br>
                    Doenças em Tratamento: <%= p.getFormattedPac_doencas_tratamento()%><br>
                    Histórico de Doenças: <%= p.getPac_historico_doencas()%><br>
                    <div align="right">
                        <a href="/PDS/Paciente/EditarFichaMedica.jsp">Editar</a><br>
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
