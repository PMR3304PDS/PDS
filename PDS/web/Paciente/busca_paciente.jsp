<%-- 
    ******* PDSPX - Busca do Paciente *********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="transacoes.Tecnico" %>
        <%@ page import="data.TecnicoDO" %>
        <%@ page import="transacoes.Medico" %>
        <%@ page import="data.MedicoDO" %>
        
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
                    <% if ( null != request.getParameter("voltar1")) {
                    %>      <jsp:forward page="./main.jsp" />
                    <% return;
                       }
                       if (null != request.getParameter("voltar2")) {
                    %>      <jsp:forward page="./busca_paciente.jsp"/> 
                    <% return;
                       }
                    %>     
                    
                    <b>BUSCAR</b>
                    <br>
                    Encontre médicos ou técnicos
                    <br>
                    <br>
                    
                    Selecione por quem deseja buscar:
                    <form>
                    <select name = "tipo">
                      <option value="medico">Médico</option>
                      <option value="tecnico">Técnico</option>
                    </select>
                    </form>
                    <br>
                    <br>
                    
                    Selecione a informação que deseja buscar:
                    <form>
                    <select name = "modo">
                      <option value="nome">Nome</option>
                      <option value="rg">RG</option>
                      <option value="cpf">CPF</option>
                      <option value="crm">CRM (apenas médico)</option>
                    </select>
                    </form>
                    <br>
                    <br>

                    <input type="text" name="input"  placeholder="Buscar...">
                    <input type="submit" name="pesquisar" value="pesquisar" />
                    <input type="submit" name="voltar1" value="voltar" />
                    
                    <%
                    if (request.getParameter("pesquisar") != null) {
                        String tipo = request.getParameter("tipo");
                        String modo = request.getParameter("modo");
                        Vector usuarios = new Vector();
                        
                        if (tipo == "medico") {
                           
                            if (modo == "nome") {
                                transacoes.Medico tn = new transacoes.Medico();
                                String nome = request.getParameter("input");
                                usuarios = tn.pesquisarMedicoPorNome(nome);
                            }
                            
                            if (modo == "rg") {
                                transacoes.Medico tn = new transacoes.Medico();
                                String rg = request.getParameter("input");
                                usuarios = tn.pesquisarMedicoPorRg(rg);
                            }
                            
                            if (modo == "cpf") {
                                transacoes.Medico tn = new transacoes.Medico();
                                String cpf = request.getParameter("input");
                                usuarios = tn.pesquisarMedicoPorCpf(cpf);
                            }
                            
                            if (modo == "crm") {
                                transacoes.Medico tn = new transacoes.Medico();
                                String crm = request.getParameter("input");
                                usuarios = tn.pesquisarPorCrm(crm);
                            } 
                        }
                        
                        if (tipo == "tecnico") {
                            
                            if (modo == "nome") {
                                transacoes.Tecnico tn = new transacoes.Tecnico();
                                String nome = request.getParameter("input");
                                usuarios = tn.pesquisarTecnicoPorNome(nome);
                            }
                            
                            if (modo == "rg") {
                                transacoes.Tecnico tn = new transacoes.Tecnico();
                                String rg = request.getParameter("input");
                                usuarios = tn.pesquisarTecnicoPorRg(rg);
                            }
                            
                            if (modo == "cpf") {
                                transacoes.Tecnico tn = new transacoes.Tecnico();
                                String cpf = request.getParameter("input");
                                usuarios = tn.pesquisarTecnicoPorCpf(cpf);
                            }   
                        }
                            
                        
                        if ( (usuarios == null) || (usuarios.size() == 0)) {
                    %>
                    Falha na busca!
                    <form action="./main.jsp" method="post">
                    <input type="submit" name="voltar2" value="Voltar" />
                    </form>

                    <%  
                        } else {
                    %>
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td>CPF</td>
                        </tr> 
                   
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
