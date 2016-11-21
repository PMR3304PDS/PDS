<%-- 
    PDSM021 - Adicionar nova consulta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import = "transacoes.Consulta"%>
        <%@page import = "data.ConsultaDO" %>
        <%@ include file="/Geral/verifylogin.jsp" %>
        <% String paciente_nome = "teste";
        %>
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
                    <b>Nova Consulta</b>
                    <br>
                    <br>
                    Nome do paciente: <%= paciente_nome%>
                    <br>
                    <br>
                    Diagnóstico e/ou suspeita: <input type="text" name="diagnostico">
                    <br>
                    Comentários: <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo"></textarea>
                    <br>
                    Solicitar exame: <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="exame"></textarea>
                    <br>
                    Receita:<textarea cols="10" rows="5" style="width:200px; height:50px;"  name="receita"></textarea>
                    
                    <br>
                    <input type="submit" name="adicionar" value="adicionar" />
                    <input type="submit" name="voltar" value="voltar" />
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
