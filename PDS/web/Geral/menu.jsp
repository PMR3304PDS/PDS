<%
    if (session.getAttributeNames().hasMoreElements())
    {
        String type = (String) session.getAttribute("tipo");
        if (type.equals("m")) {
            %>
                    <a href="/PDS/Medico/Home.jsp">Home</a><br>
                    <a href="/PDS/Medico/DadosPessoais.jsp">Dados pessoais</a><br>
                    <a href="/PDS/Geral/EditarDadosMedico.jsp">Edita dados pessoais</a><br>
                    <a href="/PDS/Medico/Busca.jsp">Busca</a><br>
                    <a href="/PDS/Medico/VisualizarIndicacaoMedico.jsp">Visualiza Indica��o</a><br>
                    <a href="/PDS/Geral/visualiza_lista_mensagens.jsp">Mensagens</a><br>
                    <a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br><br><br>
                    <a href="/PDS/Geral/Logout.jsp">Logout</a><br>
            <%
        } else if (type.equals("t")) {
            %>
                    <a href="/PDS/Tecnico/Home.jsp">Home</a><br>
                    <a href="/PDS/Tecnico/DadosPessoais.jsp">Dados pessoais</a><br>
                    <a href="/PDS/Geral/EditarDadosTecnico.jsp">Edita dados pessoais</a><br>
                    <a href="/PDS/Tecnico/Busca.jsp">Busca</a><br>
                    <a href="/PDS/Geral/visualiza_lista_mensagens.jsp">Mensagens</a><br>
                    <a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br><br><br>
                    <a href="/PDS/Geral/Logout.jsp">Logout</a><br>
            <%
        } else if (type.equals("p")){
            %>
                    <a href="/PDS/Paciente/Home.jsp">Home</a><br>
                    <a href="/PDS/Paciente/DadosPessoais.jsp">Dados pessoais</a><br>
                    <a href="/PDS/Paciente/FichaMedica.jsp">Ficha m�dica</a><br>
                    <a href="/PDS/Paciente/Consulta.jsp">Consulta</a><br>
                    <a href="/PDS/Paciente/VisualizaPropriaListaExames.jsp">Exame</a><br>
                    <a href="/PDS/Paciente/VisualizaPropriaListaReceitas.jsp">Receitas</a><br>
                    <a href="/PDS/Paciente/Busca.jsp">Busca</a><br>                    
                    <a href="/PDS/Paciente/Atualizar_Cadastro.jsp">Editar dados de cadastro</a><br>
                    <a href="/PDS/Paciente/EditarFichaMedica.jsp">Editar ficha m�dica</a><br>
                    <a href="/PDS/Geral/visualiza_lista_mensagens.jsp">Mensagens</a><br>
                    <a href="/PDS/Geral/mudar_senha.jsp">Mudar Senha</a><br><br><br>
                    <a href="/PDS/Geral/Logout.jsp">Logout</a><br>
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
