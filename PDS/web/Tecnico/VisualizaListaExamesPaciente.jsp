
<%-- 
    *******Visualiza Lista de Exames Paciente*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ page import="java.util.Vector" %>
        <%@ page import="java.util.Date"%>
        <%@ page import="java.sql.*"%>
        <%@ page import="transacoes.Exame" %>
        <%@ page import="transacoes.Usuario"%>
        <%@ page import="data.ExameDO" %>
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
                    <br>
                    <br>
                    <br>

                    <%                        //passar o nome do paciente como Usu_buscado ao clicar no nome do paciente na tela anterior
                        String nome_paciente = request.getParameter("Usu_buscado");
                    %>

                    Exames - <%= nome_paciente%> 

                    <br />
                    <br />
                    <br />
                    <table>
                        <tr>
                            <th>|--C�digo do Exame--|</th>                           
                            <th>|----Data----|</th>
                            <th>|Respons�vel por Adicionar Documento |</th>
                        </tr>

                        <tr>
                            <%
                                //passar para c� o Paciente_Usuario_Usu_cod
                                int cod = Integer.parseInt(request.getParameter("Paciente_Usuario_Usu_cod"));

                                transacoes.Exame tn = new transacoes.Exame();

                                Vector exames = tn.pesquisarPorCod(cod);

                                if ((exames.size() == 0)) {
                            %>

                            Lista de Exames n�o encontrada!
                        <form action="/Tecnico/Busca.jsp" method="post">
                            <input type="submit" name="voltar" value="Voltar" />

                        </form>
                        <%     } else {
                        %>
                        <table>
                            <%
                                for (int i = 0; i < exames.size(); i++) {

                                    ExameDO exame = (ExameDO) exames.elementAt(i);
                                    int exa_cod = exame.getExa_cod();//pega o codigo do exame
                                    Date data = exame.getExa_data_upload();//pega a data do upload                                
                                    int uper_cod = exame.getTecnico_Usuario_Usu_cod_uploader();//pega o id de quem deu upload

                                    //para ver se quem deu upload foi tecnico
                                    //if (uper_cod == 0) //se nao for tecnico, pegar o id o medico que deu upload
                                    //{
                                    //  uper_cod = Integer.parseInt(request.getParameter("Medico_Usuario_Usu_cod_uploader"));
                                    //}
                                    //pesquisando nome do usuario pelo id
                                    UsuarioDO usuario = new UsuarioDO();
                                    transacoes.Usuario tr = new transacoes.Usuario();
                                    usuario = tr.pesquisarPorId(uper_cod);
                                    String nome_uper = usuario.getUsu_nome();
                            %>
                            <tr>
                                <td>............</td>
                                <td>
                                    <a href="/PDS/Geral/VisualizaExames.jsp?exame_cod=<%=exa_cod%>">
                                        <%=exa_cod%></a>
                                </td>
                                <td>.......................</td>
                                <td><%=data%></td>
                                <td>........................</td>
                                <td><%=nome_uper%></td>      
                            </tr>     
                        </table>
                        <%}
                            }%>  
                        <br />
                        <br />
                        <br />
                        <form action="/Geral/upload_exame_receita.jsp" method="post">
                            <input type="submit" name="Adicionar" value="Adicionar Exame" />
                        </form>
            </tr>        
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>

