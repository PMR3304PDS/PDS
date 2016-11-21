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
            if(null != request.getParameter("cancelar")){
                pageContext.forward("./temppage.jsp");
            }
            
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
                    <form action="./upload_exame_receita.jsp" method="post">
                    <b>Upload de arquivo</b>
                    <br>
                    <br>
                    Paciente: <%= paciente_nome%>
                    <br>
                    Tipo de arquivo:
                    <input type="radio" name="tipo_arquivo" value="receita"> Receita
                    <input type="radio" name="tipo_arquivo" value="exame"> Exame
                    <br>
                    Tipo de exame: <select name="tipo_exame" id="tipo_exame">
                        <option>Tipo 1</option>
                    </select>
                    <br>
                    <input type="file" name="arquivo">
                    <br>
                    Resumo:
                    <br>
                    <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo"></textarea>
                    <br>
                    <input type="submit" name="concluir" value="concluir" />
                    <input type="submit" name="cancelar" value="cancelar" />
                    </form>
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
