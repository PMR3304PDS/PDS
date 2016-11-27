<%-- 
    PDSX28 - Adicionar Exame
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@page import = "transacoes.*"%>
        <%@page import = "data.*" %>
        <%@page import = "java.util.*"%>
        <%@page import= "java.time.*"%>
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
                    int cod = ((Integer)session.getAttribute("cod")).intValue();
                    int pac_cod = Integer.parseInt(request.getParameter("pac_cod"));
                    int tec_cod = -1;
                    int med_cod = -1;
                    
                    PacienteDO p = null;
                    TecnicoDO t = null;
//                    MedicoDO m = null;
                    
                    p = (new Paciente()).buscar(cod);
                    t = (new Tecnico()).buscar(cod);
//                    m = (new Medico()).buscar(cod);

                    if(t != null){
                        tec_cod = cod;
                        p = (new Paciente()).buscar(pac_cod);
                    }

                    transacoes.Tipo_Exame lista_tipo_exame = new transacoes.Tipo_Exame();
                    
                    if(null == request.getParameter("concluir")){
                        %>
                        <form action="./adicionar_exame.jsp" method="post">
                                <b>Adicionar Exame</b>
                                <br>
                                <br>
                                Paciente: <%= p.getUsu_nome() %>
                                <br>
                                Tipo de exame: <select name="tipo_exame" id="tipo_exame">
                                    <%
                                        for (Tipo_ExameDO item : lista_tipo_exame.buscar()){
                                    %>
                                        <option value="<%=item.getTipExa_cod() %>"><%=item.getTipExa_descricao()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <br>
                                Data de previsão(dd/mm/yyyy)
                                <input type="text" name="data" maxlength="2" size="2"> <input type="text" name="mes" maxlength="2" size="2"> <input type="text" name="ano" maxlength="4" size="4">
                                <br>
                                
                                <br>
                                Resumo:
                                <br>
                                <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo" required/></textarea>
                                <br>
                                    <%
                                    
                        %>
                        <input type='hidden' name='pac_cod' value='<%=p.getUsu_cod()%>'>
                        <input type="submit" name="concluir" value="Concluir" />
                        
                        </form>
                        <form action="/temppage.jsp">
                            <input type="submit" name="cancelar" value="Cancelar" />
                        </form>
                        <%
                        }else{
                            String resumo = request.getParameter("resumo");
                            java.sql.Date dataSQL = new java.sql.Date(LocalDate.now().getYear()-1900,LocalDate.now().getMonthValue(),LocalDate.now().getDayOfMonth());
                            boolean excluido = false;
                            int data_prev = Integer.parseInt(request.getParameter("data"));
                            int mes_prev = Integer.parseInt(request.getParameter("mes"));
                            int ano_prev = Integer.parseInt(request.getParameter("ano"));
                            java.sql.Date data_previsao = new java.sql.Date(ano_prev-1900, mes_prev-1, data_prev);
                            
                            Exame te = new Exame();
                            ExameDO exame = new ExameDO();
                            exame.setExa_exame(null);
                            exame.setExa_resumo(resumo);
                            
                            int cod_tipo_exame = Integer.parseInt(request.getParameter("tipo_exame"));

                            exame.setTipo_Exame_TipExa_cod(cod_tipo_exame);
                            exame.setTecnico_Usuario_Usu_cod_uploader(tec_cod);
                            exame.setPaciente_Usuario_Usu_cod(p.getUsu_cod());
                            exame.setMedico_Usuario_Usu_cod_uploader(med_cod);
                            exame.setExa_excluido(excluido);
                            exame.setExa_data_upload(dataSQL);
                            exame.setExa_previsao(data_previsao);
                            exame.setExa_Solicitar(null);

                            if(te.incluir(exame)){
                            %>
                                Exame adicionado
                                <form action="./temppage.jsp" method="post">
                                    <input type="submit" name="pagina_inicial" value="Página Inicial">
                                </form>
                            <%    
                            }else{
                            %>
                                Erro ao adicionar exame
                                <form action="./adicionar_exame.jsp" method="post">
                                    <input type='hidden' name='pac_cod' value='<%=p.getUsu_cod()%>'>
                                   <input type="submit" name="retry" value="Tentar novamente" />
                                </form>
                            <%
                            }
                        }
                    %>
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
