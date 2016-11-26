<%-- 
    *******Cadastro Paciente*********
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
        <%@page import="java.util.*"%>
        <%@page import="data.MunicipioDO"%>
        <%@ include file="/Geral/verifylogin.jsp" %>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td colspan="2">
                    <%@ include file="/Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                    <br>
                    <h1>Cadastro Paciente</h1>
                    <br>
<%     if ( null == request.getParameterValues("incluir") ) {
%>
                <form action="./primeiro_acesso_paciente.jsp" method="post">


                    <script>
                        function isNumberKey(evt){
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode < 48 || charCode > 57))
                                return false;
                            return true;
                        }
                        function isNumberKey2(evt){
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
            
                    <table>
                            <td>Estado</td>
                            <td>
                        <%
                        int cod1;
                        if(request.getParameter("estado_id") != null){
                            cod1 = Integer.parseInt(request.getParameter("estado_id"));
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
                                            MunicipioDO m = new MunicipioDO();
                                            m = (MunicipioDO)municipios.elementAt(i);                       
                                    %>
                                    <option value=<%= m.getMun_cod() %>> <%=m.getMun_nome() %></option>
                                    <%
                                        }
                        }
                    
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Nome</td>
                            <td><input type="text" name="nome" maxlength="200" required/>
                        </tr>
                        <tr>
                            <td>RG</td>
                            <td><input type="text" name="rg" maxlength="9" onkeypress='return isNumberKey(event)' required/>
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" name="cpf" maxlength="11" onkeypress='return isNumberKey(evt)' required/>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Endereço</td>
                            <td><input type="text" name="endereco" maxlength="200" required/>
                        </tr>
                        <tr>
                            <td>Número</td>
                            <td><input type="text" name="numero" maxlength="10" onkeypress='return isNumberKey(event)' required/>
                        </tr>
                        <tr>
                            <td>Bairro</td>
                            <td><input type="text" name="bairro" maxlength="200" required/>
                        </tr>
                        <tr>
                        <tr>
                            <td>Telefone - 1</td>
                            <td><input type="text" name="telefone1" maxlength="15" onkeypress='return isNumberKey(event)' required/>
                        </tr>
                        <tr>
                            <td>Telefone - 2</td>
                            <td><input type="text" name="telefone2" maxlength="15" onkeypress='return isNumberKey(event)' />
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Login (email)</td>
                            <td><input type="text" name="login" maxlength="150" required/>
                        </tr>
                        <tr>
                            <td>Senha</td>
                            <td><input type="password" name="senha" maxlength="50" required/>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Data de nascimento (dd/mm/yyyy)</td>
                            <td><input type="text" name="data" maxlength="10" onkeypress="return isDate(event)" required/>
                        </tr>
                        <tr>
                            <td>Peso (Kg)</td>
                            <td><input type="text" name="peso" maxlength="9" onkeypress='return isNumberKey2(event)' required/>
                        </tr>
                        <tr>
                            <td>Altura (m)</td>
                            <td><input type="text" name="altura" maxlength="9" onkeypress='return isNumberKey2(event)' required/>
                        </tr>
                        <tr><td><br></td></tr>
                        <tr>
                            <td>Alergias</td>
                            <td><textarea name="alergias" maxlength="300" rows="4" cols="50"/></textarea>
                        </tr>
                        <tr>
                            <td>Medicamentos</td>
                            <td><textarea name="medicamentos" maxlength="300" rows="4" cols="50"/></textarea>
                        </tr>
                        <tr>
                            <td>Doenças em tratamento</td>
                            <td><textarea name="doencas" maxlength="300" rows="4" cols="50"/></textarea>
                        </tr>
                        <tr>
                            <td>Histórico de doenças</td>
                            <td><textarea name="historico" maxlength="300" rows="4" cols="50" /></textarea>
                        </tr>
                        <tr><td><br></td></tr>
            
                    </table>
                    <input type="submit" name="incluir" value="incluir" />
                </form>

