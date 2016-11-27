<%-- 
    *******Visualiza Documentos do Paciente*********
--%>


<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
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
 <%             
        int Usu_cod = Integer.parseInt(request.getParameter("pac_cod"));
        transacoes.Paciente tp = new transacoes.Paciente();
        data.PacienteDO paciente = tp.buscar(Usu_cod);
%> 
            <h1>Documentos - <%= paciente.getUsu_nome() %></h1><br>
           
            
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
