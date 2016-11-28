<%-- 
    *******Visualiza Exames*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="transacoes.Exame"%>
        <%@ page import="data.ExameDATA"%>
        <%@ page import="data.ExameDO"%>
        <%@ page import="java.util.*"%>
        <%@ page import="java.time.*"%>
        <%@ page import="java.sql.*"%>
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
                
                <br>
                <h1>Dados do Exame</h1>
                <br>
                    
                    <%  
                        String t = (String) session.getAttribute("tipo");    
                        int exame_cod = Integer.parseInt(request.getParameter("exame_cod"));
                        transacoes.Exame tn = new transacoes.Exame();
                        data.ExameDO exame = tn.buscar(exame_cod);
                        SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
                        String dateUpf = form.format(exame.getExa_data_upload());
                        String datePrevf = null;
                        if(exame.getExa_previsao() != null)
                            datePrevf = form.format(exame.getExa_previsao());
                    %>
            <form action="/PDS/Geral/VisualizaExames.jsp?exame_cod=<%=exame_cod%>" method="post">   
              <table>             
              <br>
              Codigo do Exame - <%= exame.getExa_cod()%>
              <br>
              <br>
              Resumo do Exame - <%= exame.getExa_resumo()%>
              <br>
              <br>
              Data Upload - <%= dateUpf%>
              <br>
              <br>
              Data Previsao - <%= datePrevf%>

              <br><br>
              <br>
            
              </table>
            </form>
            <form action="/PDS/Geral/AlteraStatusExame.jsp?exame_cod=<%=exame_cod%>" method="post">
                <input type="submit" name="Editar Status" value="Editar Status" />
            </form>
              <%
              if (t.equals("t")){
              %>
            <form action="/PDS/Tecnico/Busca.jsp" method="post">
                <input type="submit" name="voltar" value="Voltar" />
            </form>
            <%
              }else{              
%>  
            <form action="/PDS/Paciente/VisualizaPropriaListaExames.jsp" method="post">
                <input type="submit" name="voltar" value="Voltar" />
            </form>
<%
              }
%>
        </td>
        </tr>
        <tr>
            <td colspan="2">
                <%@ include file="/Geral/footer.jsp" %>
            </td>
        </tr>
        <tr>
            <td><form action="/PDS/Geral/exclui_receita.jsp?pac_cod=<%=exame_cod%>" method="post">
                    <input type="submit" name="excluir" value="Excluir Receita" />
                </form>
            </td>
        </tr>
    </table>
</body>
</html>

