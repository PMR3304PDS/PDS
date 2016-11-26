<%@page import="utils.Transacao"%>
<html>
    <head>
        <title>POLIdataSUS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
<%@ page import="transacoes.*" %>
<%@ page import="transacoes.Conselhos" %>
<%@ page import="java.util.*" %>
<%@ page import="data.MedicoDO" %>
<%@ page import="data.*" %>
<%@ page import="data.EnderecoDO" %>
<%@ page import="data.Tipo_EnderecoDO" %>
<%@ page import="data.MunicipioDO" %>
<%@ page import="data.EstadoDO" %>
<%@ page import="data.ConselhosDO" %>
<%@ page import="data.ConselhosDATA" %>
<%@ page import="data.EspecialidadeDO" %>
<%@ page import="data.UsuarioDO" %>
   <body>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td >
                    <%@ include file="/Geral/header.jsp" %>
                </td>
            </tr>
            <tr>
                <td>
                  
<header>
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
<h1> Cadastro Médico</h1>
</header>
   <!--Verificar se e primeiro cadastro ou pra armazenar no banco-->
    <% 
        if(( request.getParameterValues("cadastrar") == null )||( request.getParameter("cancelar")!= null)){
    
    %>
     <form action="./CadastroMedico.jsp">
        <fieldset id="usuario">    
<legend>Informações Pessoais</legend>

<p>Nome:<input type="text" id="iNome" Name="nName" size="40" maxlength="200"  placeholder="obrigatório"></p>
<p>RG:<input type="text" id="iRG" Name="nRG" size="40" maxlength="12"  placeholder="obrigatório"></p>
<p>CPF:<input type="text" id="iCPF" Name="nCPF" size="40" maxlength="11"  placeholder="obrigatório" onkeypress='return isNumberKey(event)'>
<p>CRM:<input type="text" id="iCRM" Name="nCRM" size="40" maxlength="10"  placeholder="obrigatório"> </p>

<p>Especialidade :
<select id="iEsp" Name="nEsp">
   <%
    Vector esp = (new Especialidade()).pesquisar();
    for(int i = 0; i < esp.size(); i++)
    {
    %>
        <option value=<%=((EspecialidadeDO)esp.elementAt(i)).getEsp_cod() %>> <%= ((EspecialidadeDO)esp.elementAt(i)).getEsp_nome()%> </option>
    <%
    }
    %> 

</select>
</p>
<p>
    Conselho ao qual é subordinado:
    <select id="iCon" Name="nCon">
    <%
    Vector con = (new Conselhos()).pesquisar();
    for(int i = 0; i < con.size(); i++)
    {
    %>
        <option value=<%=((ConselhosDO)con.elementAt(i)).getCon_cod() %> > <%= ((ConselhosDO)con.elementAt(i)).getCon_nome()%> </option>

    <%
    }
    %>
      </select> 
      </br></br>Estado Emissor:
        <select id="iEst" Name="nEstCon">
     <%
    Vector est = (new Estado()).pesquisar();
    for(int i = 0; i < est.size(); i++)
    {
    %>
        <option value=<%=((EstadoDO)est.elementAt(i)).getEst_cod() %> > <%= ((EstadoDO)est.elementAt(i)).getEst_nome()%> </option>
    <%
    }
    %>

</select>
</p>
</fieldset>
<fieldset id="enderecos">
<legend>Informações de atendimento</legend>

<p>Cidade onde atende:
    <select id="iCidade" Name="nCidade">
       <%
    Vector mun = (new Municipio()).pesquisar();
    for(int i = 0; i < mun.size(); i++)
    {
    %>
       <option value=<%= ((MunicipioDO)mun.elementAt(i)).getMun_cod() %> > <%=((MunicipioDO)mun.elementAt(i)).getMun_nome()%>  </option>
    <%
    }
    %>
    </select>
    
    &nbsp  &nbsp Estado:
    
    <select id="iEst" Name="nEst">
     <%
    for(int i = 0; i < est.size(); i++)
    {
    %>
        <option value=<%=((EstadoDO)est.elementAt(i)).getEst_cod() %> > <%= ((EstadoDO)est.elementAt(i)).getEst_nome()%> </option>
    <%
    }
    %>

</select>
</p>         
<p>Endereço de Atendimento 1:</p>
   <p> Bairro :&nbsp;<input type="text" id="iEndBairro1" Name="nEndBairro1" size="40" maxlength="200" placeholder="obrigatório"><br><br>
    Rua    :&nbsp;&nbsp;&nbsp;<input type="text" id="iEndRua1" Name="nEndRua1" size="40" maxlength="200" placeholder="obrigatório"><br><br>
    Número :<input type="text" id="iEndNum1" Name="nEndNum1" size="40" maxlength="200" placeholder="obrigatório" onkeypress='return isNumberKey(event)' ></p>
<p> 
  <input type="radio" id="iPart1" Name="nTipo1" Value="Particular"><label for="iPart1">Particular</label> 	
  <input type="radio" id="iPub1" Name="nTipo1" Value="Publico"> <label for="iPub1">Público</label> 
  </p>
<p>Endereço de Atendimento 2:</p>
   <p> Bairro :&nbsp;<input type="text" id="iEndBairro2" Name="nEndBairro2" size="40" maxlength="200"><br><br>
    Rua    :&nbsp;&nbsp;&nbsp;<input type="text" id="iEndRua2" Name="nEndRua2" size="40" maxlength="200" ><br><br>
    Número :<input type="text" id="iEndNum2" Name="nEndNum2" size="40" maxlength="200" onkeypress='return isNumberKey(event)'></p>
<p> 
  <input type="radio" id="iPart2" Name="nTipo2" Value="Particular"><label for="iPart2">Particular</label> 	
  <input type="radio" id="iPub2" Name="nTipo2" Value="Publico"><label for="iPub2">Público</label>	
  </p>
<p>Endereço de Atendimento 3:</p>
     <p> Bairro :&nbsp;<input type="text" id="iEndBairro3" Name="nEndBairro3" size="40" maxlength="200" ><br><br>
    Rua    :&nbsp;&nbsp;&nbsp;<input type="text" id="iEndRua3" Name="nEndRua3" size="40" maxlength="200" ><br><br>
    Número :<input type="text" id="iEndNum3" Name="nEndNum3" size="40" maxlength="200"onkeypress='return isNumberKey(event)' ></p>
     <p>
  <input type="radio" id="iPart3" Name="nTipo3" Value="Particular"><label for="iPart3">Particular</label>
  <input type="radio" id="iPub2" Name="nTipo3" Value="Publico"><label for="iPub3">Público</label>	
  </p>
  <p>Telefones para contato:<input type="text" id="itel1" Name="ntel1" size="20" maxlength="12" onkeypress='return isNumberKey(event)'> 
   &nbsp &nbsp &nbsp &nbsp <input type="text" id="itel2" Name="nTel2" size="20" maxlength="12"  onkeypress='return isNumberKey(event)' ></p>

</fieldset>
<fieldset id="login">  
<legend>Login</legend>
<p>Login:<input type="text" id="ilogin" Name="nlogin" size="40" maxlength="200"  placeholder="obrigatório"></p>
<p>Senha:<input type="password" id="isenha" Name="nsenha" size="40" maxlength="100"  placeholder="obrigatório"></p>

<p><input type="submit" name="cadastrar"value="Cadastrar">&nbsp &nbsp &nbsp &nbsp <input type="submit" name="cancelar" value="Cancelar"></p>
</fieldset>
</form>
 <form action='/PDS/Geral/temppage.jsp'>
 <p>
    <input type='submit' name="Voltar" value="Voltar"> 
 </p>    
 </form>   
 <!--Preencher informacoes do banco de dados-->
 
<%}else { 
%>

 <%
       data.MedicoDO medico = new data.MedicoDO();
       data.UsuarioDO usuario = new data.UsuarioDO();
       data.EnderecoDO endereco1=new data.EnderecoDO();
       data.EnderecoDO endereco2=new data.EnderecoDO();
       data.EnderecoDO endereco3=new data.EnderecoDO();
       data.Tipo_EnderecoDO TipoEndereco1= new data.Tipo_EnderecoDO();
       data.Tipo_EnderecoDO TipoEndereco2= new data.Tipo_EnderecoDO();
       data.Tipo_EnderecoDO TipoEndereco3= new data.Tipo_EnderecoDO();
       data.MunicipioDO cidade= new data.MunicipioDO();
       data.EstadoDO estado=new data.EstadoDO();
       data.EstadoDO estadoCon=new data.EstadoDO();
       data.EspecialidadeDO especialidade=new data.EspecialidadeDO();
       data.ConselhosDO conselho=new data.ConselhosDO();
       data.TelefoneDO tel1=new TelefoneDO();
       data.TelefoneDO tel2=new TelefoneDO();
       Transacao tn1 = new Transacao();//
       Medico medIncluir=new Medico();
        Usuario TransicaoUsuario= new Usuario();
       data.MedicoDATA Md =new data.MedicoDATA();
       data.Medico_has_EspecialidadeDO MhE= new data.Medico_has_EspecialidadeDO ();
       String nome = request.getParameter("nName");//obrigatorio
       String RG = request.getParameter("nRG");//obrigatorio
       String CPF = request.getParameter("nCPF");//obrigatorio
       String login = request.getParameter("nlogin");//obrigatorio
       String senha = request.getParameter("nsenha");//obrigatorio
       String CRM = request.getParameter("nCRM");//obrigatorio
       String Especialidade=request.getParameter("nEsp");//obrigatorio
       %>
   <% 
           Vector esp = (new Especialidade()).pesquisar();
    for(int i = 0; i < esp.size(); i++)
    {
         if(Integer.parseInt(Especialidade)== ((EspecialidadeDO)esp.elementAt(i)).getEsp_cod() )
         {especialidade=((EspecialidadeDO)esp.elementAt(i));break;} 
    }
    %>
      <%
       String Conselho = request.getParameter("nCon");//obrigatorio
       %>
   <% 
           Vector con = (new Conselhos()).pesquisar();
    for(int i = 0; i < con.size(); i++)
    {
         if(Integer.parseInt(Conselho)==((ConselhosDO)con.elementAt(i)).getCon_cod())
         {conselho=((ConselhosDO)con.elementAt(i));break; }
    }
    %>
      <%
       String Cidade= request.getParameter("nCidade");//obrigatorio
           %>
   <% 
           Vector cid = (new Municipio()).pesquisar();
    for(int i = 0; i < cid.size(); i++)
    {        
        if(Integer.parseInt(Cidade) ==((MunicipioDO)cid.elementAt(i)).getMun_cod() )
        {cidade =((MunicipioDO)cid.elementAt(i));break;} 
    }
    %>
      <%
       String Estado=request.getParameter("nEst");//obrigatorio
              %>
   <% 
           Vector est = (new Estado()).pesquisar();
    for(int i = 0; i < est.size(); i++)
    {        
        if( Integer.parseInt(Estado)==((EstadoDO)est.elementAt(i)).getEst_cod() )
        {estado =((EstadoDO)est.elementAt(i));break;} 
    }
    %>
    <%
       String EstadoCon=request.getParameter("nEstCon");//obrigatorio
              %>
   <% 
    for(int i = 0; i < est.size(); i++)
    {        
        if( Integer.parseInt(Estado)==((EstadoDO)est.elementAt(i)).getEst_cod() )
        {estadoCon =((EstadoDO)est.elementAt(i));break;} 
    }
    %>
      <%
       String Endereco1bairro=request.getParameter("nEndBairro1");
       String Endereco1rua=request.getParameter("nEndRua1");
       String Endereco1numero=request.getParameter("nEndNum1");
       String TipoEnd1=request.getParameter("nTipo1");
       String Endereco2bairro=request.getParameter("nEndBairro2");
       String Endereco2rua=request.getParameter("nEndRua2");
       String Endereco2numero=request.getParameter("nEndNum2");
       String TipoEnd2=request.getParameter("nTipo2");
       String Endereco3bairro=request.getParameter("nEndBairro3");
       String Endereco3rua=request.getParameter("nEndRua3");
       String Endereco3numero=request.getParameter("nEndNum3");
       String TipoEnd3=request.getParameter("nTipo3");
       String Telefone1=request.getParameter("ntel1");
       String Telefone2=request.getParameter("nTel2");
       usuario.setUsu_nome(nome);
       usuario.setUsu_rg(RG);
       usuario.setUsu_cpf(CPF);
       usuario.setUsu_login(login);
       usuario.setUsu_senha(senha);
       endereco1.setEnd_rua(Endereco1rua);
       endereco1.setEnd_bairro(Endereco1bairro);
       if(!Endereco1numero.isEmpty())
         endereco1.setEnd_num(Integer.parseInt(Endereco1numero));
       
       if(!Endereco2bairro.isEmpty()&&!Endereco2numero.isEmpty()&&!Endereco2rua.isEmpty()){
       endereco2.setEnd_rua(Endereco2rua);
       endereco2.setEnd_bairro(Endereco2bairro);
       if(!Endereco2numero.isEmpty())
         endereco2.setEnd_num(Integer.parseInt(Endereco2numero));
       }
       if(!Endereco3bairro.isEmpty()&&!Endereco3numero.isEmpty()&&!Endereco3rua.isEmpty()){
       endereco2.setEnd_rua(Endereco3rua);
       endereco2.setEnd_bairro(Endereco3bairro);
       if(!Endereco1numero.isEmpty())
         endereco2.setEnd_num(Integer.parseInt(Endereco3numero));
       }
       
       
  if((nome.isEmpty())||(RG.isEmpty())||(CPF.isEmpty())||(login.isEmpty())||(senha.isEmpty())||(CRM.isEmpty())||(Especialidade.isEmpty())
                ||(Conselho.isEmpty())||(Cidade.isEmpty())||(Estado.isEmpty())||(Endereco1numero.isEmpty())
                ||(Endereco1bairro.isEmpty())||(Endereco1rua.isEmpty())
                || TipoEnd1.isEmpty()) {
%>
               Erro ao cadastrar,algum campo obrigatório não foi preenchido            
          <form action="./CadastroMedico.jsp" method="post">
             <input type="submit" name="retry" value="Cadastrar Novamente" />
          </form>         

               <%     } else if( medIncluir.verificaPorCrm(CRM)
                              /*Nao consigo buscar */) {
%>

               Erro ao cadastrar,CMR já cadastrado            
          <form action="./CadastroMedico.jsp" method="post">
             <input type="submit" name="retry" value="Cadastrar Novamente" />
             </form>
          <%     } else if( TransicaoUsuario.verificaPorCpf(usuario.getUsu_cpf())  
                              /*Nao consigo buscar */ ) {
%>

               Erro ao cadastrar,Cpf já cadastrado            
          <form action="./CadastroMedico.jsp" method="post">
             <input type="submit" name="retry" value="Cadastrar Novamente" />
             </form>

               <%     } else if( TransicaoUsuario.incluir(usuario)/*Verifica se conseguiu incluir usuario*/  )  { 
               /*Procurar chave primaria do medico e colocar nas outras tabelas*/
                 /*PROBLEMA COM O TIPO DE ENDERECO , VAI DAR MERDA ISSO*/
                 //INCLUIR TELEFONE MESMO NULO?
                 //Como adicionar os dados no sql agora? adicionar medico(check), endereco, telefone(check) ,MEdico_has_especialidade(check),usuario(check) ?
               UsuarioDO usuChave=new UsuarioDO();
               Medico_has_Especialidade MHE =new Medico_has_Especialidade();
                usuChave = (UsuarioDO)(TransicaoUsuario.pesquisarPorCpf(usuario.getUsu_cpf())).elementAt(0);
                Telefone telIncluir= new Telefone();
                Endereco endIncluir=new Endereco();
                Tipo_Endereco chave_tipoEnd= new Tipo_Endereco(); 
                /*SEtar codigo de usuario no medico*/  
                medico.setUsu_cod(usuChave.getUsu_cod());
                medico.setMed_NumRegistro(CRM);
                medico.setConselhos_Con_cod(conselho.getCon_cod());
                medico.setEstado_Est_cod_conselho_emissor(estadoCon.getEst_cod());
                medIncluir.incluir(medico);
                MhE.setEspecialidade_Esp_cod(especialidade.getEsp_cod());
                MhE.setMedico_Usuario_Usu_cod(medico.getUsu_cod());
                MHE.incluir(MhE);
                endereco1.setMunicipio_Mun_cod(cidade.getMun_cod());
                endereco1.setUsuario_Usu_cod(medico.getUsu_cod());
                endereco1.setTipo_Endereco_TipEnd_cod(chave_tipoEnd.buscarPorNome(TipoEnd1));
                endIncluir.incluir(endereco1);
                if(!Endereco2bairro.isEmpty()&&!Endereco2numero.isEmpty()&&!Endereco2rua.isEmpty()&&!Endereco2numero.isEmpty()&&!TipoEnd2.isEmpty()) {
                   endereco2.setMunicipio_Mun_cod(cidade.getMun_cod());
                   endereco2.setUsuario_Usu_cod(medico.getUsu_cod());
                   endereco2.setTipo_Endereco_TipEnd_cod(chave_tipoEnd.buscarPorNome(TipoEnd2));               
                   endIncluir.incluir(endereco2);
                }
                if(!Endereco3bairro.isEmpty()&&!Endereco3numero.isEmpty()&&!Endereco3rua.isEmpty()){
                   endereco3.setMunicipio_Mun_cod(cidade.getMun_cod());
                   endereco3.setUsuario_Usu_cod(medico.getUsu_cod());
                   endereco3.setTipo_Endereco_TipEnd_cod(chave_tipoEnd.buscarPorNome(TipoEnd3));
                   endIncluir.incluir(endereco3);
                }
                if(!Telefone1.equals("")){
                  tel1.setTel_numero(Integer.parseInt(Telefone1));
                  tel1.setUsuario_Usu_Cod(medico.getUsu_cod());
                  telIncluir.incluir(tel1);                   
                } 
                if(!Telefone1.equals("")){
                  tel2.setTel_numero(Integer.parseInt(Telefone2)); 
                  tel2.setUsuario_Usu_Cod(medico.getUsu_cod());
                  telIncluir.incluir(tel2);
                }
               
               
               
               
               
               %>
              
          Transação realizada com sucesso!
          <form action=="./CadastroMedico.jsp" method="post">
             <input type="submit" name="voltar" value="Voltar" />
          </form>
       
<%     }else{

%>
        Deu erro               
          <form action=="./CadastroMedico.jsp" method="post">
             <input type="submit" name="retry" value="Cadastrar Novamente" />
             </form> 
  
        
        <%          }
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

