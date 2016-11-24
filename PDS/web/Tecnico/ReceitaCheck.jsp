<%-- 
    Document   : ReceitaCheck
    Created on : 24/11/2016, 08:51:13
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
                        <h2>Receita - <%= NomeDoPacienteBuscado%></h2>
                        </tr>
                        <tr>
                            <%
                                ////trocar depois para pegar o cod do paciente feito na busca
                                int cod = 1;
                                transacoes.Receita lista = new transacoes.Receita();
                                Vector receitas = lista.getListaReceitas(cod);
                                if ((receitas.size() == 0)) {
                            %>

                            Lista de Receitas não encontrada!
                        <form action="/Tecnico/Busca.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />

                        </form>
                        <%     } else {
                                for (int i = 0; i < receitas.size(); i++) {
                                    ReceitaDO receita = (ReceitaDO) receitas.elementAt(i);
                                    int rec_cod = receita.getRec_cod();
                                    Date data = receita.getRec_data_upload();
                                    int resp_cod = receita.getMedico_Usuario_Usu_cod();
                                    String resumo = receita.getRec_resumo();
                                    boolean check = receita.isRec_check();
                                    UsuarioDO resp = new UsuarioDO();
                                    transacoes.Usuario tr = new transacoes.Usuario();
                                    resp = tr.pesquisarPorId(resp_cod);
                                    String nome_resp = resp.getUsu_nome();
                            %>
                            <tr>
                                <tr style="text-align:center">Cód. Receita: <%=rec_cod%></tr> 
                                <br>
                                <tr style="text-align:center">Data do upload: <%=data%></tr>
                                <br>
                                <tr style="text-align:center">Responsável pelo upload: <%=nome_resp%></tr>                           
                                <br>
                                <tr style="text-align:center">
                                    <tr>Receita:  
                                <% 
                                    if(check==true){
                                    %>
                                        (Receita entregue ao Paciente)
                                        <br>
                                        <tr><%=resumo%></tr>
                                    <%
                                    }
                                    else{
                                    %>
                                    <form method="get" onsubmit="return CheckReceita(check)">
                                        <input type="checkbox" id="check">Receita entregue
                                    </form>
                                    <br>
                                    <tr><%=resumo%></tr>
                                    <%
                                    }
                                %>
                                </tr>
                                </tr>
                            </tr> 
                            <br>
                            <tr>
                            <form action="ListaReceitas.jsp">
                                <input type="submit" value="Voltar para a Lista de Receitas">
                            </form>
                            </tr>
                        </table>
                        <%}
                            }%>  
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
        function CheckReceita(check){
            receita.setRec_check(check);
        }
    </script>
        
</html>
