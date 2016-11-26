<%
    
    char type = session.getAttribute("tipo").toString().charAt(0);
    if (type=='m') {
        %>
                <a href="/PDS/Medico/Home.jsp">Home</a><br>
                <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                <a href="/PDS/Geral/temppage.jsp">Busca</a><br>
        <%
    }else if (type=='t') {
        %>
                <a href="/PDS/Tecnico/Home.jsp">Home</a><br>
                <a href="/PDS/Geral/temppage.jsp">Dados pessoais</a><br>
                <a href="/PDS/Tecnico/Busca.jsp">Busca</a><br>
        <%
    }
else if (type=='p'){
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
<a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br>
<br><a href="/PDS/Geral/Logout.jsp">Logout</a><br>

<%
//<a href="/PDS/Geral/temppage.jsp">Link 1</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 2</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 3</a><br>
//<a href="/PDS/Geral/temppage.jsp">Link 4</a><br>
%>
