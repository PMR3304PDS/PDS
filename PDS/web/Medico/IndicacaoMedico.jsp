<%-- 
    *******PDSM005 - Indicação de outros médicos para pacientes*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
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
                Histórico de Indicações
                <br>
                <table>
                    <tr>
                        <th>Paciente</th>
                        <th>Indicado por</th>
                    </tr>  
                    <tr>
                        <td>for</td>
                        <td>for</td>
                    </tr>
                </table>
                <br>
                Realizar Indicação:
                <br>
                
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