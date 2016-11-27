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
                    
                    <%  int exame_cod = Integer.parseInt(request.getParameter("exame_cod"));
                        transacoes.Exame tn = new transacoes.Exame();
                        data.ExameDO exame = tn.buscar(exame_cod);
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
              Data Upload - <%= exame.getExa_data_upload()%>
              <br>
              <br>
              Data Previsao - <%= exame.getExa_previsao()%>

              <br><br>
              <br>
            
              </table>
            </form>
              
            <form action="/PDS/Tecnico/AlteraStatusExame.jsp?exame_cod=<%=exame_cod%>" method="post">
                <input type="submit" name="Editar Status" value="Editar Status" />
            </form>
                
            <form action="/PDS/Tecnico/Busca.jsp" method="post">
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

