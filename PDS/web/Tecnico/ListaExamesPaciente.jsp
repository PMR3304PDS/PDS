
<%-- 
    *******Lista de Exames Paciente*********
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
                    <%@ page import="java.util.Vector" %>
                    <%@ page import="transacoes.Exame" %>
                    <%@ page import="data.ExameDO" %>
                    <%@ page import="data.PacienteDO" %>
                    
                    <%
                    String nome_paciente = (String)session.getAttribute("Usu_nome");
                    %>
                    
                    Exames - <%= nome_paciente%> 
                    
                    <br />
                    
                    <table>
                        <tr>
                            <th>Código do Exame</th>
                            <th>Data</th>
                            <th>Responsável por Adicionar Documento</th>
                        </tr>
                        <tr>
                            <%
                            String nome = request.getParameter("Usu_nome");    
                            transacoes.Exame tn = new transacoes.Exame();
                            Vector exames = tn.pesquisar(nome);    
                            if ( (exames == null) || (exames.size() == 0)){
                            %>
                            Nome não encontrado!
                            <form action="./main.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                            </form>
                            <%     } else {
                            %>
                    <table>
                            <%
                            for(int i = 0; i < exames.size(); i++) {
                            ExameDO exame = (ExameDO)exames.elementAt(i);
                            %>
                        <tr>
                            <td><%= exame.getExa_cod()%></td>
                            <td> <%= exame.getExa_data_upload() %> </td>
                            <td> <%=exame.getTecnico_Usuario_Usu_cod_uploader() %> </td>      
                        </tr>     
                    </table>
                            
                </tr>        
            <tr>
                <td colspan="2">
                    <%@ include file="../Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>

