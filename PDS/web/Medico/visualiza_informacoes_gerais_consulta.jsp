<%--  
    Visualiza informações gerais da consulta
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.text.SimpleDateFormat"%>
        <%@ include file="../Geral/verifylogin.jsp" %>
        
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
                    <%-- Começo JSP --%>
                    <%
                        int pac_cod;
                        pac_cod = Integer.parseInt(request.getParameter("pac_cod"));
                        transacoes.Usuario tn_usu = new transacoes.Usuario();
                        data.UsuarioDO paciente = tn_usu.pesquisarPorId(pac_cod);
%>                              <br>  
                                <h2>Consultas - <%= paciente.getUsu_nome() %></h2> 
<%                         
                        transacoes.Consulta tn_cns = new transacoes.Consulta(); 
                        java.util.Vector todasconsultas = tn_cns.busca_paciente(pac_cod);
                        
                        if((todasconsultas==null)||(todasconsultas.size()<=0)||(paciente==null))
                        {
                            %>
                                Paciente não tem consultas ou foi excluido!
                                <br><br><br>
                                <form action="Home.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                            <%
                        }
                        else
                        {
                            SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                            String datef;
                            for(int i=0;i<todasconsultas.size();i++)
                            {
                                data.ConsultaDO consulta = (data.ConsultaDO) todasconsultas.elementAt(i);

                                int med_cod = consulta.getMedico_Usuario_Usu_cod();
                                transacoes.Medico tn_med = new transacoes.Medico();
                                data.MedicoDO medico = tn_med.buscar(med_cod);

                                datef = form.format(consulta.getCns_data());
                                String resumo = consulta.getCns_resumo();                                
                                int codigo = consulta.getCns_cod();
                                %>
                                    <br>
                                    <h3>Consulta <%= i+1 %></h3>
                                    <br>                                    
                                    Codigo consulta - <%= codigo %>
                                    <br>
                                    <br>
                                    Data - <%= datef %>
                                    <br>
                                    <br>
                                    Resumo - <%= resumo %>
                                    <br>
                                    <br>
                                    <% 
                                    if(medico!=null)
                                    {
                                %>
                                    Medico - <%= medico.getUsu_nome() %>
                                    <br>
                                    <br>
                                <%
                                    }else{
                                %>
                                    Medico responsavel - Medico indisponivel no sistema
                                    <br>
                                    <br>
                                <%                                        
                                    }
                                
                                    int medicoatual = ((Integer)session.getAttribute("cod")).intValue();
                                    if(medicoatual==med_cod)
                                    {
                                        int cns_cod = consulta.getCns_cod();
                                %>
                                        <form action="edita_resumo_consulta.jsp?cns_cod=<%=cns_cod%>" method="post">
                                            <input type="submit" name="Editar Resumo" value="Editar resumo" />
                                        </form>
                                <%
                                    }
                                %>
                                <br><br><br>
                            <%
                            }
                        }
                    %>
                        <form action="VisualizaDocumentos.jsp?pac_cod=<%=pac_cod%>" method="post">
                            <input type="submit" name="voltar" value="Voltar" />
                        </form>
                    <%-- Fim JSP --%>
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
