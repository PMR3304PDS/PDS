
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
                    <% if (null != request.getParameter("voltar1")) {
                        response.sendRedirect("/PDS/Geral/temppage.jsp"); 
                        }
                    %>     

                    <b>BUSCAR</b>
                    <br>
                    Encontre médicos ou técnicos
                    <br>
                    <br>
                    
                    <form action="/PDS/Paciente/busca.jsp" method="post">
                    Selecione por quem deseja buscar:
                        <select name = "tipo">
                            <option value="medico">Médico</option>
                            <option value="tecnico">Técnico</option>
                        </select>
                    <br>
                    <br>

                    Selecione a informação que deseja buscar:
                    
                        <select name = "modo">
                            <option value="nome">Nome</option>
                            <option value="rg">RG</option>
                            <option value="cpf">CPF</option>
                            <option value="crm">CRM (apenas médico)</option>
                        </select>
                    
                    <br>
                    <br>

                    <input type="text" name="input"  placeholder="Buscar...">
                    <input type="submit" name="pesquisar" value="pesquisar" />
                    
                    <input type="submit" name="voltar1" value="voltar" />
                    </form>

                    <%
                        if (request.getParameter("pesquisar") != null) {
                            String tipo = request.getParameter("tipo");
                            String modo = request.getParameter("modo");
                            Vector usuarios = new Vector();
                            int flag = 0;

                            if (tipo.equals("medico")) {

                                flag = 1;

                                if (modo.equals("nome")) {
                                    transacoes.Medico tn = new transacoes.Medico();
                                    String nome = request.getParameter("input");
                                    usuarios = tn.pesquisarMedicoPorNome(nome);
                                }

                                if (modo.equals("rg")) {
                                    transacoes.Medico tn = new transacoes.Medico();
                                    String rg = request.getParameter("input");
                                    usuarios = tn.pesquisarMedicoPorRg(rg);
                                }

                                if (modo.equals("cpf")) {
                                    transacoes.Medico tn = new transacoes.Medico();
                                    String cpf = request.getParameter("input");
                                    usuarios = tn.pesquisarMedicoPorCpf(cpf);
                                }

                                if (modo.equals("crm")) {
                                    transacoes.Medico tn = new transacoes.Medico();
                                    String crm = request.getParameter("input");
                                    usuarios = tn.pesquisarPorCrm(crm);
                                }
                            }

                            if (tipo.equals("tecnico")) {

                                if (modo.equals("nome")) {
                                    transacoes.Tecnico tn = new transacoes.Tecnico();
                                    String nome = request.getParameter("input");
                                    usuarios = tn.pesquisarTecnicoPorNome(nome);
                                }

                                if (modo.equals("rg")) {
                                    transacoes.Tecnico tn = new transacoes.Tecnico();
                                    String rg = request.getParameter("input");
                                    usuarios = tn.pesquisarTecnicoPorRg(rg);
                                }

                                if (modo.equals("cpf")) {
                                    transacoes.Tecnico tn = new transacoes.Tecnico();
                                    String cpf = request.getParameter("input");
                                    usuarios = tn.pesquisarTecnicoPorCpf(cpf);
                                }
                            }

                            if ((usuarios == null) || (usuarios.size() == 0)) {
                    %>
                    Falha na busca!
                    <form action="/Paciente/busca.jsp" method="post">
                    <input type="submit" name="voltar" value="Voltar" />
                    </form>

                    <%
                    } else {
                    %>
                    <table>
                        <tr>
                            <td>Nome</td>
                            <td>CPF</td>
                        </tr> 

                        <% if (flag == 1) {
                                for (int i = 0; i < usuarios.size(); i++) {
                                    MedicoDO medico = (MedicoDO) usuarios.elementAt(i);
                        %>
                        <tr>
                            <td>
                                <a href="/PDS/Medico/visualiza_perfil.jsp?cod=<%= medico.getUsu_cod()%>" <%=medico.getUsu_nome()%> </a>
                            </td>
                            <td><%= medico.getUsu_cpf()%></td>
                        </tr>


                        <%
                            }
                        } else {
                            for (int i = 0; i < usuarios.size(); i++) {
                                TecnicoDO tecnico = (TecnicoDO) usuarios.elementAt(i);
                        %>
                        <tr>
                            <td>
                                <a href="/PDS/Medico/visualiza_perfil.jsp?cod=<%= tecnico.getUsu_cod()%>"> <%=tecnico.getUsu_nome()%></a>
                            </td>
                            <td><%= tecnico.getUsu_cpf()%></td>
                        </tr>
                        <%
                                    }
                                }
                        %>
                    </table>
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
