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
                    <%//****Aqui vai o jsp da sua página******%>
                    <%
                    int cod_receita = Integer.parseInt(String.valueOf(session.getAttribute("rec_cod")));
                    int cod = Integer.parseInt(String.valueOf(session.getAttribute("cod")));//código do usuario logado
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod_receita);//
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
                        <tr>Cód. Receita: <%=cod_receita%></tr>
                        <br>
                        <tr>Resumo: </tr>
                        <br>
                        <tr><%=receita.getRec_resumo()%></tr>
                        <br>
                        <br>
                        <tr>Você confirma que está receita foi entregue?</tr>
                        <br>
                        <tr>
                            <td><form action="../Tecnico/ReceitaAlteradaComSucesso.jsp"><input type="submit" value="Sim" id="RecCheck"></form></td>
                            <%
                            %>
                            <td><form action="../Geral/VisualizaReceita.jsp"><input type="submit" value="Não" ></form></td>
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