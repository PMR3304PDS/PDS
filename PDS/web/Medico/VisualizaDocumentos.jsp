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
        <%@ include file="/Geral/verifylogin_medico.jsp" %>
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
            
            <form action='/PDS/Medico/visualiza_informacoes_gerais_consulta.jsp'>
            <input type='hidden' name='pac_cod' value='<%=Usu_cod%>'>
            <input type='submit' value='Consulta'>
            </form>
            <form action='/PDS/Medico/visualiza_informacoes_gerais_exame.jsp'>
            <input type='hidden' name='pac_cod' value='<%=Usu_cod%>'>
            <input type='submit' value='Exame'>
            </form>
            <form action='/PDS/Medico/visualiza_informacoes_gerais_receita.jsp'>
            <input type='hidden' name='pac_cod' value='<%=Usu_cod%>'>
            <input type='submit' value='Receita'>
            </form>
            <form action='/PDS/Medico/visualiza_perfil.jsp'>
            <input type='hidden' name='pac_cod' value='<%=Usu_cod%>'>
            <input type='submit' value='Voltar'>
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
