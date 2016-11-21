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
        <%@page import="transacoes.Usuario"%>
        <%@page import="data.UsuarioDO"%>
        <%@page import="transacoes.Paciente"%>
        <%@page import="data.PacienteDO"%>
        <%@page import="transacoes.Tecnico"%>
        <%@page import="data.TecnicoDO"%>
        <%@page import="transacoes.Medico"%>
        <%@page import="data.MedicoDO"%>
        <%@page import="java.util.List"%>

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
                    <p> Insira o seu email, iremos verificar se você está cadastrado e logo você receberá um e-mail com uma senha provisória </p>
                        <form method="post" action=login.jsp>
                        Email <input type="text" name="usuario" />
                        <br><input type="submit" name="enviar" value="Enviar" />
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