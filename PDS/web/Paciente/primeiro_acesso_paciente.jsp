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
                                    <option value="1">Acre</option>
                                    <option value="2">Alagoas</option>
                                    <option value="3">Amapá</option>
                                    <option value="4">Amazonas</option>
                                    <option value="5">Bahia</option>
                                    <option value="6">Ceará</option>
                                    <option value="7">Distrito Federal</option>
                                    <option value="8">Espirito Santo</option>
                                    <option value="9">Goiás</option>
                                    <option value="10">Maranhão</option>
                                    <option value="11">Mato Grosso</option>
                                    <option value="12">Mato Grosso do Sul</option>
                                    <option value="13">Minas Gerais</option>
                                    <option value="14">Pará</option>
                                    <option value="15">Paraíba</option>
                                    <option value="16">Paraná</option>
                                    <option value="17">Pernambuco</option>
                                    <option value="18">Piauí</option>
                                    <option value="19">Rio de Janeiro</option>
                                    <option value="20">Rio Grande do Norte</option>
                                    <option value="21">Rio Grande do Sul</option>
                                    <option value="22">Rondônia</option>
                                    <option value="23">Roraima</option>
                                    <option value="24">Santa Catarina</option>
                                    <option value="25">São Paulo</option>
                                    <option value="26">Sergipe</option>
                                    <option value="27">Tocantins</option>
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
       int cod_est = Integer.parseInt("estado");
      
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
       
       boolean a = tp.incluir(paciente);
       
       int cod = paciente.getUsu_cod();
       transacoes.Telefone t1 = new transacoes.Telefone();
       data.TelefoneDO telefone1 = new data.TelefoneDO();
       telefone1.setTel_numero(tel1);
       telefone1.setUsuario_Usu_Cod(cod);
       
       boolean b = t1.incluir(telefone1);
         
       transacoes.Telefone t2 = new transacoes.Telefone();
       data.TelefoneDO telefone2 = new data.TelefoneDO();
       telefone2.setTel_numero(tel2);
       telefone2.setUsuario_Usu_Cod(cod);
       
       boolean c = t2.incluir(telefone2);
         
       transacoes.Municipio tm = new transacoes.Municipio();
       data.MunicipioDO mun = new data.MunicipioDO();
       mun.setMun_nome(municipio);
       mun.setEstado_Est_cod(cod_est);
       
       boolean d = tm.incluir(mun);
         
       int codmun = mun.getMun_cod();
       transacoes.Endereco te = new transacoes.Endereco();
       data.EnderecoDO end = new data.EnderecoDO();
       end.setEnd_rua(endereco);
       end.setEnd_num(numero);
       end.setEnd_bairro(bairro);
       end.setUsuario_Usu_cod(cod);
       end.setMunicipio_Mun_cod(codmun);
       end.setTipo_Endereco_TipEnd_cod(1);
       
       boolean e = te.incluir(end);
         
       
       if (a && b && c && d && e) {
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

