<%-- 
    PDSM013 - Acesso do cadastro de paciente ou médico ou técnico pelo médico
--%>


<%@page import="java.time.LocalDate"%>
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
                    int cod = -1;
                    boolean valido = true;
                    String tipo = request.getParameter("tipo");
                    
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
                    FarmaceuticoDO f = null;
                    UsuarioDO u = new UsuarioDO();
                    if (valido)
                    {
                      if(tipo.equalsIgnoreCase("p")){
                        p = (new Paciente()).buscar(cod);}
                      else if(tipo.equalsIgnoreCase("m"))
                        m = (new Medico()).buscar(cod);
                      else if(tipo.equalsIgnoreCase("f"))
                        f = (new Farmaceutico()).buscar(cod);
                      else if(tipo.equalsIgnoreCase("t"))
                        t = (new Tecnico()).buscar(cod);
                      else
                        valido = false;
                      
                      if(p == null && m == null && f == null && t == null)
                        valido = false;
                    }
                    
                    if(valido)
                    {
                      Vector tel = (new Telefone()).pesquisar(cod);
                      Vector end = (new Endereco()).pesquisarPorCodDaPessoa(cod);
                      if(p != null) {
                      %>
                        <h1>Busca - <%= p.getUsu_nome() %></h1> </br>
                        Nome completo do paciente: <%= p.getUsu_nome() %> </br>
                        <%
                        for(int i = 0; i < tel.size(); i++) {
                        %>
                        Telefone: <%= ((TelefoneDO)(tel.elementAt(i))).getTel_numero() %> </br>
                        <%
                        }
                        %>
                        Email: <%= p.getUsu_login()%> </br>
                        </br>
                        <h3>Ficha médica</h3> </br>
                        Idade: <%=Period.between(p.getPac_nascimento().toLocalDate(), LocalDate.now()).getYears()%> anos </br>
                        Peso: <%= p.getFormattedPac_peso() %> kg </br>
                        Altura: <%= p.getFormattedPac_altura() %> m </br>
                        Alergias: <%= p.getFormattedPac_alergias() %> </br>
                        Doenças em tratamento: <%= p.getFormattedPac_doencas_tratamento() %> </br>
                        Histórico de doenças: <%= p.getFormattedPac_historico_doencas() %> </br>
                        Medicamentos: <%= p.getFormattedPac_medicamentos() %> </br>
                        <%//TODO: Botao%>
                      <%
                      }
                      else if(m != null) {
                      %>
                        <h1>Busca - <%= m.getUsu_nome() %></h1> </br>
                        Nome completo do médico: <%= m.getUsu_nome() %> </br>
                        <%
                        for(int i = 0; i < end.size(); i++) {
                          Tipo_EnderecoDO tipo_end = (new Tipo_Endereco()).buscar(((EnderecoDO)(end.elementAt(i))).getTipo_Endereco_TipEnd_cod());
                          MunicipioDO mun = (new Municipio()).buscar(((EnderecoDO)(end.elementAt(i))).getMunicipio_Mun_cod());
                          EstadoDO est = (new Estado()).buscar(mun.getEstado_Est_cod());
                        %>
                        Endereço: <%//tipo_end.getTipEnd_tipo()%> <%= ((EnderecoDO)(end.elementAt(i))).getEnd_rua()%>, <%= ((EnderecoDO)(end.elementAt(i))).getEnd_num()%> - <%= mun.getMun_nome()%>, <%= est.getEst_nome()%> </br>
                        <%
                        }
                        %>
                        <%
                        for(int i = 0; i < tel.size(); i++) {
                        %>
                        Telefone: <%= ((TelefoneDO)(tel.elementAt(i))).getTel_numero() %> </br>
                        <%
                        }
                        %>
                        CRM: <%= m.getMed_NumRegistro()%> </br>
                        <%//TODO: Botao%>
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
