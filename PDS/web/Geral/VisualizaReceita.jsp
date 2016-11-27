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
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod_receita);
                    %>
                    <table align="center">
                        <tr>
                            <br>
                            <td><b>Receita do paciente: </b><%=paciente.getUsu_nome()%></td>
                            <br>
                        </tr>
                        <%
                            if(paciente.getUsu_nome() ==null){
                                cod_receita=1;
                            %>
                                Erro, receita não encontrada!
                            <%
                            }//Fim do if se não há receita
                            else{
                                transacoes.Receita tn_rec = new transacoes.Receita();
                                data.ReceitaDO receita = tn_rec.buscar(cod_receita);
                                int resp_cod = receita.getMedico_Usuario_Usu_cod();
                                boolean check = receita.isRec_check();
                                UsuarioDO resp = new UsuarioDO();
                                transacoes.Usuario tn_usu = new transacoes.Usuario();
                                resp = tn_usu.pesquisarPorId(resp_cod);
                                String nome_resp = resp.getUsu_nome();
                                %>
                                    <br>
                                    <tr>Cód. Receita: <%=cod_receita%></tr>
                                    <br>
                                    <tr>Data do upload: <%=receita.getRec_data_upload()%></tr>
                                    <br>
                                    <tr>Responsável pelo upload: <%=nome_resp%></tr>
                                    <br>
                                    <tr>Status da receita:
                                        <%
                                            if (check==true){
                                                %>
                                                    Receita entregue ao paciente
                                                <%
                                            } else
                                                %>
                                                    Receita ainda não foi entregue ao paciente.
                                                <%
                                                    String ti = (String) session.getAttribute("tipo");
                                                    if (ti.equals("t")) {
                                                        %>
                                                            <form action="VisualizaReceita.jsp"><input type="submit" value="Receita Check" id="RecEntregue"></form>
                                                        <%
                                                    }
                                        %>
                                    </tr>
                                    <br>
                                    <tr>Resumo: <%=receita.getRec_resumo()%></tr>
                                   
                                <%
                            }//Fim de apresentar a receita
                        %>
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
        <%
                String t = (String) session.getAttribute("tipo");
                int cod = Integer.parseInt(String.valueOf(session.getAttribute("cod")));
                if (t.equals("m")) {
                    transacoes.Medico tnq = new transacoes.Medico();
                    data.MedicoDO medico = tnq.buscar(cod);
                    %>
                    <p align="Right">Médico(a): <%= medico.getUsu_nome()%> <font color="green">Online</font></p>
                    <%
                }else if(t.equals("t")){
                    transacoes.Tecnico tnq = new transacoes.Tecnico();
                    data.TecnicoDO tecnico = tnq.buscar(cod);
                    %>
                    <p align="Right">Técnico(a): <%= tecnico.getUsu_nome()%> <font color="green">Online</font></p>
                    <%
                }else{
                    transacoes.Paciente tnq = new transacoes.Paciente();
                    data.PacienteDO pacient = tnq.buscar(cod);
                    %>
                    <p align="Right">Paciente: <%= pacient.getUsu_nome()%> <font color="green">Online</font></p>
                    <%
                }
        %>
    </body>
</html>