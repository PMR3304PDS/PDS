<%-- 
    *******Editar Ficha Medica Paciente*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
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
                    <h1>Editar Ficha M�dica</h1>
                    <br>
                    
                    <script>
                        function isNumberKey(evt){
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode !== 46 &&(charCode < 48 || charCode > 57)))
                                return false;
                            return true;
                        }
                        
                    </script>
                    
<%     String action = request.getParameter("atualizar");
       if ( null == action ) {
          action = "showEditForm";
          int Usu_cod =  ((Integer)session.getAttribute("Usu_cod")).intValue();
	  transacoes.Paciente tn = new transacoes.Paciente();
          data.PacienteDO paciente = tn.buscar(Usu_cod);
%>        
          <form action="./EditarFichaMedica.jsp" method="post">   
              <table>
               <tr>
                  <td>Peso</td>
                  <td><input type="text" name="peso" maxlength="9" onkeypress='return isNumberKey(event)' value=<%= paciente.getPac_peso() %> />
               </tr>
               <tr>
                  <td>Altura</td>
                  <td><input type="text" name="altura" maxlength="9" onkeypress='return isNumberKey(event)' value=<%= paciente.getPac_altura() %> />
               </tr>
               <tr><td><br></td></tr>
               <tr>
                  <td>Alergias</td>
                  <td><textarea name="alergias" maxlength="300" rows="4" cols="50" value=<%= paciente.getPac_alergias() %>/></textarea>
               </tr>
               <tr>
                  <td>Medicamentos</td>
                  <td><textarea name="medicamentos" maxlength="300" rows="4" cols="50" value=<%= paciente.getPac_medicamentos() %>/></textarea>
               </tr>
               <tr>
                   <td>Doen�as em tratamento</td>
                   <td><textarea name="doencas" maxlength="300" rows="4" cols="50" value=<%= paciente.getPac_doencas_tratamento() %>/></textarea>
               </tr>
               <tr>
                   <td>Hist�rico de doen�as</td>
                   <td><textarea name="historico" maxlength="300" rows="4" cols="50" value=<%= paciente.getPac_historico_doencas() %>/></textarea>
               </tr>
               <tr><td><br></td></tr>
                          
             </table>
             <input type="submit" name="atualizar" value="atualizar" />
             <a href="main.jsp">Voltar</a>
	     <input type="hidden" name="Usu_cod" value=<%= Usu_cod %> />
	     <input type="hidden" name="action" value="updateValues" />

           </form>
<%         
       } // showEditForm
%>

<! ------------------------------------------------------------------->

<%
     if (action.equals("updateValues")) {
       String peso_s = request.getParameter("peso");
       float peso = Float.parseFloat(peso_s);
       String altura_s = request.getParameter("altura");
       float altura = Float.parseFloat(altura_s);
       String alergias = request.getParameter("alergias");
       String medicamentos = request.getParameter("medicamentos");
       String doencas = request.getParameter("doencas");
       String historico = request.getParameter("historico");

       transacoes.Paciente tn = new transacoes.Paciente();
       data.PacienteDO paciente = new data.PacienteDO();
       
       paciente.setPac_nascimento(paciente.getPac_nascimento());
       paciente.setPac_peso(peso);
       paciente.setPac_altura(altura);
       paciente.setPac_alergias(alergias);
       paciente.setPac_medicamentos(medicamentos);
       paciente.setPac_doencas_tratamento(doencas);
       paciente.setPac_historico_doencas(historico);
       
       try {
          tn.atualizar(paciente);
       } catch (Exception e) {
%>           <%= e.toString() %>
<%
       }
       
       if (tn.atualizar(paciente)) {

%>
          Transa��o realizada com sucesso!
          <form action="index.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao editar ficha m�dica          
          <form action="EditarFichaMedica.jsp" method="post">
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
