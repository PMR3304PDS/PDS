<%-- 
    *******VisualizaPropriaListaReceitas*********
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.sql.Date"%>
<%@page import="data.ReceitaDO"%>
<%@page import="java.util.Vector"%>
<%@ page import="java.text.SimpleDateFormat"%>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@ include file="/Geral/verifylogin_paciente.jsp" %>
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
                    int cod = Integer.parseInt(String.valueOf(session.getAttribute("cod")));
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod);
                    %>
                    <table align="center">
                        <tr>
                            <br>
                            <td><b>Receitas do paciente: </b><%=paciente.getUsu_nome()%></td>
                            <br>
                        </tr>
                        <tr>
                            <td>Código da Receita:</td><td>Data e nome do responsável pelo Upload:</td>
                        </tr>
                        <%
                           transacoes.Receita tn_rec = new transacoes.Receita();
                                Vector receitas = tn_rec.getListaReceitas(cod);
                                if ((receitas.size() == 0)) {
                                    %>
                                    Lista de Receitas não encontrada!
                                    <%
                                }//fecha if ((receitas.size() == 0)) 
                                else {
                                    SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                                    String datef;
                                    for (int i = 0; i < receitas.size(); i++) {
                                        ReceitaDO receita = (ReceitaDO) receitas.elementAt(i);
                                        int rec_cod = receita.getRec_cod();
                                        session.setAttribute("rec_cod", rec_cod);
                                        datef = form.format(receita.getRec_data_upload());
                                        int resp_cod = receita.getMedico_Usuario_Usu_cod();
                                        UsuarioDO resp = new UsuarioDO();
                                        transacoes.Usuario tr = new transacoes.Usuario();
                                        resp = tr.pesquisarPorId(resp_cod);
                                        String nome_resp = "Inativo";
                                        if (resp != null)
                                            nome_resp = resp.getUsu_nome();
                                        %>
                                            <tr>
                                                <td><form action="../Geral/VisualizaReceita.jsp"><input type="submit" value="<%=rec_cod%>" id="RecSelecionada"></form></td>
                                                <td><%=datef%> - <%=nome_resp%></td>
                                            </tr>
                                        <%
                                        }//fecha for todas as receitas foram listadas 
                                    
                                }//fecha else ((receitas.size() != 0)) 
                        %>
                        <tr>
                            <td><form action="/PDS/Geral/adicionar_receita.jsp?pac_cod=<%= cod %>" method="post">
                                    <input type="submit" name="adicionar" value="Adicionar Receita" />
                                </form>
                            </td>
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
         <%
                String t = (String) session.getAttribute("tipo");
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
