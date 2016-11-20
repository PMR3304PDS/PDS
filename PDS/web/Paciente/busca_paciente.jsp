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
        <%@ page import="transacoes.Usuario" %>
        <%@ page import="data.UsuarioDO" %>
        <%@ page import="transacoes.Medico" %>
        <%@ page import="data.MedicoDO" %>
        
        <%@ include file="../Geral/verifylogin.jsp" %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <%@ include file="../Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <%@ include file="../Geral/menu.jsp" %>
                </td>
                <td>
                    <b>BUSCAR</b>
                    <br>
                    Encontre médicos ou técnicos
                    <br>
                    <br>

                    Selecione a informação que deseja buscar:
                    <form>
                    <select name = "modo">
                      <option value="nome">Nome</option>
                      <option value="rg">RG</option>
                      <option value="cpf">CPF</option>
                      <option value="crm">CRM (apenas médico)</option>
                    </select>
                    </form>
                    <br>
                    <br>

                    <input type="text" name="input"  placeholder="Buscar...">
                    <input type="submit" name="pesquisar" value="pesquisar" />
                    <input type="submit" name="voltar" value="voltar" />
                    
                    <%
                    if (request.getParameter("pesquisar") != null) {
                        String modo = request.getParameter("modo");
                        if (modo == "nome") {
                            transacoes.Usuario tn = new transacoes.Usuario();
                            String nome = request.getParameter("input");
                            Vector usuarios = tn.pesquisarPorNome(nome);
                        }
                        
                        if (modo == "rg") {
                            transacoes.Usuario tn = new transacoes.Usuario();
                            String rg = request.getParameter("input");
                            Vector usuarios = tn.pesquisarPorRg(rg);
                        }
                        
                        if (modo == "cpf") {
                            transacoes.Usuario tn = new transacoes.Usuario();
                            String cpf = request.getParameter("input");
                            Vector usuarios = tn.pesquisarPorCpf(cpf);
                        }
                        
                        if (modo == "crm") {
                            transacoes.Medico tn = new transacoes.Medico();
                            String crm = request.getParameter("input");
                            Vector usuarios = tn.pesquisarPorCrm(crm);
                        }
                        
                    }
                    %>
                    
                    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%@ include file="../Geral/footer.jsp" %>
                </td>
            </tr>
        </table>
    </body>
</html>
