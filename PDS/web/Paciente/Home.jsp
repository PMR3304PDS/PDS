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
  
          int Usu_cod =  ((Integer)session.getAttribute("cod")).intValue();
	  transacoes.Paciente tn = new transacoes.Paciente();
          data.PacienteDO paciente = tn.buscar(Usu_cod);
          
%>
                    <br>
                    Ola <%= paciente.getUsu_nome();%>
                    Você tem uma nova receita e exame 
                    Add botão de logout
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
