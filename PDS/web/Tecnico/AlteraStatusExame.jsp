<%-- 
    *******Nome do UC*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@page import="java.text.ParseException"%>
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
                    <h1>Altera Status Exame</h1>
                    <br>
                    <% 
                    //int Exa_cod = Integer.parseInt(request.getParameter("exame_cod"));
                    int Exa_cod = 2;                    
                    transacoes.Exame tn = new transacoes.Exame();
                    data.ExameDO exame = tn.buscar(Exa_cod);                                   
                    %>
                </td>
            </tr>
            
            <td>
                    Código do Exame - <%= Exa_cod %>
                    <br />
                    <br />
                    Resumo do Exame - <%= exame.getExa_resumo() %>
                    <br />
                    <br />
                    Data Upload - <%= exame.getExa_data_upload() %>
                    <br />
                    <br />
                    Data Previsão - <%= exame.getExa_previsao()%>
                    
            <br /><br />
            </td>
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>
