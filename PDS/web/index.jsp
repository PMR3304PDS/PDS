<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <%@ include file="Geral/header.jsp" %>
            </tr>
            <tr>
                <h2>
                    Bem-vindo ao POLIdataSUS
                </h2>
                Se você já é cadastrado, prossiga para o login. <br>

                Caso contrário, faça o cadastro! Isso levará apenas alguns instantes! <br>
                <form action="Geral/login.jsp">
                    <input type="submit" name="ok" value="login"/>
                </form>
                <form action="primeiro_acesso_paciente.jsp">
                    <input type="submit" name="ok" value="paciente"/>
                </form>
                <form action="primeiro_acesso_medico_tecnico.jsp">
                    <input type="submit" name="ok" value="médico/técnico"/>
                </form>
            </tr>
            <tr>
                <%@ include file="Geral/footer.jsp" %>
            </tr>
        </table>
    </body>
</html>
