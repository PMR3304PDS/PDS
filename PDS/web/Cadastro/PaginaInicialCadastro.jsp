
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td >
                    <%@ include file="/Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <body>
        Escolha um tipo de cadastro :
            
          <form action="/PDS/Paciente/primeiro_acesso_paciente.jsp" method="post">
             <input type="submit" name="retry" value="Cadastro Paciente" />
             </form> </br>               
          <form action="/PDS/Tecnico/CadastroTecnico.jsp" method="post">
             <input type="submit" name="retry" value="Cadastro Tecnico" />
             </form> </br>             
          <form action="/PDS/Medico/CadastroMedico.jsp" method="post">
             <input type="submit" name="retry" value="Cadastro Medico" />
              </form> </br>  
            <form action='/PDS/Geral/temppage.jsp'>
               <input type='submit' name="Voltar" value="Voltar"></br> 
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
