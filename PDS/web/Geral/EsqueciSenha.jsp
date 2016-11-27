<%--  
    Esqueci Senha
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@ include file="verifylogin.jsp" %>
        
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
                    <%-- Começo JSP --%>
                    <%
                        if(null==request.getParameterValues("enviar"))
                        {
                    %>
                            Esqueci a senha <br>
                            Por favor, digite as informacoes abaixo para verificarmos sua autenticidade!
                            <form method="post" action=EsqueciSenha.jsp>
                                Nome : <input type="text" name="nome" />
                                <br>
                                RG : <input type="text" name="RG" />
                                <br>
                                CPF : <input type="text" name="CPF" />
                                <br>
                                Login : <input type="text" name="login" />
                                <br>
                                <br>
                                Senha nova : <input type="password" name="senha_nova" />
                                <br>
                                <input type="submit" name="enviar" value="Enviar" />
                            </form>
                    <%
                        }
                        else
                        {
                            String nome = request.getParameter("nome");
                            String RG = request.getParameter("RG");
                            String CPF = request.getParameter("CPF");
                            String login = request.getParameter("login");
                            String senha_nova = request.getParameter("senha_nova");

                            boolean tem_espaco = false;
                            for (char c : senha_nova.toCharArray()) 
                            {
                                if ((c==' ')||(c=='\t')||(c=='\n'))
                                {
                                   tem_espaco=true;
                                }
                            }

                            transacoes.Usuario tn = new transacoes.Usuario();
                            data.UsuarioDO usuario = tn.buscar(login);
                            if(usuario==null)
                            {
                    %>
                                Usuario não existe ou foi deletado!
                                <form action="EsqueciSenha.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else if(!((nome.equals(usuario.getUsu_nome()))&&(RG.equals(usuario.getUsu_rg()))&&(CPF.equals(usuario.getUsu_cpf()))&&(login.equals(usuario.getUsu_login()))))
                            {
                    %>
                                Informações não estão coerentes!
                                <form action="EsqueciSenha.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else if ((senha_nova==null)||(senha_nova.equals(""))||tem_espaco||(senha_nova.length()>20))
                            {
                    %>
                                Senha nova não é válida!<br>
                                Por favor use ao menos um caracter, não use espaços e use menos de 20 caracteres!
                                <form action="EsqueciSenha.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else if(tn.mudar_senha(usuario,usuario.getUsu_senha(),senha_nova))
                            {
                    %>
                                Senha alterada com sucesso!
                                <form action="login.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                            else
                            {
                    %>
                                Erro ao alterar senha!
                                <form action="EsqueciSenha.jsp" method="post">
                                    <input type="submit" name="voltar" value="Voltar" />
                                </form>
                    <%
                            }
                        }
                    %>
                     <%-- Fim JSP --%>
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