<%
    String type = request.getParameter("tipo");
    type="medico";
    if (type.equals("medico")) {
        %>
                <a href="/PDS/Medico/Home.jsp">Home</a><br>
                <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                <a href="/PDS/Geral/temppage.jsp">Busca</a><br>
        <%
    }else if (type.equals("tecnico")) {
        %>
                <a href="/PDS/Home/Tecnico.jsp">Home</a><br>
                <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                <a href="/PDS/Geral/temppage.jsp">Busca</a><br>
        <%
    }
    else{
        %>
                <a href="/PDS/Paciente/Home.jsp">Home</a><br>
                <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                <a href="/PDS/Geral/temppage.jsp">Ficha médica</a><br>
                <a href="/PDS/Geral/temppage.jsp">Consulta</a><br>
                <a href="/PDS/Geral/temppage.jsp">Exame</a><br>
                <a href="/PDS/Geral/temppage.jsp">Receitas</a><br>
                <a href="/PDS/Paciente/busca.jsp">Busca</a><br>
        <%
    }
%>

<%
    //<a href="/PDS/Geral/temppage.jsp">Link 1</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 2</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 3</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 4</a><br>
//<a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br>
%>
