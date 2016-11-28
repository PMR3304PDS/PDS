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
%>                              <br>  
                                <h2>Exames - <%= paciente.getUsu_nome() %></h2> 
<%   
                        transacoes.Exame te = new transacoes.Exame(); 
                        Vector exames = te.pesquisarPorCod(pac_cod);
                        
                        if(exames ==null || exames.size() <= 0)
                        {
                            %>
                                Paciente não tem exames!
                            <%
                        }
                        else
                        {
                            SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                            String dateUpf;
                            String datePrevf = null;
                            for(int i=0;i<exames.size();i++)
                            {
                                data.ExameDO exame = (data.ExameDO) exames.elementAt(i);                                                                                                                                                                                                                          
                               
                                transacoes.Tipo_Exame tt = new transacoes.Tipo_Exame();
                                data.Tipo_ExameDO tip = tt.buscar(exame.getTipo_Exame_TipExa_cod());
                                dateUpf = form.format(exame.getExa_data_upload());  
                                
                                transacoes.Usuario tm = new transacoes.Usuario();
                                data.UsuarioDO medico = tm.pesquisarPorId(exame.getMedico_Usuario_Usu_cod_uploader()); 
                                
                                String medico_resp;                                
                                if (medico != null){
                                        medico_resp = medico.getUsu_nome();
                                }else{
                                        medico_resp = "Medico indisponivel no sistema"; 
                                }                                
                                
                                transacoes.Usuario ttec = new transacoes.Usuario();
                                data.UsuarioDO tecnico = ttec.pesquisarPorId(exame.getTecnico_Usuario_Usu_cod_uploader());
                                
                                String tecnico_resp;
                                if (tecnico != null){
                                        tecnico_resp = tecnico.getUsu_nome();
                                }else{
                                        tecnico_resp = "Tecnico indisponivel no sistema";
                                }
                                %>
                                    <br>
                                    <h3>Exame <%= i+1 %></h3>
                                    <br>                                    
                                    Codigo exame - <%= exame.getExa_cod() %>
                                    <br>
                                    <br>
                                    Tipo exame - <%= tip.getTipExa_descricao() %>
                                    <br>
                                    <br>
                                    Resumo - <%= exame.getExa_resumo() %>
                                    <br>
                                    <br>
                                    Data upload - <%= dateUpf %>
                                    
<%                                 
                                    if (exame.getExa_previsao() != null){
                                        datePrevf = form.format(exame.getExa_previsao());
%>
                                    <br>
                                    <br>
                                     Data previsao - <%= datePrevf %>
<%
                                    }                               
                                    
%>
                                    <br>
                                    <br>
                                    Medico responsável - <%= medico_resp %>
                                    <br>
                                    <br>
                                    Tecnico responsável - <%= tecnico_resp %>
                                 <%
                                    }
                                }
                                %>  
                                <br><br><br>
                                <form action="VisualizaDocumentos.jsp" method="post">
                                    <input type='hidden' name='pac_cod' value='<%=pac_cod%>'>
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
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

