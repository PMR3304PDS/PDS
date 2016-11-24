package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Receita {
    
    public boolean incluir (ReceitaDO receita) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(receita.getRec_resumo()))) {
       return false;
     }
     

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         ReceitaDATA receitadata = new ReceitaDATA();
         receitadata.incluir(receita, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir ");
         e.printStackTrace();
     }
     return false;
  } // incluir

  public boolean atualizar(ReceitaDO receita) throws Exception {
     Transacao tr = new Transacao();
	 try{
	   // inserir validacoes de regras de negocio
	   tr.begin();
  	     ReceitaDATA receitadata = new ReceitaDATA();
	     receitadata.atualizar(receita, tr);
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


  public ReceitaDO buscar(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      ReceitaDO c = (new ReceitaDATA()).buscar(cod, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar" + cod);
      e.printStackTrace();
    }
    return null;
  }
  //Adquirir dados para a lista de receitas para pag ListaReceitas.jsp
  public Vector getListaReceitas(int cod) throws Exception {

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              ReceitaDATA cdata = new ReceitaDATA();
              Vector v = cdata.GetListaReceitas(cod, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
  
    public boolean excluir(int cod) throws Exception
    {
        Transacao tr = new Transacao();
        try
        {
            tr.begin();
            ReceitaDATA rdata = new ReceitaDATA();
            ReceitaDO rdo = rdata.buscar(cod, tr);
            rdata.excluir(rdo,tr);
            tr.commit();
        }
        catch (Exception e)
        {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
            return false;
        }
        return true;
    }
}