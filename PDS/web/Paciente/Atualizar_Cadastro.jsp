<%-- 
    *******Atualizar Cadastro de Paciente*********
--%>

<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@page import="java.text.SimpleDateFormat"%>
        <%@page import="java.sql.Date"%>
        <%@page import="java.text.DateFormat"%>
        <%@page import="java.text.ParseException"%>
        <%@page import="java.util.Vector"%>
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
                    <h1>Atualizar Cadastro</h1>
                    <br>
                    
                    <script>
                        function isNumberKey(evt){
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode !== 46 &&(charCode < 48 || charCode > 57)))
                                return false;
                            return true;
                        }
                        
                        function isDate(evt){
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode !== 47 &&(charCode < 48 || charCode > 57)))
                                return false;
                            return true;
                        }
                        
                    </script>
                    
<%
                    String action = request.getParameter("atualizar");
                    if (null == action){
                        action = "showEditForm";
                        int codi = Integer.parseInt(String.valueOf(session.getAttribute("cod")));
                        transacoes.Paciente tn = new transacoes.Paciente();
                        data.PacienteDO paci = tn.buscar(codi);
                        int Usu_cod = paci.getUsu_cod();
                        transacoes.Usuario tu = new transacoes.Usuario();
                        data.UsuarioDO usuario = tu.pesquisarPorId(Usu_cod);
                        
                        String nome = usuario.getUsu_nome();
                        String cpf = usuario.getUsu_cpf();
                        String rg = usuario.getUsu_rg();
                        String login = usuario.getUsu_login();
                        String senha = usuario.getUsu_senha();
                        
                        transacoes.Endereco te = new transacoes.Endereco();
                        Vector end = te.pesquisarPorCodDaPessoa(Usu_cod);
                        data.EnderecoDO e = new data.EnderecoDO();
                        e = (data.EnderecoDO)end.elementAt(0);
                        
                        String rua = e.getEnd_rua();
                        String bairro = e.getEnd_bairro();
                        int num = e.getEnd_num();
                        int mun = e.getMunicipio_Mun_cod();
                        int endcod = e.getEnd_cod();
                        
                        transacoes.Municipio tm1 = new transacoes.Municipio();
                        data.MunicipioDO mu = tm1.buscar(mun);
                        int estcod = mu.getEstado_Est_cod();
                        
                        transacoes.Telefone tt = new transacoes.Telefone();
                        Vector telefones = tt.pesquisar(Usu_cod);
                        data.TelefoneDO t1 = (data.TelefoneDO)telefones.elementAt(0);
                        int tel1 = t1.getTel_numero();
                        String tel1s = Integer.toString(tel1);
                        int tel1cod = t1.getTel_cod();
                        String tel2s = "";
                        String tel2cods = "";
                        if (telefones.size() > 1){
                            data.TelefoneDO t2 = (data.TelefoneDO)telefones.elementAt(1);
                            int tel2 = t2.getTel_numero();
                            tel2s = Integer.toString(tel2);
                            int tel2cod = t2.getTel_cod();
                            tel2cods = Integer.toString(tel2cod);
                        }
                        
                        
%>
                    <form action="/PDS/Paciente/Atualizar_Cadastro.jsp?cod=<%=Usu_cod%>" method="post">
                        <table>
                            <td>Estado</td>
                            <td>
                        <%
                        int cod1;
                        if(request.getParameter("estado_id") != null){
                            cod1 = estcod;
                        %>
                            <select name="estado_id" id="estado_id" value = cod1 onchange="this.form.submit()" required>
                        <%
                        }
                        else {
                            cod1 = 0;
                        %>
                             <select name="estado_id" id="estado_id" onchange="this.form.submit()" required>
                        <%
                        }
                        %>            
                                    <option value="0" <% if (cod1 == 0) { %> selected <% } %> > Selecione o estado</option>
                                    <option value="1" <% if (cod1 == 1) { %> selected <% } %> > Acre</option>
                                    <option value="2" <% if (cod1 == 2) { %> selected <% } %> > Alagoas</option>
                                    <option value="3" <% if (cod1 == 3) { %> selected <% } %> > Amapá</option>
                                    <option value="4" <% if (cod1 == 4) { %> selected <% } %> > Amazonas</option>
                                    <option value="5" <% if (cod1 == 5) { %> selected <% } %> > Bahia</option>
                                    <option value="6" <% if (cod1 == 6) { %> selected <% } %> > Ceará</option>
                                    <option value="7" <% if (cod1 == 7) { %> selected <% } %> > Distrito Federal</option>
                                    <option value="8" <% if (cod1 == 8) { %> selected <% } %> > Espirito Santo</option>
                                    <option value="9" <% if (cod1 == 9) { %> selected <% } %> > Goiás</option>
                                    <option value="10" <% if (cod1 == 10) { %> selected <% } %> > Maranhão</option>
                                    <option value="11" <% if (cod1 == 11) { %> selected <% } %> > Mato Grosso</option>
                                    <option value="12" <% if (cod1 == 12) { %> selected <% } %> > Mato Grosso do Sul</option>
                                    <option value="13" <% if (cod1 == 13) { %> selected <% } %> > Minas Gerais</option>
                                    <option value="14" <% if (cod1 == 14) { %> selected <% } %> > Pará</option>
                                    <option value="15" <% if (cod1 == 15) { %> selected <% } %> > Paraíba</option>
                                    <option value="16" <% if (cod1 == 16) { %> selected <% } %> > Paraná</option>
                                    <option value="17" <% if (cod1 == 17) { %> selected <% } %> > Pernambuco</option>
                                    <option value="18" <% if (cod1 == 18) { %> selected <% } %> > Piauí</option>
                                    <option value="19" <% if (cod1 == 19) { %> selected <% } %> > Rio de Janeiro</option>
                                    <option value="20" <% if (cod1 == 20) { %> selected <% } %> > Rio Grande do Norte</option>
                                    <option value="21" <% if (cod1 == 21) { %> selected <% } %> > Rio Grande do Sul</option>
                                    <option value="22" <% if (cod1 == 22) { %> selected <% } %> > Rondônia</option>
                                    <option value="23" <% if (cod1 == 23) { %> selected <% } %> > Roraima</option>
                                    <option value="24" <% if (cod1 == 24) { %> selected <% } %> > Santa Catarina</option>
                                    <option value="25" <% if (cod1 == 25) { %> selected <% } %> > São Paulo</option>
                                    <option value="26" <% if (cod1 == 26) { %> selected <% } %> > Sergipe</option>
                                    <option value="27" <% if (cod1 == 27) { %> selected <% } %> > Tocantins</option>
                                </select>
                            </td>
                        </tr>
                        <%
                        if(request.getParameter("estado_id") != null){
                            
                            int cod = Integer.parseInt(request.getParameter("estado_id"));
                            
                            transacoes.Municipio tm = new transacoes.Municipio();
                            Vector municipios = tm.pesquisarporEstado2(cod);
                        %>
                        <tr>
                            <td>Municipio</td>
                            <td>
                                <select name="municipio">
                                    <%
                                        for(int i = 0; i<municipios.size();i++){
                                            data.MunicipioDO m = new data.MunicipioDO();
                                            m = (data.MunicipioDO)municipios.elementAt(i);
                                            if (m.getMun_cod() == mun){
                                    %>
                                    <option value=<%= m.getMun_cod() %> selected> <%=m.getMun_nome() %></option>
                                    <%      } else{
%>
                                    <option value=<%= m.getMun_cod() %>> <%=m.getMun_nome() %></option>        
                                    <%        }
                                        
                                        }
                        }
%>
                                </select>
                            </td>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" maxlength="200" required value=<%= nome %>/>
                        </tr>
                        <tr>
                            <td>RG</td>
                            <td><input type="text" name="rg" maxlength="9" onkeypress='return isNumberKey(event)' required value=<%= rg %> />
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" name="cpf" maxlength="11" onkeypress='return isNumberKey(evt)' required value=<%= cpf %> />
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Endereço</td>
                            <td><input type="text" name="endereco" maxlength="200" required value=<%= rua %> />
                        </tr>
                        <tr>
                            <td>Número</td>
                            <td><input type="text" name="numero" maxlength="10" onkeypress='return isNumberKey(event)' required value=<%= num %> />
                        </tr>
                        <tr>
                            <td>Bairro</td>
                            <td><input type="text" name="bairro" maxlength="200" required value=<%= bairro %>/>
                        </tr>
                        <tr>
                        <tr>
                            <td>Telefone - 1</td>
                            <td><input type="text" name="telefone1" maxlength="8" onkeypress='return isNumberKey(event)' required value=<%= tel1 %> />
                        </tr>
<%
                        if(telefones.size()>1){
%>
                        <tr>
                            <input type="hidden" name="codtelefone2" value=<%= tel2cods%> />
                            <td>Telefone - 2</td>
                            <td><input type="text" name="telefone2" maxlength="8" onkeypress='return isNumberKey(event)' value=<%= tel2s %> />
                        </tr>
<%
                        }
%>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Login (email)</td>
                            <td><input type="text" name="login" maxlength="150" required value=<%= login %> />
                        </tr>
                        </table>
                        <input type="submit" name="atualizar" value="atualizar" />
                        <input type="submit" name="voltar" value="voltar" />
                        <input type="hidden" name="ce" value=<%= estcod%> />
                        <input type="hidden" name="cm" value=<%= mun%> />
                        <input type="hidden" name="codtelefone1" value=<%= tel1cod%> />
                        <input type="hidden" name="senha" value=<%= senha%> />
                        <input type="hidden" name="numerodetelefones" value=<%= telefones.size()%> />
                    </form>
<%                                
                    }
                    if (null != request.getParameter("voltar")) {
                        response.sendRedirect("/PDS/Paciente/Home.jsp"); 
                    }
