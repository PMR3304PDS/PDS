
<%-- 
    *******Visualiza Lista de Exames Paciente*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="transacoes.Exame" %>
        <%@ page import="data.ExameDO" %>
        <%@ page import="data.PacienteDO" %>
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
                    <% String nome_paciente = (String) session.getAttribute("Usu_buscado");
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
                                int cod = Integer.parseInt(request.getParameter("cod_buscado"));
                                transacoes.Exame tn = new transacoes.Exame();
                                Vector exames = tn.pesquisarPorCod(cod);
                                if ((exames == null) || (exames.size() == 0)) {
                            %>
                            Nome não encontrado!
                        <form action="/Tecnico/Busca.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
                        <%     } else {
                        %>
                        <table>
                            <%
                                for (int i = 0; i < exames.size(); i++) {
                                    ExameDO exame = (ExameDO) exames.elementAt(i);
                                    int exa_cod = Integer.parseInt(request.getParameter("Exa_cod"));
                                    String data = request.getParameter("Exa_data_upload");
                                    int uper_cod = Integer.parseInt(request.getParameter("Tecnico_Usuario_Usu_cod_uploader"));
                            %>
                            <tr>
                                <td><%=exa_cod%></td>
                                <td><%=data%></td>
                                <td><%=uper_cod%></td>      
                            </tr>     
                        </table>
                        <%}
                                }%>        
            </tr>        
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>

