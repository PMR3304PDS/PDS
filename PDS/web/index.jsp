<%-- 
    Document   : index
    Created on : 01/10/2009, 18:29:29
    Author     : MB
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>
            POLIdataSUS
        </h1>
        <div>
            <h2>  
                Bem-vindo ao POLIdataSUS
            </h2>            
        </div>
        <div>
            Se voc� j� � cadastrado, prossiga para o login.
            
            Caso contr�rio, fa�a o cadastro! Isso levar� apenas alguns instantes!
            <form action="login.jsp">
                <input type="submit" name="ok" value="login"/>
            </form>
            <form action="primeiro_acesso_paciente.jsp">
                <input type="submit" name="ok" value="paciente"/>
            </form>
            <form action="primeiro_acesso_medico_tecnico.jsp">
                <input type="submit" name="ok" value="m�dico/t�cnico"/>
            </form>
        </div>
    </body>
</html>
