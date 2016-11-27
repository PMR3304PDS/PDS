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
                    
                    if(null != request.getParameter("cancelar")){
                        pageContext.forward("./temppage.jsp");
                    }

                    if(null == request.getParameter("concluir")){
                        %>
                        <form action="./adicionar_receita.jsp" method="post">
                                <b>Adicionar Receita</b>
                                <br>
                                <br>
                                Paciente: <%= p.getUsu_nome() %>
                                <br>
                                Resumo:
                                <br>
                                <textarea cols="10" rows="5" style="width:200px; height:50px;"  name="resumo" required/></textarea>
                                <br>
                                    <%
                                    
                        %>
                        <input type='hidden' name='pac_cod' value='<%=p.getUsu_cod()%>'>
                        <input type="submit" name="concluir" value="Concluir" />
                        <input type="submit" name="cancelar" value="Cancelar" />
                        </form>
                        <%
                        }else{
                            String resumo = request.getParameter("resumo");
                            java.sql.Date dataSQL = new java.sql.Date(LocalDate.now().getYear()-1900,LocalDate.now().getMonthValue(),LocalDate.now().getDayOfMonth());
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
                                <form action="./temppage.jsp" method="post">
                                    <input type="submit" name="pagina_inicial" value="Página Inicial">
                                </form>
                            <%    
                            }else{
                            %>
                                Erro ao adicionar exame
                                <form action="./adicionar_receita.jsp" method="post">
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
