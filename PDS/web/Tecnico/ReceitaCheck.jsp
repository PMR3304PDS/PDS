<%--
    *******VisualizaReceita*********
--%>

<%@page import="java.sql.Date"%>
<%@page import="data.ReceitaDO"%>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="data.PacienteDO" %>
        <%@ page import="data.UsuarioDO" %>
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
                    <%//****Aqui vai o jsp da sua p�gina******%>
                    <%
                    int cod_receita = Integer.parseInt(String.valueOf(request.getParameter("rec_cod")));
                    int cod_paciente = Integer.parseInt(String.valueOf(request.getParameter("pac_cod")));
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod_paciente);//
                    %>
                    <table>
                        <tr>
                            <br>
                            <b>Entrega dos medicamentos para: </b><%=paciente.getUsu_nome()%>
                            <br>
                        </tr>
                        <%
                            transacoes.Receita tn_rec = new transacoes.Receita();
                            data.ReceitaDO receita = tn_rec.buscar(cod_receita);
                            boolean check = receita.isRec_check();
                        %>
                        <br>
                        <tr>C�d. Receita: <%=cod_receita%></tr>
                        <br>
                        <tr>Resumo: </tr>
                        <br>
                        <tr><%=receita.getRec_resumo()%></tr>
                        <br>
                        <br>
                        <tr>Voc� confirma que est� receita foi entregue?</tr>
                        <br>
                        <tr>
                            <td>
                              <form action="/PDS/Tecnico/ReceitaAlteradaComSucesso.jsp">
                                <input type="hidden" value="<%=cod_receita%>" name="rec_cod">
                                <input type="hidden" value="<%=cod_paciente%>" name="pac_cod" >
                                <input type="submit" value="Sim"></form></td>
                            <%
                            %>
                            <td><form action="/PDS/Geral/VisualizaReceita.jsp">
                                <input type="hidden" value="<%=cod_receita%>" name="rec_cod" >
                                <input type="hidden" value="<%=cod_paciente%>" name="pac_cod" >
                                <input type="submit" value="N�o" ></form></td>
                        </tr>
                    </table>
                    <%//Fim da jsp%>
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