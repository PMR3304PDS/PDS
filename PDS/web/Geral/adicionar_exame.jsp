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
                    
                    boolean valido = true;
                    
                    PacienteDO p = null;
                    TecnicoDO t = null;
                    MedicoDO m = null;
                    
                    p = (new Paciente()).buscar(cod);
                    t = (new Tecnico()).buscar(cod);
                    m = (new Medico()).buscar(cod);

                    if(t != null){
                        tec_cod = cod;
                        p = (new Paciente()).buscar(pac_cod);
                    } else if (m != null){
                        med_cod = cod;
                        p = (new Paciente()).buscar(pac_cod);
                    }

                    transacoes.Tipo_Exame lista_tipo_exame = new transacoes.Tipo_Exame();
                    
                    if(null == request.getParameter("concluir")){
                        %>
                        <form action="/PDS/Geral/adicionar_exame.jsp" method="post">
                                <b>Adicionar Exame</b>
                                <br>
                                <br>
                                Paciente: <%= p.getUsu_nome() %>
                                <br><br>
                                Tipo de exame: <select name="tipo_exame" id="tipo_exame">
                                    <%
                                        for (Tipo_ExameDO item : lista_tipo_exame.buscar()){
                                    %>
                                        <option value="<%=item.getTipExa_cod() %>"><%=item.getTipExa_descricao()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <br><br>
                                Data de previsão(dd/mm/yyyy)
                                <input type="text" name="data" maxlength="2" size="2"> <input type="text" name="mes" maxlength="2" size="2"> <input type="text" name="ano" maxlength="4" size="4">
                                <br><br>
                                Resumo:
                                <br>
                                Caracteres restantes: <input disabled  maxlength="3" size="3" value="500" id="counter">
                                <br>
                                <textarea onkeyup="textCounter(this,'counter',500);" id="message" cols="10" rows="5" style="width:500px; height:300px;"  name="resumo" required></textarea>
                                <script>
                                function textCounter(field,field2,maxlimit)
                                {
                                 var countfield = document.getElementById(field2);
                                 if ( field.value.length > maxlimit ) {
                                  field.value = field.value.substring( 0, maxlimit );
                                  return false;
                                 } else {
                                  countfield.value = maxlimit - field.value.length;
                                 }
                                }
                                </script>
                                        <br><br>
                                
                        <input type='hidden' name='pac_cod' value='<%=p.getUsu_cod()%>'>
                        <input type="submit" name="concluir" value="Concluir" />
                        </form>
                        <br>
                        <%
                        if (m != null){
                        %>
                        <form action="/PDS/Medico/visualiza_perfil.jsp" method="post">
                            <input type='hidden' name='cod' value='<%=p.getUsu_cod()%>'>
                        <%
                        }else if (t != null){
                        %>
                        <form action="/PDS/Tecnico/visualiza_perfil.jsp" method="post">
                            <input type='hidden' name='cod' value='<%=p.getUsu_cod()%>'>
                        <%
                        }else{
                        %>
                        <form action="/PDS/Paciente/VisualizaPropriaListaExames.jsp" method="post">
                        <%
                        }
                        %>
                            <input type="submit" name="cancelar" value="Cancelar" />
                        </form>
                        <%
                        }else{
                            String resumo = request.getParameter("resumo");
                            java.sql.Date dataSQL = new java.sql.Date(LocalDate.now().getYear()-1900,LocalDate.now().getMonthValue()-1,LocalDate.now().getDayOfMonth());
                            boolean excluido = false;
                            java.sql.Date data_previsao;
                            try{
                                int data_prev = Integer.parseInt(request.getParameter("data"));
                                int mes_prev = Integer.parseInt(request.getParameter("mes"));
                                int ano_prev = Integer.parseInt(request.getParameter("ano"));

                                data_previsao = new java.sql.Date(ano_prev-1900, mes_prev-1, data_prev);
                                
                                if (data_prev < 1 || data_prev > 31 || mes_prev < 1|| mes_prev > 12 || ano_prev < 1 || LocalDate.now().isAfter(LocalDate.of(ano_prev, mes_prev, data_prev))){
                                    valido = false;
                                    %>
                                    Valores inválidos de data de previsão
                                    <br>
                                    <br>
                                    <%
                                }

                                
                            }catch(NumberFormatException e){
                                data_previsao = null;
                            }                        
                            
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

                            boolean resultado = false;

                            if(valido){
                                resultado = te.incluir(exame);
                            }

                            if(resultado){
                            %>
                                Exame adicionado
                                <%
                                if (m != null){
                                %>
                                <form action="/PDS/Medico/Home.jsp" method="post">
                                <%
                                }else if (t != null){
                                %>
                                <form action="/PDS/Tecnico/Home.jsp" method="post">
                                <%
                                }else{
                                %>
                                <form action="/PDS/Paciente/Home.jsp" method="post">
                                <%
                                }
                                %>
                                    <input type="submit" name="pagina_inicial" value="Página Inicial">
                                </form>
                            <%    
                            }else{
                            %>
                                Erro ao adicionar exame
                                <form action="/PDS/Geral/adicionar_exame.jsp" method="post">
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
