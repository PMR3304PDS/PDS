<%-- 
    *******Visualização das Consultas do Paciente*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%// Coloque aqui os imports%>
        <%@ page import="utils.*" %>
        <%@ page import="transacoes.*" %>
        <%@ page import="data.*" %>
        <%@ page import="java.util.*" %>
        <%@ include file="/Geral/verifylogin_paciente.jsp" %>
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
                    <br>
                    <h1>Consultas realizadas</h1><br>
                    <%
                        transacoes.Consulta tc = new transacoes.Consulta();
                        Vector consultas = new Vector();
                        consultas = tc.busca_paciente(Integer.parseInt(String.valueOf(session.getAttribute("cod"))));
                        
                        if (consultas == null) {
                    %>
                            Consultas não encontradas.
                    <%
                        }
                        else {
                    %>
                        <table>
                            <tr>
                                <td>Data &nbsp;</td>
                                <td>Médico &nbsp;</td>
                                <td>Resumo &nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        <%
                            for (int i =0; i < consultas.size(); i++) {
                                data.ConsultaDO c = (ConsultaDO) consultas.elementAt(i);
                                data.MedicoDO m = new data.MedicoDO();
                                transacoes.Medico tm = new transacoes.Medico();
                                m = tm.buscar(c.getMedico_Usuario_Usu_cod());
                        %>
                            <tr>
                                <td><%= c.getCns_data()%> &nbsp;</td>
                                <td>
                                <%
                                    if (m == null) {
                                %>
                                        Inativo &nbsp;
                                <%
                                    }
                                    else {
                                %>
                                    <a href="/PDS/Paciente/VisualizaPerfil.jsp?cod=<%= m.getUsu_cod()%>&tipo=medico">
                                        <%= m.getUsu_nome()%></a> &nbsp;
                                <%
                                    }
                                %>
                                </td>
                                <td><%= c.getCns_resumo()%> &nbsp;</td>
                            </tr>
                            
                    <%
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
