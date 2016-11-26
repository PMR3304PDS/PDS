
<%-- 
    ******* PDST009 - Busca do Técnico *********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="transacoes.Paciente" %>
        <%@ page import="data.PacienteDO" %>

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
                    <% if (null != request.getParameter("voltar1")) {
                        response.sendRedirect("/PDS/Tecnico/Home.jsp"); 
                        }
                    %>     

                    <b>BUSCAR</b>
                    <br>
                    Encontre pacientes
                    <br>
                    <br>
                    
                    <form action="/PDS/Tecnico/Busca.jsp" method="post">
                    Selecione a informação que deseja buscar:
          
                        <select name = "modo">
                            <option value="nome">Nome</option>
                            <option value="rg">RG</option>
                            <option value="cpf">CPF</option>
                        </select>
                    
                    <br>
                    <br>
                    <input type="text" name="input"  placeholder="Buscar...">
                    <input type="submit" name="pesquisar" value="pesquisar" />
                    <input type="submit" name="voltar1" value="voltar" />
                    <br>
                    <br>
                    <%
                        if (request.getParameter("pesquisar") != null) {
                            
                            if (request.getParameter("input").equals("")) {  
                    %>
                    Campo de busca vazio!
                    </form>

                    <%
                            } else {
                                
                            String modo = request.getParameter("modo");
                            String entrada = request.getParameter("input");
                            Vector pacientes = new Vector();
                            
                            if (modo.equals("nome")) {
                                transacoes.Paciente tn = new transacoes.Paciente();
                                String nome = entrada;
                                pacientes = tn.pesquisarPacientePorNome(nome);
                            }

                            if (modo.equals("rg")) {
                                transacoes.Paciente tn = new transacoes.Paciente();
                                String rg = entrada;
                                pacientes = tn.pesquisarPacientePorRg(rg);
                            }

                            if (modo.equals("cpf")) {
                                transacoes.Paciente tn = new transacoes.Paciente();
                                String cpf = entrada;
                                pacientes = tn.pesquisarPacientePorCpf(cpf);
                            }
                                    
                            if ((pacientes == null) || (pacientes.size() == 0)) {
                    %>
                    Nenhum resultado encontrado!
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
                                for (int i = 0; i < pacientes.size(); i++) {
                                    PacienteDO paciente = (PacienteDO) pacientes.elementAt(i);
                        %>
                        <tr>
                            
                            <td>
                                <a href= "/PDS/Tecnico/VisualizaListaExamesPaciente.jsp?Usu_buscado=<%=paciente.getUsu_nome()%>&Paciente_Usuario_Usu_cod=<%=paciente.getUsu_cod()%>">
                                 <%=paciente.getUsu_nome()%> 
                                </a>
                            </td>
                            <td>
                                <%= paciente.getUsu_cpf()%>
                            </td>
                        </tr>

                    
                        <%
                                    }
                                }
                            }
                        }
                        %>
                        
                        </table>


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

