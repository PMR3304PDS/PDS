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
            if(null != request.getParameter("voltar")){
                pageContext.forward("./modelo.jsp");
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
                    <form action="./adicionar_consulta.jsp" method="post">
                    <b>Nova Consulta</b>
                    <br>
                    <br>
                    Nome do paciente: <%= paciente_nome%>
                    <br>
                    <br>
                    Resumo da consulta:
                    <br>
                    <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo"></textarea>
                    <br>
                    <br>
                    <input type="submit" name="adicionar" value="adicionar" />
                    <input type="submit" name="voltar" value="voltar" />
                    </form>
                    <br>
                    <%
                    if(null != request.getParameter("adicionar")){
                        
                    %>
                    Consulta adicionada
                    <input type="submit" name="solicitar_exame" value="solicitar_exame">
                    <input type="submit" name="adicionar_receita" value="adicionar_receita">
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
