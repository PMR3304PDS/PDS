<%-- 
    PDST012 - Acesso ao cadastro de paciente ou médico ou técnico pelo técnico
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
        <%@ page import="transacoes.*"%>
        <%@ page import="data.*"%>
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
                    <form action="./visualiza_perfil.jsp" method="post">
                    <%
                    String cadastro_nome = "teste";
                    String usu_tipo = "tecnico";
                    String cadastro_tipo = "medico";
                    if (cadastro_tipo == "paciente"){
                    %>
                        <h1>Busca - <%= cadastro_nome %></h1>
                        <br>
                        Nome completo do paciente: <%= cadastro_nome %>
                        <br>
                        E-mail:
                        <br>
                        Telefone:
                        <br>
                        <%
                        if (usu_tipo == "tecnico"){
                        %>
                        <input type="submit" name="exames" value="exames">
                        <%
                        }
                        if (usu_tipo == "farmaceutico"){
                        %>
                        <input type="submit" name="receita" value="receita">
                        <%
                        }
                        %>
                    <%
                    }
                    if(cadastro_tipo == "medico"){
                    %>
                        <h1>Busca - <%= cadastro_nome %></h1>
                        <br>
                        Nome completo do médico: <%= cadastro_nome %>
                        <br>
                        Local de atendimento:
                        <br>
                        Telefone de atendimento:
                        <br>
                        CRM:
                        <br>
                    <%    
                    }
                    if(cadastro_tipo == "tecnico"){
                    %>
                    
                        <h1>Busca - <%= cadastro_nome %></h1>
                        <br>
                        Nome completo do técnico: <%= cadastro_nome %>
                        <br>
                        Local de atendimento:
                        <br>
                        Telefone de atendimento:
                        <br>
                    <%    
                    }
                    if(cadastro_tipo == "farmaceutico"){
                    %>
                    
                        <h1>Busca - <%= cadastro_nome %></h1>
                        <br>
                        Nome completo do farmaceutico: <%= cadastro_nome %>
                        <br>
                        Local de atendimento:
                        <br>
                        Telefone de atendimento:
                        <br>
                    <%    
                    }
                    %>
                    <input type="submit" name="voltar" value="voltar" />
                    </form>
                    <%
                    if(null != request.getParameter("voltar")){
                        pageContext.forward("./modelo.jsp");
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