%>

<! ------------------------------------------------------------------->

<%
                    if(null != request.getParameter("atualizar")){
                        String cod_usus = request.getParameter("cod");
                        int cod_usu = Integer.parseInt(cod_usus);
                        String cod_ests = request.getParameter("ce");
                        int cod_est = Integer.parseInt(cod_ests);
                        String cod_muns = request.getParameter("cm");
                        int cod_mun = Integer.parseInt(cod_muns);
                        String cod_tel1s = request.getParameter("codtelefone1");
                        int cod_tel1 = Integer.parseInt(cod_tel1s);
                        int n = Integer.parseInt(request.getParameter("numerodetelefones"));
                        int cod_tel2 = 0;
                        int new_tel2 = 0;
                        if (n>1){
                            cod_tel2 = Integer.parseInt(request.getParameter("codtelefone2"));
                            new_tel2 = Integer.parseInt(request.getParameter("telefone2"));
                        }
                        
                        
                        String new_nome = request.getParameter("nome");
                        String new_rg = request.getParameter("rg");
                        String new_cpf = request.getParameter("cpf");
                        String new_end = request.getParameter("endereco");
                        int new_num = Integer.parseInt(request.getParameter("numero"));
                        String new_bairro = request.getParameter("bairro");
                        int new_tel1 = Integer.parseInt(request.getParameter("telefone1"));
                        String new_login = request.getParameter("login");
                        int new_estado = Integer.parseInt(request.getParameter("estado_id"));
                        int new_municipio = Integer.parseInt(request.getParameter("municipio"));
                        
                        transacoes.Usuario tu = new transacoes.Usuario();
                        data.UsuarioDO new_usu = new data.UsuarioDO();
                        
                        new_usu.setUsu_foto(null);
                        new_usu.setUsu_ativo(true);
                        new_usu.setUsu_cod(cod_usu);
                        new_usu.setUsu_cpf(new_cpf);
                        new_usu.setUsu_login(new_login);
                        new_usu.setUsu_nome(new_nome);
                        new_usu.setUsu_rg(new_rg);
                        new_usu.setUsu_senha(request.getParameter("senha"));
                        
                        transacoes.Paciente tp = new transacoes.Paciente();
                        data.PacienteDO paciente = new data.PacienteDO();
                        Vector log = tp.pesquisarPacientePorLogin(new_login);
                        Vector r = tp.pesquisarPacientePorRg(new_rg);
                        Vector c = tp.pesquisarPacientePorCpf(new_cpf);
                        boolean a = tu.atualizar(new_usu);
                        
                        
                        transacoes.Telefone ttf = new transacoes.Telefone();
                        data.TelefoneDO te1 = new data.TelefoneDO();
                        
                        te1.setTel_cod(cod_tel1);
                        te1.setTel_numero(new_tel1);
                        te1.setUsuario_Usu_Cod(cod_usu);
                        
                        boolean b = ttf.atualizar(te1);
                        boolean d = true;
                        if(n>1){
                            data.TelefoneDO te2 = new data.TelefoneDO();
                            te2.setTel_cod(cod_tel2);
                            te2.setTel_numero(new_tel2);
                            te2.setUsuario_Usu_Cod(cod_usu);
                            d = ttf.atualizar(te2);
                        }
                        
                        transacoes.Endereco te = new transacoes.Endereco();
                        data.EnderecoDO e1 = new data.EnderecoDO();
                        Vector ep = te.pesquisarPorCodDaPessoa(cod_usu);
                        data.EnderecoDO ep1 = new data.EnderecoDO();
                        ep1 = (data.EnderecoDO)ep.elementAt(1);
                        int codigo_do_end = ep1.getEnd_cod();
                        
                        
                        
                        e1.setEnd_bairro(new_bairro);
                        e1.setEnd_cod(codigo_do_end);
                        e1.setEnd_num(new_num);
                        e1.setEnd_rua(new_end);
                        e1.setMunicipio_Mun_cod(cod_mun);
                        e1.setTipo_Endereco_TipEnd_cod(1);
                        e1.setUsuario_Usu_cod(cod_usu);
                        
                        boolean e = te.atualizar(e1);
                        
                        if(a && b && d && e){
%>
          Transação realizada com sucesso!
          <form action="/PDS/Paciente/Home.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%
                        } else {
%>                         
          Erro ao editar ficha médica          
          <form action="/PDS/Paciente/Atualizar_Cadastro.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
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
