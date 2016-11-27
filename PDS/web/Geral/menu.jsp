<%
    if (session.getAttributeNames().hasMoreElements())
    {
        String type = (String) session.getAttribute("tipo");
        if (type.equals("m")) {
            %>
                    <a href="/PDS/Medico/Home.jsp">Home</a><br>
                    <div align="right">
                        <a href="/PDS/Geral/Logout.jsp">Logout</a>
                    </div><br>
                    <a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br>
                    <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                    <a href="/PDS/Geral/temppage.jsp">Busca</a><br>
            <%
        } else if (type.equals("t")) {
            %>
                    <a href="/PDS/Tecnico/Home.jsp">Home</a><br>
                    <div align="right">
                        <a href="/PDS/Geral/Logout.jsp">Logout</a>
                    </div><br>
                    <a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br>
                    <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                    <a href="/PDS/Tecnico/Busca.jsp">Busca</a><br>
            <%
        } else if (type.equals("p")){
            %>
                    <a href="/PDS/Paciente/Home.jsp">Home</a><br>
                    <div align="right">
                        <a href="/PDS/Geral/Logout.jsp">Logout</a>
                    </div><br>
                    <a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br>
                    <a href="/PDS/Paciente/DadosPessoais.jsp">Dados pessoais</a><br>
                    <a href="/PDS/Paciente/EditaFichaMedica.jsp">Ficha médica</a><br>
                    <a href="/PDS/Geral/temppage.jsp">Consulta</a><br>
                    <a href="/PDS/Geral/temppage.jsp">Exame</a><br>
                    <a href="/PDS/Geral/temppage.jsp">Receitas</a><br>
                    <a href="/PDS/Paciente/Busca.jsp">Busca</a><br>
            <%
        }
        else {
            %>
                    <a href="/PDS/Geral/temppage.jsp">Erro</a><br>
            <%
        }
            %>
<%
    }
//<a href="/PDS/Geral/temppage.jsp">Link 1</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 2</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 3</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 4</a><br>
%>
