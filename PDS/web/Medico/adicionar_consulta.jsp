<%-- 
    PDSM021 - Adicionar nova consulta
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
                        int med_cod = ((Integer)session.getAttribute("cod")).intValue();
                        int pac_cod = Integer.parseInt(request.getParameter("pac_cod"));
                        transacoes.Paciente tp = new transacoes.Paciente();
                        data.PacienteDO paciente = new data.PacienteDO();
                        paciente = tp.buscar(pac_cod);
                        String paciente_nome = paciente.getUsu_nome();
                        if(null == request.getParameter("adicionar")){
                    %>
                    <form action="/PDS/Medico/adicionar_consulta.jsp" method="post">
                        <b>Nova Consulta</b>
                        <br>
                        <br>
                        Nome do paciente: <%= paciente_nome%>
                        <br>
                        <br>
                        Resumo da consulta:
                        <br>
                        <textarea cols="10" rows="5" style="width:500px; height:300px;"  name="resumo"></textarea>
                        <br>
                        <br>
                        <input type="submit" name="adicionar" value="Adicionar" />
                    </form>
                    <form action="/PDS/Medico/visualiza_perfil.jsp">
                        <input type='hidden' name='cod' value='<%=pac_cod%>'>
                        <input type="submit" name="Voltar" value="Voltar">  
                    </form>
                    <br>
                    <%
                        }else{
                            String resumo = request.getParameter("resumo");
                            java.sql.Date dataSQL = new java.sql.Date(LocalDate.now().getYear()-1900,LocalDate.now().getMonthValue(),LocalDate.now().getDayOfMonth());
                            transacoes.Consulta tc = new transacoes.Consulta();
                            data.ConsultaDO consulta = new data.ConsultaDO();
                            consulta.setMedico_Usuario_Usu_cod(med_cod);
                            consulta.setPaciente_Usuario_Usu_cod(paciente.getUsu_cod());
                            consulta.setCns_data(dataSQL);
                            consulta.setCns_resumo(resumo);
                            if(tc.incluir(consulta)){
                                int cns_cod = consulta.getCns_cod();
                            %>
                                Consulta adicionada
                                <form action='/PDS/Medico/edita_resumo_consulta.jsp' method="post">
                                    <input type='hidden' name='cns_cod' value='<%=cns_cod%>'>
                                    <input type="submit" name="editar" value="Editar">
                                </form>
                                <form action='/PDS/Geral/adicionar_receita.jsp' method="post">
                                    <input type='hidden' name='pac_cod' value='<%=pac_cod%>'>
                                    <input type="submit" name="adicionar_receita" value="Adicionar receita">
                                </form>
                            <%    
                            }else{
                            %>
                                Erro ao adicionar consulta          
                                <form action="/PDS/Medico/adicionar_consulta.jsp" method="post">
                                    <input type='hidden' name='pac_cod' value='<%=pac_cod%>'>
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
