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
        <%@page import="java.text.SimpleDateFormat"%>
        <%@page import="java.sql.Date"%>
        <%@page import="java.text.DateFormat"%>
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
                    <h1>Editar Status Exame</h1>
                    <br>
                    <script>                    
                        function isDate(evt){
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode !== 47 &&(charCode < 48 || charCode > 57)))
                                return false;
                            return true;
                        }                        
                    </script>                   
                    <% 
                    
                    if (null == request.getParameter("excluir") && null == request.getParameter("editar")){
                        int Exa_cod = Integer.parseInt(request.getParameter("exame_cod"));
                        transacoes.Exame tn = new transacoes.Exame();
                        data.ExameDO exame = new data.ExameDO();
                        exame = tn.buscar(Exa_cod);
                        
                        DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
                        String data_upload = df.format(exame.getExa_data_upload());
                        String data_previsao = df.format(exame.getExa_previsao());
%>                         
            <form action="/PDS/Tecnico/AlteraStatusExame.jsp?exame_cod=<%=Exa_cod%>" method="post">
            <table>
            <td>
                
               <tr>
                  <td>Resumo</td>
                  <td><textarea name="resumo" rows="5" cols="20"  style="width:200px; height:50px;"><%=exame.getExa_resumo()%></textarea>
               </tr> 
               <tr>
                  <td>Data Upload (dd/mm/yyyy)</td>
                  <td><input type="text" name="data_upload" maxlength="10" onkeypress="return isDate(event)" required value=<%= data_upload %>/>
               </tr>
               <tr>
                  <td>Data Previsao (dd/mm/yyyy)</td>
                  <td><input type="text" name="data_previsao" maxlength="10" onkeypress="return isDate(event)" required value=<%= data_previsao %>/>
               </tr>                                      
            <br /><br />
            </td>
            </table>
            <br>           
                <input type="submit" name="voltar" value="voltar" />
                <input type="submit" name="editar" value="editar" />  
                <input type="submit" name="excluir" value="excluir" />
            </form>
 
        <%    
             }    
       if (null != request.getParameter("voltar")) {
            response.sendRedirect("/PDS/Tecnico/Home.jsp"); 
       }
       
       if (null != request.getParameter("excluir")) {
           int Exa_cod = Integer.parseInt(request.getParameter("exame_cod"));
           transacoes.Exame tn = new transacoes.Exame();                     
           tn.excluir(Exa_cod);
           
       if (tn.excluir(Exa_cod)) {
%>
          Transação realizada com sucesso!
          <form action="/PDS/Tecnico/Home.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao excluir exame         
          <form action="/PDS/Tecnico/AlteraStatusExame.jsp?exame_cod=<%=Exa_cod%>" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
      }
       
       if (null != request.getParameter("editar")) {
       
       String resumo = request.getParameter("resumo");    
           
       DateFormat df = new SimpleDateFormat("dd/MM/yyyy");    
       String data_up = request.getParameter("data_upload"); 
       java.sql.Date sqldate_up = new java.sql.Date(df.parse(data_up).getTime());
       
       String data_prev = request.getParameter("data_previsao"); 
       java.sql.Date sqldate_prev = new java.sql.Date(df.parse(data_prev).getTime());
       
       int Exa_cod = Integer.parseInt(request.getParameter("exame_cod"));
       
       transacoes.Exame tn = new transacoes.Exame();
       data.ExameDO exame = new data.ExameDO();
       
       exame.setExa_cod(Exa_cod);
       exame.setExa_resumo(resumo);
       exame.setExa_data_upload(sqldate_up);
       exame.setExa_previsao(sqldate_prev);
       
       tn.atualizar_status(exame);
       if (tn.atualizar_status(exame)) {

%>
          Transação realizada com sucesso!
          <form action="/PDS/Tecnico/Home.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao editar status do exame         
          <form action="/PDS/Tecnico/AlteraStatusExame.jsp?exame_cod=<%=Exa_cod%>" method="post">
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
