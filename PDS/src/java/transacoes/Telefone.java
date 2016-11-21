
package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Telefone {
    
    public boolean incluir (TelefoneDO telefone) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(Integer.toString(telefone.getTel_numero())))) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         TelefoneData tdata = new TelefoneData();
         tdata.incluir(telefone, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + telefone.getTel_numero());
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(TelefoneDO telefone) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     TelefoneData tdata = new TelefoneData();
	     tdata.atualizar(telefone, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar" + telefone.getTel_numero());
	   e.printStackTrace();
	 }
	 return false;
  } // atualizar
  
  public Vector pesquisar(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      Vector v = (new TelefoneData()).pesquisarPorCod(cod, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao pesquisar " + Integer.toString(cod));
      e.printStackTrace();
    }
    return null;
  }
    
    private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
}
