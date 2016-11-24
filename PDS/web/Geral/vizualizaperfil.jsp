
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    *******Visualização de perfil do cadastro buscado*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ include file="../Geral/verifylogin.jsp" %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <%@ include file="../Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@ include file="../Geral/menu.jsp" %>
                </td>
                <td>
                    <form>
                        Busca:<br>
                        <input type="text" name="nome"><br>
                    </form>
                    
                    <form>
                        Tipo de cadastro:<br>
                        <input type="radio" name="gender" value="Médico" checked>Médico 
                        <input type="radio" name="gender" value="Técnico">Técnico 
                        <input type="radio" name="gender" value="Paciente"> Paciente
                    </form>    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%@ include file="../Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>
