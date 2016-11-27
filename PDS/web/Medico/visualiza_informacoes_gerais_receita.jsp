<%--  
    Visualiza informações gerais do exame
--%>


<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@page import="java.util.Vector"%>
        <%@ page import="java.text.SimpleDateFormat"%>
        <%@ include file="/Geral/verifylogin_medico.jsp" %>
        
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
                        int pac_cod = Integer.parseInt(request.getParameter("pac_cod"));
                        
                        transacoes.Usuario tu = new transacoes.Usuario();
                        data.UsuarioDO paciente = tu.pesquisarPorId(pac_cod);                        
%>
                                <br>  
                                <h2>Receitas - <%= paciente.getUsu_nome() %></h2> 
<%
                        transacoes.Receita tr = new transacoes.Receita(); 
                        Vector receitas = tr.getListaReceitas(pac_cod);
                        
                        if(receitas == null)
                        {
                            %>
                                Paciente não tem receitas!
                              
                                <form action="Home.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                            <%
                        }
                        else
                        {
                            SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                            String datef;
                            for(int i=0;i<receitas.size();i++)
                            {
                                data.ReceitaDO receita = (data.ReceitaDO) receitas.elementAt(i);                                                                                                                           
                                datef = form.format(receita.getRec_data_upload());
                                %>
                                    <br>
                                    <h3>Receita <%= i+1 %></h3>
                                    <br>                                    
                                    Codigo receita - <%= receita.getRec_cod() %>
                                    <br>
                                    <br>
                                    Resumo - <%= receita.getRec_resumo() %>
                                    <br>
                                    <br>
                                    Data upload - <%= datef %>
                                    
                                    <br><br><br>
                                    <form action="VisualizaDocumentos.jsp" method="post">
                                         <input type='hidden' name='pac_cod' value='<%=pac_cod%>'>
                                         <input type="submit" name="voltar" value="Voltar" />
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


