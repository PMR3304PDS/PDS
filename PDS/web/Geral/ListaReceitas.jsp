<%--
    *******ListaReceitas*********
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
                        int cod_paciente_buscado=1;
                        String paciente_buscado = request.getParameter("Usu_buscado");
                        if(paciente_buscado==null){
                            cod_paciente_buscado=1;
                            paciente_buscado="Gabriel Xavier";
                        }
                    %>
                    <table align="center">
                        <tr>
                            <br>
                            <td><b>Receitas do paciente: </b><%=paciente_buscado%></td>
                            <br>
                        </tr>
                        <tr>
                            <td>C�digo da Receita:</td><td>Data e nome do respons�vel pelo Upload:</td>
                        </tr>
                        <%
                           transacoes.Receita tn_rec = new transacoes.Receita();
                                Vector receitas = tn_rec.getListaReceitas(cod_paciente_buscado);
                                if ((receitas.size() == 0)) {
                        %>
                        Lista de Receitas n�o encontrada!
                        <%      }//fecha if ((receitas.size() == 0)) 
                                else {
                                    for (int i = 0; i < receitas.size(); i++) {
                                        ReceitaDO receita = (ReceitaDO) receitas.elementAt(i);
                                        int rec_cod = receita.getRec_cod();
                                        Date data = receita.getRec_data_upload();
                                        int resp_cod = receita.getMedico_Usuario_Usu_cod();
                                        UsuarioDO resp = new UsuarioDO();
                                        transacoes.Usuario tr = new transacoes.Usuario();
                                        resp = tr.pesquisarPorId(resp_cod);
                                        String nome_resp = resp.getUsu_nome();
                                        %>
                                            <tr>
                                                <%
                                                    String t = (String) session.getAttribute("tipo");
                                                    if(t.equals("t")){
                                                        %>
                                                        <td><form action="ReceitaCheck.jsp"><input type="submit" value="<%=rec_cod%>" id="RecSelecionada"></form></td>
                                                        <%
                                                    }//fim do if � tecnico
                                                    else{
                                                        %>
                                                        <td><%=rec_cod%></td>
                                                        <%
                                                    }//fim do NOTtecnico
                                                %>
                                                <td><%=data%> - <%=nome_resp%></td>
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
                    <p align="Right">M�dico(a): <%= medico.getUsu_nome()%> <font color="green">Online</font></p>
                    <%
                }else if(t.equals("t")){
                    transacoes.Tecnico tnq = new transacoes.Tecnico();
                    data.TecnicoDO tecnico = tnq.buscar(cod);
                    %>
                    <p align="Right">T�cnico(a): <%= tecnico.getUsu_nome()%> <font color="green">Online</font></p>
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

