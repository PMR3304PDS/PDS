<%--
    *******VisualizaReceita*********
--%>


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
        <%@ page import="java.sql.Date"%>
        <%@ page import="data.ReceitaDO"%>
        <%@ page import="java.text.SimpleDateFormat"%>
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
                    String t = (String) session.getAttribute("tipo");
                    int cod_receita = Integer.parseInt(request.getParameter("rec_cod"));
                    int cod_paciente = Integer.parseInt(request.getParameter("pac_cod"));
                    int cod = ((Integer) session.getAttribute("cod")).intValue(); //código do usuario logado
                    transacoes.Paciente tn = new transacoes.Paciente();
                    data.PacienteDO paciente = tn.buscar(cod_paciente);
                    %>
                    <table align="center">
                        <tr>
                            <br>
                            <b>Receita do paciente:  </b><%= paciente.getUsu_nome() %>
                            <br>
                        </tr>
                        <tr>
                            <td><form action="/PDS/Geral/exclui_receita.jsp?rec_cod=<%=cod_receita%>" method="post">
                                    <input type="submit" name="excluir" value="Excluir Receita" />
                                </form>
                            </td>
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
                                String nome_resp = "Invalido";
                                if (resp != null)
                                    nome_resp = resp.getUsu_nome();
                                resp = tn_usu.pesquisarPorId(cod);
                                String nome_paciente_logado = resp.getUsu_nome();
                                SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                                String datef = form.format(receita.getRec_data_upload());
                                %>
                                    <br>
                                    <tr>Cód. Receita: <%=cod_receita%></tr>
                                    <br>
                                    <tr>Data do upload: <%=datef%></tr>
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
                                    if(check==false && t.equals("t")){
                                    %>
                                    <td><form action="/PDS/Tecnico/ReceitaCheck.jsp">
                                        <input type='hidden' name='rec_cod' value='<%=cod_receita%>'>
                                        <input type='hidden' name='pac_cod' value='<%=paciente.getUsu_cod()%>'>
                                        <input type="submit" value="Entregar medicamentos">
                                      </form></td>
                                    <%
                                    }
                            }//Fim de apresentar a receita
                            %>
                                <td><form action="/PDS/Geral/ListaReceitas.jsp">
                                    <input type='hidden' name='Usu_buscado' value='<%=paciente.getUsu_nome()%>'>
                                    <input type='hidden' name='Paciente_Usuario_Usu_cod' value='<%=paciente.getUsu_cod()%>'>
                                    <input type="submit" value="Voltar" ></form></td>
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