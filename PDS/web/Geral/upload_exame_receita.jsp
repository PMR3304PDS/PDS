<%-- 
    PDSX017 - Upload de exame ou receita
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
        <%// Coloque aqui os imports%>
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
                    <b>Upload de arquivo</b>
                    <br>
                    <br>
                    Paciente: <%= paciente_nome%>
                    <br>
                    Tipo de arquivo:
                    <input type="radio" name="tipo_arquivo" value="receita"> Receita
                    <input type="radio" name="tipo_arquivo" value="exame"> Exame
                    <br>
                    <input type="file" name="arquivo">
                    <br>
                    Resumo:
                    <br>
                    <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo"></textarea>
                    <br>
                    <input type="submit" name="concluir" value="concluir" />
                    <input type="submit" name="cancelar" value="cancelar" />
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
