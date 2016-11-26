package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Comentarios_Exame {

//  public boolean incluir (Comentarios_ExameDO comentario) throws Exception{
//
//     // validacao das regras de negocio
//     if ( (isEmpty(comentario.getComExa_comentario()))) {
//       return false;
//     }
//
//     // efetuando a transacao
//     Transacao tr = new Transacao();
//     try {
//
//       tr.begin();
//         Comentarios_ExameDATA cdata = new Comentarios_ExameDATA();
//         cdata.incluir(comentario, tr);
//       tr.commit();
//       return true;
//       
//     } catch(Exception e) {
//         tr.rollback();
//         System.out.println("erro ao incluir " + comentario.getComExa_comentario());
//         e.printStackTrace();
//     }
//     return false;
//  } // incluir
//  public boolean atualizar(Comentarios_ExameDO comentario) throws Exception {
//     Transacao tr = new Transacao();
//	 try{
//	   // inserir validacoes de regras de negocio
//	   tr.begin();
//  	     Comentarios_ExameDATA cdata = new Comentarios_ExameDATA();
//	     cdata.atualizar(comentario, tr);
//	   tr.commit();
//	   return true;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao atualizar");
//	   e.printStackTrace();
//	 }
//	 return false;
//  } // atualizar
//  public boolean remover(Comentarios_ExameDO comentario) throws Exception {
//     Transacao tr = new Transacao();
//	 try{
//	   // inserir validacoes de regras de negocio
//	   tr.begin();
//  	     Comentarios_ExameDATA cdata = new Comentarios_ExameDATA();
//	     cdata.excluir(comentario, tr);
//	   tr.commit();
//	   return true;
//	 } catch (Exception e) {
//	   tr.rollback();
//	   System.out.println("erro ao remover");
//	   e.printStackTrace();
//	 }
//	 return false;
//  } // atualizar
//  public Comentarios_ExameDO buscar(int idobj) throws Exception{
//     Transacao tr = new Transacao();
//	 try{
//	   tr.beginReadOnly();
//  	     Comentarios_ExameDATA cdata = new Comentarios_ExameDATA();
//	     Comentarios_ExameDO c = cdata.buscar(idobj, tr);
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
//      Comentarios_Exame c = new Comentarios_Exame();
//      Comentarios_ExameDO comentario = new Comentarios_ExameDO();
//      try {
//	    comentario = c.buscar(6);
//		System.out.println(comentario.getComExa_comentario());
//      } catch(Exception e) {
//          e.printStackTrace();
//      }
//  } // main
}
