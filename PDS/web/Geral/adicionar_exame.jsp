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
        <%@ page import = "transacoes.*"%>
        <%@page import = "data.*" %>
        <%@page import="java.util.*"%>
        <%@ include file="/Geral/verifylogin.jsp" %>
        <% 
            if(null != request.getParameter("cancelar")){
                pageContext.forward("./temppage.jsp");
            }
            
        %>
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
//                        int cod = ((Integer)session.getAttribute("cod")).intValue();
//                        int pac_cod = Integer.getInteger(request.getParameter("pac_cod"));
                    int cod = ((Integer)session.getAttribute("cod")).intValue();;
                    int pac_cod = -1;
                    boolean valido = true;
                    
                    try
                    {
                      pac_cod = Integer.parseInt(request.getParameter("pac_cod"));
                    }
                    catch(NumberFormatException e)
                    {
                      valido = false;
                    }
                    MedicoDO m = null;
                    PacienteDO p = null;
                    TecnicoDO t = null;
                    if (valido)
                    {
                      p = (new Paciente()).buscar(cod);
                      m = (new Medico()).buscar(cod);
                      t = (new Tecnico()).buscar(cod);
                      
                      if(p == null && m == null && t == null)
                        valido = false;
                    }
                    
                    if(valido)
                    {
                        
                        transacoes.Tipo_Exame lista_tipo_exame = new Tipo_Exame();
                        
                        if(null != request.getParameter("cancelar")){
                            pageContext.forward("./temppage.jsp");
                        }
                        
                        if(null == request.getParameter("concluir")){
                            %>
                            <form action="./adicionar_exame.jsp" method="post">
                                <%
                                    if(p != null){
                                %>
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
                                    <input type="file" name="arquivo">
                                    <br>
                                    Resumo:
                                    <br>
                                    <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo"></textarea>
                                    <br>
                                    <%
                                    }
                        %>
                        <input type='hidden' name='pac_cod' value='<%=p.getUsu_cod()%>'>
                        <input type="submit" name="concluir" value="Concluir" />
                        <input type="submit" name="cancelar" value="Cancelar" />
                        </form>
                        <%
                        }else{
                            String resumo = request.getParameter("resumo");
                            Date data = new Date();
                            java.sql.Date dataSQL = new java.sql.Date(data.getYear(), data.getMonth(), data.getDay());
//                            String tipo_exame = request.getParameter("tipo_exame");
                            boolean excluido = false;
                            
                            Exame tn = new Exame();
                            ExameDO exame = new ExameDO();
                            exame.setExa_exame(null);
                            exame.setExa_resumo(resumo);
                            
                            int cod_tipo_exame = Integer.getInteger(request.getParameter("tipo_exame"));

                            exame.setTipo_Exame_TipExa_cod(cod_tipo_exame);
                            exame.setTecnico_Usuario_Usu_cod_uploader(null);
                            exame.setPaciente_Usuario_Usu_cod(p.getUsu_cod());
                            exame.setMedico_Usuario_Usu_cod_uploader(null);
                            exame.setExa_excluido(excluido);
                            exame.setExa_data_upload(dataSQL);
                            exame.setExa_previsao(null);
                            exame.setExa_Solicitar(null);

                            if(tn.incluir(exame)){
                            %>
                                Exame adicionado
                                <form action="./temppage.jsp" method="post">
                                    <input type="submit" name="solicitar_exame" value="Solicitar exame">
                                </form>
                                <form action="./temppage.jsp" method="post">
                                    <input type="submit" name="adicionar_receita" value="Adicionar receita">
                                </form>
                            <%    
                            }else{
                            %>
                                Erro ao adicionar exame        
                                <form action="./adicionar_exame.jsp" method="post">
                                   <input type="submit" name="retry" value="Tentar novamente" />
                                </form>
                            <%
                            }
                            
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
