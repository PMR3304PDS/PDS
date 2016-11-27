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
                    String t = (String) session.getAttribute("tipo");
                    int cod_receita = Integer.parseInt(String.valueOf(session.getAttribute("rec_cod")));
                    int cod = Integer.parseInt(String.valueOf(session.getAttribute("cod")));//código do usuario logado
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod_receita);
                    %>
                    <table align="center">
                        <tr>
                            <br>
                            <b>Receita do paciente: </b><%=paciente.getUsu_nome()%>
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
                                //check=false;
                                UsuarioDO resp = new UsuarioDO();
                                transacoes.Usuario tn_usu = new transacoes.Usuario();
                                resp = tn_usu.pesquisarPorId(resp_cod);
                                String nome_resp = resp.getUsu_nome();
                                resp = tn_usu.pesquisarPorId(cod);
                                String nome_paciente_logado = resp.getUsu_nome();
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
                                            } else{
                                                %>
                                                Receita ainda não foi entregue ao paciente.
                                                <%
                                                    //String t = (String) session.getAttribute("tipo");
                                                    //if(t.equals("t")){

                                            }//fim do else=>Receita não foi entregue
                                        %>
                                    </tr>
                                    <br>
                                    <tr>Resumo: </tr>
                                    <br>
                                    <tr><%=receita.getRec_resumo()%></tr>          
                                <%
                                    if(check==false){
                                    %>
                                    <td><form action="../Tecnico/ReceitaCheck.jsp"><input type="submit" value="Entregar medicamentos" id="RecCheck"></form></td>
                                    <%
                                    }
                            }//Fim de apresentar a receita
                            %>
                                <td><form action="../Geral/ListaReceitas.jsp"><input type="submit" value="Voltar" ></form></td>
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