<%-- 
    *******Altera Status Exame*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@page import="java.text.ParseException"%>
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
                    <h1>Alterar Status Exame</h1>
                    <br>
                    
                    <% 
                    
                    if (null == request.getParameter("excluir") && null == request.getParameter("editar")){
                        int Exa_cod = Integer.parseInt(request.getParameter("exame_cod"));
                        transacoes.Exame tn = new transacoes.Exame();
                        data.ExameDO exame = new data.ExameDO();
                        try{
                        exame = tn.buscar(Exa_cod);
                        } catch(Exception e){
%>           <%= e.toString() %>
<%
                        }                        
                        if (exame == null){
%>
                    Exame inexistente!
            <form>
                 <input type="submit" name="voltar" value="voltar" />
            </form>
<%                  
                        }else{
 %>
                
            
            <form action="/PDS/Tecnico/AlteraStatusExame.jsp?exame_cod=<%=Exa_cod%>" method="post">
            <table>
            <td>
                    Código do Exame - <%= Exa_cod %>
                    <br />
                    <br />
                    Resumo do Exame - <%= exame.getExa_resumo() %>
                    <br />
                    <br />
                    Data Upload - <%= exame.getExa_data_upload() %>
                    <br />
                    <br />
                    Data Previsão - <%= exame.getExa_previsao()%>
                    
            <br /><br />
            </td>
            </table>
            
            
                <input type="submit" name="voltar" value="voltar" />
                <input type="submit" name="editar" value="editar datas" />  
                <input type="submit" name="excluir" value="excluir" />
            </form>
 
        <%    }
             }    
       if (null != request.getParameter("voltar")) {
            response.sendRedirect("/PDS/Tecnico/Home.jsp"); 
       }
       
       if (null != request.getParameter("editar datas")) {
        // fazer
       }
       
       if (null != request.getParameter("excluir")) {
           int Exa_cod = Integer.parseInt(request.getParameter("exame_cod"));
           transacoes.Exame tn = new transacoes.Exame(); 
           try {                       
                tn.excluir(Exa_cod);
       } catch (Exception e) {
%>           <%= e.toString() %>
<%
       }
       
       if (tn.excluir(Exa_cod)) {

%>
          Transação realizada com sucesso!
          <form action="/PDS/Tecnico/Home.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao editar ficha médica          
          <form action="/PDS/Tecnico/AlteraStatusExame.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
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
