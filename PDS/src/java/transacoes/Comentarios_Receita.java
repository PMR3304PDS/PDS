package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Comentarios_Receita {

//  public boolean incluir (Comentarios_ReceitaDO comentario) throws Exception{
//
//     // validacao das regras de negocio
//     if ( (isEmpty(comentario.getComRec_comentario()))) {
//       return false;
//     }
//
//     // efetuando a transacao
//     Transacao tr = new Transacao();
//     try {
//
//       tr.begin();
//         Comentarios_ReceitaDATA cdata = new Comentarios_ReceitaDATA();
//         cdata.incluir(comentario, tr);
//       tr.commit();
//       return true;
//       
//     } catch(Exception e) {
//         tr.rollback();
//         System.out.println("erro ao incluir " + comentario.getComRec_comentario());
//         e.printStackTrace();
//     }
//     return false;
//  } // incluir
//  public boolean atualizar(Comentarios_ReceitaDO comentario) throws Exception {
//     Transacao tr = new Transacao();
//	 try{
//	   // inserir validacoes de regras de negocio
//	   tr.begin();
//  	     Comentarios_ReceitaDATA cdata = new Comentarios_ReceitaDATA();
//	     cdata.atualizar(comentario, tr);
//	   tr.commit();
//	   return true;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao atualizar" + comentario.getComRec_comentario());
//	   e.printStackTrace();
//	 }
//	 return false;
//  } // atualizar
//  public boolean remover(Comentarios_ReceitaDO comentario) throws Exception {
//     Transacao tr = new Transacao();
//	 try{
//	   // inserir validacoes de regras de negocio
//	   tr.begin();
//  	     Comentarios_ReceitaDATA cdata = new Comentarios_ReceitaDATA();
//	     cdata.excluir(comentario, tr);
//	   tr.commit();
//	   return true;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao remover" + comentario.getComRec_comentario());
//	   e.printStackTrace();
//	 }
//	 return false;
//  } // atualizar
//  public Comentarios_ReceitaDO buscar(int idobj) throws Exception{
//     Transacao tr = new Transacao();
//	 try{
//	   tr.beginReadOnly();
//  	     Comentarios_ReceitaDATA cdata = new Comentarios_ReceitaDATA();
//	     Comentarios_ReceitaDO c = cdata.buscar(idobj, tr);
//	   tr.commit();
//	   return c;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao buscar" + idobj);
//	   e.printStackTrace();
//	 }
//	 return null;
//  } // buscar
//  private boolean isEmpty(String s) {
//     if (null == s)
//       return true;
//     if (s.length() == 0)
//       return true;
//     return false;
//  }
//  public static void main(String[] args) {
//      Comentarios_Receita c = new Comentarios_Receita();
//      Comentarios_ReceitaDO comentario = new Comentarios_ReceitaDO();
//      try {
//	    comentario = c.buscar(6);
//		System.out.println(comentario.getComRec_comentario());
//      } catch(Exception e) {
//          e.printStackTrace();
//      }
//  } // main
}
