package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Exame {
    
    public boolean incluir (ExameDO exame) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(exame.getExa_resumo()))) {
       return false;
     }
     

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         ExameDATA examedata = new ExameDATA();
         examedata.incluir(exame, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(ExameDO exame) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ExameDATA examedata = new ExameDATA();
	     examedata.atualizar(exame, tr);
	   tr.commit();
	   return true;
	 } catch (Exception e) {
	   tr.rollback();
	   System.out.println("erro ao atualizar");
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
    
public Vector pesquisar(String nome) {
     if ( isEmpty(nome) )
        return null;

     Transacao tr = new Transacao();
     try {
	    tr.beginReadOnly();
            ExameDATA examedata = new ExameDATA();
            //Vector v = examedata.buscar(, tr);
            tr.commit();
            //return v;
     } catch(Exception e) {
            System.out.println("erro ao pesquisar " + nome);
            e.printStackTrace();
     }
     return null;
  } // pesquisar
}