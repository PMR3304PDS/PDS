package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Exame {

//    public boolean incluir (ExameDO exame) throws Exception{
//
//     // validacao das regras de negocio
//     if ( (isEmpty(exame.getExa_resumo()))) {
//       return false;
//     }
//     
//
//     // efetuando a transacao
//     Transacao tr = new Transacao();
//     try {
//
//       tr.begin();
//         ExameDATA examedata = new ExameDATA();
//         examedata.incluir(exame, tr);
//       tr.commit();
//       return true;
//       
//     } catch(Exception e) {
//         tr.rollback();
//         System.out.println("erro ao incluir ");
//         e.printStackTrace();
//     }
//     return false;
//  } // incluir
//  public boolean atualizar(ExameDO exame) throws Exception {
//     Transacao tr = new Transacao();
//	 try{
//	   // inserir validacoes de regras de negocio
//	   tr.begin();
//  	     ExameDATA examedata = new ExameDATA();
//	     examedata.atualizar(exame, tr);
//	   tr.commit();
//	   return true;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao atualizar");
//	   e.printStackTrace();
//	 }
//	 return false;
//  } // atualizar
//    private boolean isEmpty(String s) {
//     if (null == s)
//       return true;
//     if (s.length() == 0)
//       return true;
//     return false;
//        
//  }
  public ExameDO buscar(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      ExameDO c = (new ExameDATA()).buscar(cod, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar" + cod);
      e.printStackTrace();
    }
    return null;
  }

  public Vector pesquisarPorCod(int cod) throws Exception {

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      ExameDATA edata = new ExameDATA();
      Vector v = edata.pesquisarPorCod(cod, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Erro ao procurar pelo código do paciente");
      e.printStackTrace();
    }
    return null;
  }

  public boolean excluir(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.begin();
      ExameDATA edata = new ExameDATA();
      ExameDO edo = edata.buscar(cod, tr);
      edata.excluir(edo, tr);
      tr.commit();
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
      return false;
    }
    return true;
  }

}
