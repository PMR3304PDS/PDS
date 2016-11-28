<%-- 
    PDSX029 -Adicionar Receita
--%>

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
//                    TecnicoDO t = null;
                    MedicoDO m = null;
                    
                    p = (new Paciente()).buscar(cod);
//                    t = (new Tecnico()).buscar(cod);
                    m = (new Medico()).buscar(cod);
                    
                    if(m != null){
                        med_cod = cod;
                        p = (new Paciente()).buscar(pac_cod);
                    }

                    if(null == request.getParameter("concluir")){
                        %>
                        <form action="/PDS/Geral/adicionar_receita.jsp" method="post">
                                <b>Adicionar Receita</b>
                                <br>
                                <br>
                                Paciente: <%= p.getUsu_nome() %>
                                <br>
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
                                <br>
                                    <%
                                    
                        %>
                        <input type='hidden' name='pac_cod' value='<%=p.getUsu_cod()%>'>
                        <input type="submit" name="concluir" value="Concluir" />
                        </form>
                        <%
                        if (m != null){
                        %>
                        <form action="/PDS/Medico/visualiza_perfil.jsp" method="post">
                            <input type='hidden' name='cod' value='<%=p.getUsu_cod()%>'>
                        <%
                        }else{
                        %>
                        <form action="/PDS/Paciente/VisualizaPropriaListaReceitas.jsp" method="post">
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
                            boolean check = false;
                            
                            Receita tr = new Receita();
                            ReceitaDO receita = new ReceitaDO();
                            
                            receita.setRec_excluido(excluido);
                            receita.setRec_data_upload(dataSQL);
                            receita.setPaciente_Usuario_Usu_cod(pac_cod);
                            receita.setMedico_Usuario_Usu_cod(med_cod);
                            receita.setRec_check(check);
                            receita.setRec_receita(null);
                            receita.setRec_resumo(resumo);
                            receita.setTecnico_Usuario_Usu_cod(tec_cod);

                            if(tr.incluir(receita)){
                            %>
                                Receita adicionada
                                <%
                                if(m != null){
                                %>
                                <form action="/PDS/Medico/Home.jsp" method="post">
                                <%
                                }else{
                                %>
                                <form action="/PDS/Paciente/Home.jsp"" method="post">
                                <%
                                }
                                %>
                                    <input type="submit" name="pagina_inicial" value="Página Inicial">
                                </form>
                            <%
                            }else{
                            %>
                                Erro ao adicionar exame
                                <form action="/PDS/Geral/adicionar_receita.jsp" method="post">
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
