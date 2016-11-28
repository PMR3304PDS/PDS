<%-- 
    *******Nome do UC*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="transacoes.*"%>
        <%@ page import="data.*"%>
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
                    <h1> Mensagens </h1></br>
                    <%
                    int codRec = ((Integer)session.getAttribute("cod")).intValue();
                    Vector v = (new Mensagem()).pesquisarPorCodDoReceptorMaisRecente(codRec);
                    Vector novas = new Vector();
                    Vector velhas = new Vector();
                    for(int i = 0; i < v.size(); i++)
                    {
                        MensagemDO m = (MensagemDO)v.elementAt(i);
                        if(!m.isMsg_visualizado() && m.getUsuario_emissor() != codRec)
                          novas.add(m);
                        else
                          velhas.add(m);
                    }
                    if(novas.size() == 0)
                    {
                    %>
                      <h3>Não há conversas com novas mensagens</h3>
                    <%
                    }
                    else
                    {
                    %>
                        <h3>Conversas com Novas Mensagens</h3>
                        <table>
                            <tr>
                                <th>Nome</th>
                                <th>Última mensagem</th>
                            </tr>
                        <%
                        for(int i = 0; i < novas.size(); i++)
                        {
                            UsuarioDO u = null;
                            int cod_link;
                            if(((MensagemDO)novas.elementAt(i)).getUsuario_emissor() != codRec)
                            {
                                u = (new Usuario()).pesquisarPorIdComInativo(((MensagemDO)novas.elementAt(i)).getUsuario_emissor());
                                cod_link = ((MensagemDO)novas.elementAt(i)).getUsuario_emissor();
                            }
                            else
                            {
                                u = (new Usuario()).pesquisarPorIdComInativo(((MensagemDO)novas.elementAt(i)).getUsuario_receptor());
                                cod_link = ((MensagemDO)novas.elementAt(i)).getUsuario_receptor();
                            }
                        %>
                            <tr>
                                <td>
                                    <a href="/PDS/Geral/visualiza_mensagem.jsp?cod_emi=<%= cod_link %>">
                                        <%= u.getUsu_nome()%>
                                    </a>
                                </td>
                                <td>
                                    <a href="/PDS/Geral/visualiza_mensagem.jsp?cod_emi=<%= cod_link %>">
                                      <% if(((MensagemDO)novas.elementAt(i)).getMsg_msg().length() < 50) {%>
                                          <%= ((MensagemDO)novas.elementAt(i)).getMsg_msg() %>
                                      <% } else { %>
                                          <%= ((MensagemDO)novas.elementAt(i)).getMsg_msg().substring(0, ((MensagemDO)novas.elementAt(i)).getMsg_msg().length()) %>...
                                      <% } %>
                                    </a>
                                </td>
                            </tr>
                    <%
                        }
                    %>
                        </table>
                    <%
                    }
                    %>
                    </br></br></br>    
                    <%
                    if(velhas.size() == 0)
                    {
                    %>
                      <h3>Não há conversas antigas</h3>
                    <%
                    }
                    else
                    {
                    %>
                        <h3>Conversas antigas</h3>
                        <table>
                            <tr>
                                <th>Nome</th>
                                <th>Última mensagem</th>
                            </tr>
                        <%
                        for(int i = 0; i < velhas.size(); i++)
                        {
                            UsuarioDO u = null;
                            int cod_link;
                            if(((MensagemDO)velhas.elementAt(i)).getUsuario_emissor() != codRec)
                            {
                                u = (new Usuario()).pesquisarPorIdComInativo(((MensagemDO)velhas.elementAt(i)).getUsuario_emissor());
                                cod_link = ((MensagemDO)velhas.elementAt(i)).getUsuario_emissor();
                            }
                            else
                            {
                                u = (new Usuario()).pesquisarPorIdComInativo(((MensagemDO)velhas.elementAt(i)).getUsuario_receptor());
                                cod_link = ((MensagemDO)velhas.elementAt(i)).getUsuario_receptor();
                            }
                        %>
                            <tr>
                                <td>
                                    <a href="/PDS/Geral/visualiza_mensagem.jsp?cod_emi=<%= cod_link %>">
                                        <%= u.getUsu_nome()%>
                                    </a>
                                </td>
                                <td>
                                    <a href="/PDS/Geral/visualiza_mensagem.jsp?cod_emi=<%= cod_link %>">
                                      <% if(((MensagemDO)velhas.elementAt(i)).getMsg_msg().length() < 50) {%>
                                          <%= ((MensagemDO)velhas.elementAt(i)).getMsg_msg() %>
                                      <% } else { %>
                                          <%= ((MensagemDO)velhas.elementAt(i)).getMsg_msg().substring(0, ((MensagemDO)velhas.elementAt(i)).getMsg_msg().length()) %>...
                                      <% } %>
                                    </a>
                                </td>
                            </tr>
                    <%
                        }
                    %>
                        </table>
                    <%
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