<%      } else { 
%>
<! ------------------------------------------------------------------->
<!--   se nao for o request inicial, acionar a transacao de negocio -->


<%     
       int cod_est = Integer.parseInt(request.getParameter("estado_id"));
       int cod_mun = Integer.parseInt(request.getParameter("municipio"));
      
       String nome = request.getParameter("nome");
       String rg = request.getParameter("rg");
       String cpf = request.getParameter("cpf");
       String endereco = request.getParameter("endereco");
       String numero_s = request.getParameter("numero");
       int numero = Integer.parseInt(numero_s);
       String bairro = request.getParameter("bairro");
       String municipio = request.getParameter("municipio");
       String tel1s = request.getParameter("telefone1");
       int tel1 = Integer.parseInt(tel1s);
       String tel2s = request.getParameter("telefone2");
       String login = request.getParameter("login");
       String senha = request.getParameter("senha");
       String data_s = request.getParameter("data");
       DateFormat df = new SimpleDateFormat("dd/MM/yyyy"); 
       java.sql.Date sqldate = new java.sql.Date(df.parse(data_s).getTime());
       String peso_s = request.getParameter("peso");
       float peso = Float.parseFloat(peso_s);
       String altura_s = request.getParameter("altura");
       float altura = Float.parseFloat(altura_s);
       String alergias = request.getParameter("alergias");
       String medicamentos = request.getParameter("medicamentos");
       String doencas = request.getParameter("doencas");
       String historico = request.getParameter("historico");
      
       transacoes.Paciente tp = new transacoes.Paciente();
       data.PacienteDO paciente = new data.PacienteDO();
       
       paciente.setUsu_login(login);
       paciente.setUsu_senha(senha);
       paciente.setUsu_nome(nome);
       paciente.setUsu_rg(rg);
       paciente.setUsu_cpf(cpf);
       paciente.setUsu_foto(null);
       paciente.setUsu_ativo(true);
       paciente.setPac_nascimento(sqldate);
       paciente.setPac_peso(peso);
       paciente.setPac_altura(altura);
       paciente.setPac_alergias(alergias);
       paciente.setPac_medicamentos(medicamentos);
       paciente.setPac_doencas_tratamento(doencas);
       paciente.setPac_historico_doencas(historico);
       
       Vector logpac = tp.pesquisarPacientePorLogin(login);
       Vector rgpac = tp.pesquisarPacientePorRg(rg);
       Vector cpfpac = tp.pesquisarPacientePorCpf(cpf);
       boolean a = false;
       
       if((logpac.size() == 0) && (rgpac.size() == 0) && (cpfpac.size() == 0)) {
           a = tp.incluir(paciente);
       }
       
       int cod = paciente.getUsu_cod();
       transacoes.Telefone t1 = new transacoes.Telefone();
       data.TelefoneDO telefone1 = new data.TelefoneDO();
       telefone1.setTel_numero(tel1);
       telefone1.setUsuario_Usu_Cod(cod);
       
       boolean b = t1.incluir(telefone1);
       
       boolean c = true;
       if (tel2s.equals("") == false){
            int tel2 = Integer.parseInt(tel2s);
            transacoes.Telefone t2 = new transacoes.Telefone();
            data.TelefoneDO telefone2 = new data.TelefoneDO();
            telefone2.setTel_numero(tel2);
            telefone2.setUsuario_Usu_Cod(cod);
            c = t2.incluir(telefone2);
       }
       
       transacoes.Endereco te = new transacoes.Endereco();
       data.EnderecoDO end = new data.EnderecoDO();
       end.setEnd_bairro(bairro);
       end.setEnd_num(numero);
       end.setEnd_rua(endereco);
       end.setMunicipio_Mun_cod(cod_mun);
       end.setTipo_Endereco_TipEnd_cod(1);
       end.setUsuario_Usu_cod(cod);
          
       boolean e = te.incluir(end);
         
       if (a && b && c && e) {
%>
          Cadastro concluido com sucesso! Bem vindo ao PoliDATASus!
          <form action="/PDS/" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else if(logpac.size() > 0){
%>
          Erro ao incluir usuário
          Login já cadastrado!<br>
          <form action="primeiro_acesso_paciente.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
          <form action="/PDS/" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%      } else if(rgpac.size() > 0){
%>
        Erro ao incluir usuário <br>
        RG já cadastrado!
        <form action="primeiro_acesso_paciente.jsp" method="post">
            <input type="submit" name="retry" value="Repetir" />
        </form>
        <form action="/PDS/" method="post">
             <input type="submit" name="voltar" value="Voltar" />
        </form>
<%      } else if(cpfpac.size() > 0){
%>
        Erro ao incluir usuário<br>
        CPF já cadastrado!
        <form action="primeiro_acesso_paciente.jsp" method="post">
            <input type="submit" name="retry" value="Repetir" />
        </form>
        <form action="/PDS/" method="post">
             <input type="submit" name="voltar" value="Voltar" />
        </form>
<%      } else{
%>
        Erro ao incluir usuário<br>
        Telefones já cadastrado!
        <form action="primeiro_acesso_paciente.jsp" method="post">
            <input type="submit" name="retry" value="Repetir" />
        </form>
        <form action="/PDS/" method="post">
             <input type="submit" name="voltar" value="Voltar" />
        </form>
<%      }

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
