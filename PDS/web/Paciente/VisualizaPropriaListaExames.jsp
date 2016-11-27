<%-- 
    *******VisualizaPropriaListaExames*********
--%>

<%@page import="data.UsuarioDO"%>
<%@page import="java.sql.Date"%>
<%@page import="data.ExameDO"%>
<%@page import="java.util.Vector"%>
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
                    int cod = Integer.parseInt(String.valueOf(session.getAttribute("cod")));
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod);
                    %>
                    <table align="center">
                        <tr>
                            <td><b>Exames do paciente: </b><%=paciente.getUsu_nome()%></td>
                        </tr>
                        <tr>
                            <td>Exame &nbsp;</td>
                            <td>Data de Upload &nbsp;</td>
                            <td>Previsão &nbsp;</td>
                            <td>Médico &nbsp;</td>
                            <td>Técnico &nbsp;</td>
                        </tr>
                        <%
                           transacoes.Exame te = new transacoes.Exame();
                                Vector exames = te.pesquisarPorCod(cod);
                                if ((exames.size() == 0)) {
                            %>
                                    Lista de Exames não encontrada!
                            <%
                                } 
                                else {
                                    for (int i = 0; i < exames.size(); i++) {

                                        ExameDO e = (ExameDO) exames.elementAt(i);
                                        int exa_cod = e.getExa_cod();

                                        transacoes.Tipo_Exame tt = new transacoes.Tipo_Exame();
                                        data.Tipo_ExameDO tip = tt.buscar(e.getTipo_Exame_TipExa_cod());

                                        int med_cod = e.getMedico_Usuario_Usu_cod_uploader();
                                        int tec_cod = e.getTecnico_Usuario_Usu_cod_uploader();
                                        transacoes.Usuario tr = new transacoes.Usuario();
                                        UsuarioDO med = tr.pesquisarPorId(med_cod);
                                        UsuarioDO tec = tr.pesquisarPorId(tec_cod);
                            %>
                                        <tr>
                                            <td>
                                                <a href="/PDS/Geral/VisualizaExames.jsp?exame_cod=<%= e.getExa_cod()%>">
                                                    <%= tip.getTipExa_descricao()%>
                                                </a> &nbsp;
                                            </td>
                                            <td><%= e.getExa_data_upload()%> &nbsp;</td>
                                            <td><%= e.getExa_previsao()%> &nbsp;</td>
                                            <td>
                                            <%
                                                if (med != null) {    
                                            %>
                                                    <a href="/PDS/Paciente/VisualizaPerfil.jsp?cod=<%= med.getUsu_cod()%>&tipo=medico">
                                                        <%= med.getUsu_nome()%>
                                                    </a> &nbsp;
                                            <%
                                                }
                                                else {
                                            %>
                                                    Inativo &nbsp;
                                            <%
                                                }
                                            %>
                                            </td>
                                            <td>
                                            <%
                                                if (tec != null) {    
                                            %>
                                                <a href="/PDS/Paciente/VisualizaPerfil.jsp?cod=<%= tec.getUsu_cod()%>&tipo=tecnico">
                                                    <%= tec.getUsu_nome()%>
                                                </a> &nbsp;
                                            <%
                                                }
                                                else {
                                            %>
                                                    Inativo &nbsp;
                                            <%
                                                }
                                            %>
                                            </td>
                                        </tr>
                                        <%
                                        }
                                    
                                } 
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
