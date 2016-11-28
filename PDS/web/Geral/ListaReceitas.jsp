<%--
    *******ListaReceitas*********
--%>

<%@page import="data.PacienteDATA"%>
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
        <%@ page import="transacoes.Paciente" %>
        <%@ page import="data.PacienteDO" %>
        <%@ page import="data.UsuarioDO" %>
        <%@ page import="java.text.SimpleDateFormat"%>
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
                        int cod_paciente_buscado = Integer.parseInt(request.getParameter("Paciente_Usuario_Usu_cod"));
                        Paciente tn = new Paciente();
                        PacienteDO p = tn.buscar(cod_paciente_buscado);
                        String paciente_buscado = request.getParameter("Usu_buscado");
                    %>
                    <table align="center">
                        <tr>
                            <br>
                            <td><b>Receitas do paciente: </b><%=p.getUsu_nome()%></td>
                            <br>
                        </tr>
                        <tr>
                            <td>Código da Receita:</td><td>Data e nome do responsável pelo Upload:</td>
                        </tr>
                        <%
                           transacoes.Receita tn_rec = new transacoes.Receita();
                                Vector receitas = tn_rec.getListaReceitas(cod_paciente_buscado);
                                if ((receitas.size() == 0)) {
                        %>
                        Lista de Receitas não encontrada!
                        <%      }//fecha if ((receitas.size() == 0)) 
                                else {
                                    SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                                    String datef;
                                    for (int i = 0; i < receitas.size(); i++) {
                                        ReceitaDO receita = (ReceitaDO) receitas.elementAt(i);
                                        int rec_cod = receita.getRec_cod();
                                        int resp_cod = receita.getMedico_Usuario_Usu_cod();
                                        int pac_cod = receita.getPaciente_Usuario_Usu_cod();
                                        UsuarioDO resp = new UsuarioDO();
                                        transacoes.Usuario tr = new transacoes.Usuario();
                                        resp = tr.pesquisarPorId(resp_cod);
                                        String nome_resp = "Inválido";
                                        if (resp != null)
                                            nome_resp = resp.getUsu_nome();
                                        datef = form.format(receita.getRec_data_upload());
                                        %>
                                            <tr>
                                                <td><form action="/PDS/Geral/VisualizaReceita.jsp" method="post">
                                                    <input type="hidden" value="<%=pac_cod%>" name="pac_cod">
                                                    <input type="hidden" value="<%=rec_cod%>" name="rec_cod">
                                                    <input type="submit" value="<%=rec_cod%>">
                                                    </form></td>
                                                <td><%=datef%> - <%=nome_resp%></td>
                                            </tr>
                                        <%
                                        }//fecha for todas as receitas foram listadas 
                                    
                                }//fecha else ((receitas.size() != 0)) 
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

