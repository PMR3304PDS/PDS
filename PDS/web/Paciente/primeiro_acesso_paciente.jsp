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
                            <td>Tipo de Endereço</td>
                            <td>
                                <select name="tipoendereco">
                                    <option value="Alameda">Alameda</option>
                                    <option value="Avenida">Avenida</option>
                                    <option value="Chácara">Chácara</option>
                                    <option value="Condominio">Condominio</option>
                                    <option value="Conjunto">Conjunto</option>
                                    <option value="Estrada">Estrada</option>
                                    <option value="Jardim">Jardim</option>
                                    <option value="Ladeira">Ladeira</option>
                                    <option value="Largo">Largo</option>
                                    <option value="Parque">Parque</option>
                                    <option value="Passarela">Passarela</option>
                                    <option value="Pátio">Pátio</option>
                                    <option value="Praça">Praça</option>
                                    <option value="Quadra">Quadra</option>
                                    <option value="Residencial">Residencial</option>
                                    <option value="Rodovia">Rodovia</option>
                                    <option value="Rua" selected>Rua</option>
                                    <option value="Setor">Setor</option>
                                    <option value="Sítio">Sítio</option>
                                    <option value="Travessia">Travessia</option>
                                    <option value="Trecho">Trecho</option>
                                    <option value="Via">Via</option>
                                    <option value="Viaduto">Viaduto</option>
                                    <option value="Viela">Viela</option>
                                    <option value="Vila">Vila</option>
                                </select>
                            </td>
                        </tr>
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
                            <td>Município</td>
                            <td><input type="text" name="municipio" maxlength="200" required/>
                        </tr>
                        <tr>
                            <td>Estado</td>
                            <td>
                                <select name="estado">
                                    <option value="Acre">Acre</option>
                                    <option value="Alagoas">Alagoas</option>
                                    <option value="Amapá">Amapá</option>
                                    <option value="Amazonas">Amazonas</option>
                                    <option value="Bahia">Bahia</option>
                                    <option value="Ceará">Ceará</option>
                                    <option value="Distrito Federal">Distrito Federal</option>
                                    <option value="Espirito Santo">Espirito Santo</option>
                                    <option value="Goiás">Goiás</option>
                                    <option value="Maranhão">Maranhão</option>
                                    <option value="Mato Grosso">Mato Grosso</option>
                                    <option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
                                    <option value="Minas Gerais">Minas Gerais</option>
                                    <option value="Pará">Pará</option>
                                    <option value="Paraíba">Paraíba</option>
                                    <option value="Paraná">Paraná</option>
                                    <option value="Pernambuco">Pernambuco</option>
                                    <option value="Piauí">Piauí</option>
                                    <option value="Rio de Janeiro">Rio de Janeiro</option>
                                    <option value="Rio Grande do Norte">Rio Grande do Norte</option>
                                    <option value="Rio Grande do Sul">Rio Grande do Sul</option>
                                    <option value="Rondônia">Rondônia</option>
                                    <option value="Roraima">Roraima</option>
                                    <option value="Santa Catarina">Santa Catarina</option>
                                    <option value="São Paulo">São Paulo</option>
                                    <option value="Sergipe">Sergipe</option>
                                    <option value="Tocantins">Tocantins</option>
                                </select>
                            </td>
                        </tr>
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
                            <td>Data de nascimento</td>
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
                            <td><textarea name="historico" maxlength="300" rows="4" cols="50"/></textarea>
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
       String estado = request.getParameter("estado");
       int cod_est = 0;
       if (estado == "Acre"){
           cod_est = 1;
       } else if (estado == "Alagoas"){
           cod_est = 2;
       } else if (estado == "Amapá"){
           cod_est = 3;
       } else if (estado == "Amazonas"){
           cod_est = 4;
       } else if (estado == "Bahia"){
           cod_est = 5;
       } else if (estado == "Ceará"){
           cod_est = 6;
       } else if (estado == "Distrito Federal"){
           cod_est = 7;
       } else if (estado == "Espirito Santo"){
           cod_est = 8;
       } else if (estado == "Goiás"){
           cod_est = 9;
       } else if (estado == "Maranhão"){
           cod_est = 10;
       } else if (estado == "Mato Grosso"){
           cod_est = 11;
       } else if (estado == "Mato Grosso do Sul"){
           cod_est = 12;
       } else if (estado == "Minas Gerais"){
           cod_est = 13;
       } else if (estado == "Pará"){
           cod_est = 14;
       } else if (estado == "Paraíba"){
           cod_est = 15;
       } else if (estado == "Paraná"){
           cod_est = 16;
       } else if (estado == "Pernambuco"){
           cod_est = 17;
       } else if (estado == "Piauí"){
           cod_est = 18;
       } else if (estado == "Rio de Janeiro"){
           cod_est = 19;
       } else if (estado == "Rio Grande do Norte"){
           cod_est = 20;
       } else if (estado == "Rio Grande do Sul"){
           cod_est = 21;
       } else if (estado == "Rondônia"){
           cod_est = 22;
       } else if (estado == "Roraima"){
           cod_est = 23;
       } else if (estado == "Santa Catarina"){
           cod_est = 24;
       } else if (estado == "São Paulo"){
           cod_est = 25;
       } else if (estado == "Sergipe"){
           cod_est = 26;
       } else if (estado == "Tocantins"){
           cod_est = 27;
       }
    
       String tipoendereco = request.getParameter("tipoendereco");
       int cod_end = 0;
       if (tipoendereco == "Alameda"){
           cod_end = 1;
       } else if (tipoendereco == "Avenida"){
           cod_end = 2;
       } else if (tipoendereco == "Chácara"){
           cod_end = 3;
       } else if (tipoendereco == "Condomínio"){
           cod_end = 4;
       } else if (tipoendereco == "Conjunto"){
           cod_end = 5;
       } else if (tipoendereco == "Estrada"){
           cod_end = 6;
       } else if (tipoendereco == "Jardim"){
           cod_end = 7;
       } else if (tipoendereco == "Ladeira"){
           cod_end = 8;
       } else if (tipoendereco == "Largo"){
           cod_end = 9;
       } else if (tipoendereco == "Parque"){
           cod_end = 10;
       } else if (tipoendereco == "Passarela"){
           cod_end = 11;
       } else if (tipoendereco == "Pátio"){
           cod_end = 12;
       } else if (tipoendereco == "Praça"){
           cod_end = 13;
       } else if (tipoendereco == "Quadra"){
           cod_end = 14;
       } else if (tipoendereco == "Residencial"){
           cod_end = 15;
       } else if (tipoendereco == "Rodovia"){
           cod_end = 16;
       } else if (tipoendereco == "Rua"){
           cod_end = 17;
       } else if (tipoendereco == "Setor"){
           cod_end = 18;
       } else if (tipoendereco == "Sítio"){
           cod_end = 19;
       } else if (tipoendereco == "Travessa"){
           cod_end = 20;
       } else if (tipoendereco == "Trecho"){
           cod_end = 21;
       } else if (tipoendereco == "Via"){
           cod_end = 22;
       } else if (tipoendereco == "Viaduto"){
           cod_end = 23;
       } else if (tipoendereco == "Viela"){
           cod_end = 24;
       } else if (tipoendereco == "Vila"){
           cod_end = 25;
       } 
      
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
       int tel2 = Integer.parseInt(tel2s);
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
      
       transacoes.Paciente tn = new transacoes.Paciente();
       data.PacienteDO paciente = new data.PacienteDO();
       
       //paciente.setUsu_cod(null);
       paciente.setUsu_login(login);
       paciente.setUsu_senha(senha);
       paciente.setUsu_nome(nome);
       paciente.setUsu_rg(rg);
       paciente.setUsu_cpf(cpf);
       paciente.setUsu_ativo(true);
       paciente.setPac_nascimento(sqldate);
       paciente.setPac_peso(peso);
       paciente.setPac_altura(altura);
       paciente.setPac_alergias(alergias);
       paciente.setPac_medicamentos(medicamentos);
       paciente.setPac_doencas_tratamento(doencas);
       paciente.setPac_historico_doencas(historico);
       
       //String telefone = request.getParameter("telefone");
       //transacoes.Contato tn = new transacoes.Contato();
       //data.ContatoDO contato = new data.ContatoDO();
       //contato.setNome(nome);
       //contato.setTelefone(telefone); 
       
       
       if (tn.incluir(paciente)) {
         
         //int cod = paciente.getUsu_cod();
         
         //transacoes.Telefone t1 = new transacoes.Telefone();
         //data.TelefoneDO telefone1 = new data.TelefoneDO();
         //telefone1.setTel_cod(null);
         //telefone1.setTel_numero(tel1);
         //telefone1.setUsuario_Usu_Cod(cod);
         //t1.incluir(telefone1);
         
         //transacoes.Telefone t2 = new transacoes.Telefone();
         //data.TelefoneDO telefone2 = new data.TelefoneDO();
         //telefone2.setTel_cod(null);
         //telefone2.setTel_numero(tel2);
         //telefone2.setUsuario_Usu_Cod(cod);
         //t2.incluir(telefone2);
         
         //transacoes.Municipio tm = new transacoes.Municipio();
         //data.MunicipioDO mun = new data.MunicipioDO();
         //mun.setMun_cod(null);
         //mun.setMun_nome(municipio);
         //mun.setEstado_Est_cod(cod_est);
         //tm.incluir(mun);
         
         //int codmun = mun.getMun_cod();
         //transacoes.Endereco te = new transacoes.Endereco();
         //data.EnderecoDO end = new data.EnderecoDO();
         //end.setEnd_cod(null);
         //end.setEnd_rua(endereco);
         //end.setEnd_num(numero);
         //end.setEnd_bairro(bairro);
         //end.setUsuario_Usu_cod(cod);
         //end.setMunicipio_Mun_cod(codmun);
         //end.setTipo_Endereco_TipEnd_cod(cod_end);
         //te.incluir(end);
%>
          Transação realizada com sucesso!
          <form action="index.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
<%     } else {
%>
          Erro ao incluir usuário            
          <form action="primeiro_acesso_paciente.jsp" method="post">
             <input type="submit" name="retry" value="Repetir" />
          </form>
<%     }
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

