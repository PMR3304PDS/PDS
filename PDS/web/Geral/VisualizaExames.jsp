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
                    <% int exame_cod;
                        try {
                            exame_cod = Integer.parseInt(request.getParameter("exame_cod"));
                            } catch (NumberFormatException e) {
                            exame_cod = 0;
                       
                    %>
                Erro ao tentar ver Exame!
                <form action="/PDS/Tecnico/Busca.jsp" method="post">
                <input type="submit" name="Voltar" value="Voltar" />
                </form>
                
                <%
                    }
                    transacoes.Exame tn = new transacoes.Exame();

                    data.ExameDO exame = tn.buscar(exame_cod);

                    String resumo = exame.getExa_resumo();
                   
                    java.sql.Date data_up = exame.getExa_data_upload();
                    
                    java.sql.Date data_prev = exame.getExa_previsao();
                %>
                
                <tr>
                <td>
  
                </td>
                
                <td>
                    Código do Exame - <%= exame.getExa_cod() %>
                    <br />
                    <br />
                    Resumo do Exame - <%= resumo %>
                    <br />
                    <br />
                    Data Upload - <%= data_up %>
                    <br />
                    <br />
                    Data Previsão - <%= data_prev%>
<br /><br />
                    
                    <br>
                    <form action="/PDS/Tecnico/Busca.jsp" method="post">
                        <input type="submit" name="voltar" value="Voltar" />
                    </form>
                    
                    <form action="/PDS/Tecnico/AlterarStatusExame.jsp?exame_cod=<%=exame_cod%>" method="post">
                        <input type="submit" name="Editar Status" value="Editar Status" />
                    </form>
                    
                </td>
            </tr>

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
