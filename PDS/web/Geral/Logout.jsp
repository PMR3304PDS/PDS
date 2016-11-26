<%-- 
    *******Logout*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
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
                    if(null==request.getParameterValues("Logout"))
                    {
                %>
                Tem certeza que deseja fazer Logout?
                <form action="/PDS/Tecnico/Busca.jsp" method="post">
                <input type="submit" name="Voltar" value="Voltar" />
                </form>
                <form action="/PDS/Geral/Logout.jsp" method="post">
                <input type="submit" name="Logout" value="Logout" />
                </form>
                <%
                    }else{
                    session.removeAttribute("cod");
                %>   
                Logout Realizado!
                <br>
                <form action="login.jsp" method="post">
                    <input type="submit" name="ok" value="Voltar" />
                </form>
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
