<%-- 
    Document   : ListaReceitas.jsp
    Created on : 24/11/2016, 08:50:58
    Author     : Bronneberg
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <style>
        h2{font-size:200%;}
    </style>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="transacoes.Receita" %>
        <%@ page import="transacoes.Usuario"%>
        <%@ page import="data.ReceitaDO" %>
        <%@ page import="data.PacienteDO" %>
        <%@ page import="data.UsuarioDO" %>
        <%@ page import="data.UsuarioData" %>
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
                    <% String NomeDoPacienteBuscado = "Gabriel Xavier";
                    //trocar depois para pegar o cod do paciente feito na busca e ver o nome
                    if(null != request.getParameter("cancelar")){
                        pageContext.forward("./temppage.jsp");
                    }
                    %>
                    <br>
                    </br>
                    <table align="left">
                        <tr>
                            <td>
                                <h2>Receita - <%= NomeDoPacienteBuscado%></h2>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:center">Cód. Receita</th>                           
                            <th style="text-align:left">Data e responsável pelo upload</th>
                        </tr>

                        <tr>
                            <%
                                //trocar depois para pegar o cod do paciente feito na busca
                                int cod_paciente = 1;
                                transacoes.Receita lista = new transacoes.Receita();
                                Vector receitas = lista.getListaReceitas(cod_paciente);
                                if ((receitas.size() == 0)) {
                            %>

                            Lista de Receitas não encontrada!
                        <form action="/Tecnico/Busca.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />

                        </form>
                        <%     }//fecha if
                            else {
                        %>
                        
                            <%
                                //Aqui ele pega os códigos necessarios para a lista: cod, data e responsavel pelo upload
                                for (int i = 0; i < receitas.size(); i++) {
                                    ReceitaDO receita = (ReceitaDO) receitas.elementAt(i);
                                    int rec_cod = receita.getRec_cod();
                                    Date data = receita.getRec_data_upload();
                                    int resp_cod = receita.getMedico_Usuario_Usu_cod();
                                    UsuarioDO resp = new UsuarioDO();
                                    transacoes.Usuario tr = new transacoes.Usuario();
                                    resp = tr.pesquisarPorId(resp_cod);
                                    String nome_resp = resp.getUsu_nome();
                            %>
                            <tr>
                                <td style="text-align:center"><form action="VisualizaReceita.jsp"><input type="submit" value="<%=rec_cod%>" id="RecSelecionada"></form></td>
                                <td style="text-align:left"><%=data%> : <%=nome_resp%></td>   
                            </tr>     
                        </table>
                        <%}//fecha for
                            }//fecha else%>  
                        <br />
                        <br />
                        <br />
            </tr>        
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
    <script>
        function EntraReceita(rec_cod){
            document.getElementById("RecSelecionada").style.color="red";
            pageContext.forward("/PDS/Geral/temppage.jsp");
        }
    </script>
        
</html>

