<%-- 
    PDST012 - Acesso ao cadastro de paciente ou médico ou técnico pelo técnico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="transacoes.*"%>
        <%@ page import="data.*"%>
        <%@page import="java.util.*"%>
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
                    int cod = -1;
                    boolean valido = true;
                    
                    try
                    {
                      cod = Integer.parseInt(request.getParameter("cod"));
                    }
                    catch(NumberFormatException e)
                    {
                      valido = false;
                    }
                    MedicoDO m = null;
                    PacienteDO p = null;
                    TecnicoDO t = null;
                    if (valido)
                    {
                      p = (new Paciente()).buscar(cod);
                      m = (new Medico()).buscar(cod);
                      t = (new Tecnico()).buscar(cod);
                      
                      if(p == null && m == null && t == null)
                        valido = false;
                    }
                    
                    if(valido)
                    {
                      Vector tel = (new Telefone()).pesquisar(cod);
                      Vector end = (new Endereco()).pesquisarPorCodDaPessoa(cod);
                      if(p != null) {
                    %>
                        <h1>Busca - <%= p.getUsu_nome() %></h1>
                        <br>
                        Nome completo do paciente: <%= p.getUsu_nome() %>
                        <br>
                        E-mail: <%= p.getUsu_login()%> 
                        <br>
                        <%
                        for(int i = 0; i < tel.size(); i++) {
                        %>
                        Telefone <%= i+1%>: <%= ((TelefoneDO)(tel.elementAt(i))).getTel_numero() %> </br>
                        <%
                        }
                        %>
                        <br>
                        <form action='VisualizaListaExamesPaciente.jsp' method="post">
                            <input type='hidden' name='Usu_buscado' value='<%=p.getUsu_nome()%>'>
                            <input type='hidden' name='Paciente_Usuario_Usu_cod' value='<%=p.getUsu_cod()%>'>
                            <input type="submit" name="exame" value="Visualizar Exames">
                        </form>
                        <%
                        }else if(m != null){
                        %>
                        <h1>Busca - <%= m.getUsu_nome() %></h1>
                        <br>
                        Nome completo do médico: <%= m.getUsu_nome() %>
                        <br>
                        <%
                        for(int i = 0; i < end.size(); i++) {
                          Tipo_EnderecoDO tipo_end = (new Tipo_Endereco()).buscar(((EnderecoDO)(end.elementAt(i))).getTipo_Endereco_TipEnd_cod());
                          MunicipioDO mun = (new Municipio()).buscar(((EnderecoDO)(end.elementAt(i))).getMunicipio_Mun_cod());
                          EstadoDO est = (new Estado()).buscar(mun.getEstado_Est_cod());
                        %>
                          Endereço <%= i+1%>: <%= ((EnderecoDO)(end.elementAt(i))).getEnd_rua()%>, <%= ((EnderecoDO)(end.elementAt(i))).getEnd_num()%> - <%= mun.getMun_nome()%>, <%= est.getEst_nome()%>  - Tipo: <%=tipo_end.getTipEnd_tipo()%> </br>
                        <%
                        }
                        for(int i = 0; i < tel.size(); i++) {
                        %>
                          Telefone <%= i+1%>: <%= ((TelefoneDO)(tel.elementAt(i))).getTel_numero() %> </br>
                        <%
                        }
                          ConselhosDO con = (new Conselhos()).buscar(m.getConselhos_Con_cod());
                        %>
                          <%= con.getCon_sigla()%>: <%= m.getMed_NumRegistro()%> </br>
                        <%    
                        }else if(t != null){
                        %>
                    
                        <h1>Busca - <%= t.getUsu_nome() %></h1>
                        <br>
                        Nome completo do técnico: <%= t.getUsu_nome() %>
                        <br>
                        <%
                        for(int i = 0; i < end.size(); i++) {
                          Tipo_EnderecoDO tipo_end = (new Tipo_Endereco()).buscar(((EnderecoDO)(end.elementAt(i))).getTipo_Endereco_TipEnd_cod());
                          MunicipioDO mun = (new Municipio()).buscar(((EnderecoDO)(end.elementAt(i))).getMunicipio_Mun_cod());
                          EstadoDO est = (new Estado()).buscar(mun.getEstado_Est_cod());
                        %>
                          Endereço <%= i+1%>: <%= ((EnderecoDO)(end.elementAt(i))).getEnd_rua()%>, <%= ((EnderecoDO)(end.elementAt(i))).getEnd_num()%> - <%= mun.getMun_nome()%>, <%= est.getEst_nome()%>  - Tipo: <%=tipo_end.getTipEnd_tipo()%> </br>
                        <%
                        }
                        %>
                        <%
                        for(int i = 0; i < tel.size(); i++) {
                        %>
                        Telefone: <%= ((TelefoneDO)(tel.elementAt(i))).getTel_numero() %> </br>
                        <%
                        }
                        ConselhosDO con = (new Conselhos()).buscar(t.getConselhos_Con_cod());
                        %>
                        Conselho: <%= con.getCon_sigla()%>
                    <% 
                        }
                    }else{
                    %>
                    <h2>Usuário invalido</h2>
                    <%
                    }
                    %>
                    <form action="/PDS/Tecnico/Busca.jsp">
                      <input type="submit" name="Voltar" value="Voltar">  
                    </form>
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
