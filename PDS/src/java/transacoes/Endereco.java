package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Endereco {
    
    public boolean incluir (EnderecoDO endereco) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(endereco.getEnd_rua()))) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         EnderecoDATA edata = new EnderecoDATA();
         edata.incluir(endereco, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + endereco.getEnd_rua());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(EnderecoDO endereco) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     EnderecoDATA edata = new EnderecoDATA();
	     edata.atualizar(endereco, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + endereco.getEnd_rua());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
    
    private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
}