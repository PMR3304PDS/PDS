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
                    <%
                    int cod_rec = ((Integer)session.getAttribute("cod")).intValue();
                    int cod_emi = -1;
                    boolean valido = true;
                    try
                    {
                        cod_emi = Integer.parseInt(request.getParameter("cod_emi"));
                    }
                    catch(NumberFormatException e)
                    {
                        valido = false;
                    }
                    
                    if(valido)
                    {
                        if(request.getParameter("mensagem") != null)
                        {
                            MensagemDO m = new MensagemDO();
                            m.setMsg_data(java.sql.Date.valueOf(LocalDate.now()));
                            m.setMsg_msg(request.getParameter("mensagem"));
                            m.setMsg_visualizado(false);
                            m.setUsuario_emissor(cod_rec);
                            m.setUsuario_receptor(cod_emi);
                            if(!(new Mensagem()).incluir(m))
                            {
                            %>
                            <font color="red">Falha ao enviar mensagem</font>
                            <%
                            }
                        }
                        Vector v = (new Mensagem()).pesquisarPorCodDoEmissor(cod_emi, cod_rec);
                        UsuarioDO emi = (new Usuario()).pesquisarPorIdComInativo(cod_emi);
                    %> 
                        <h1>Conversa com <%=emi.getUsu_nome()%></h1>
                        <%
                        if(v == null || v.size() == 0)
                        {
                        %>
                            <h3>Não há conversas</h3>
                        <%
                        }
                        else
                        {
                        %>
                            <div style="overflow:scroll; width:600px; height: 400px; border-style: solid;" >
                                <%
                                for(int i = 0; i < v.size(); i++)
                                {
                                    if(!((MensagemDO)v.elementAt(i)).isMsg_visualizado() && ((MensagemDO)v.elementAt(i)).getUsuario_receptor() == cod_rec)
                                    {
                                        (new Mensagem()).marcarLido(((MensagemDO)v.elementAt(i)).getMsg_cod());
                                        ((MensagemDO)v.elementAt(i)).setMsg_visualizado(true);
                                    }
                                %>
                                    <div align='right' style="width: 100%; padding-top:20px; float:right">
                                <%
                                    if(((MensagemDO)v.elementAt(i)).getUsuario_emissor() == cod_rec)
                                    {
                                %>
                                    
                                      <div align='right' style="width: 400px; padding-top:20px; float:right">
                                      <%
                                      }
                                      else
                                      {
                                      %>
                                      <div align='left' style="width: 100%; padding-top:20px; float:left">
                                      <%
                                      }
                                      %>
                                          <%= ((MensagemDO)v.elementAt(i)).getMsg_msg() %>
                                      </div>
                                    </div>
                                <%
                                }
                                %>
                            </div>
                        <%
                        }
                        %>
                        <form action="visualiza_mensagem.jsp" method="post">
                            <input type='hidden' name='cod_emi' value='<%=cod_emi%>'>
                            <textarea cols="10" style="width:600px; height:50px;"  name="mensagem"></textarea>
                            <input type='submit'>
                        </form>
                    <%
                    }
                    else
                    {
                    %>
                        <h3>Usuário inválido</h3>
                    <%
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
