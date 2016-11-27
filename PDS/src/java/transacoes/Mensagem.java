package transacoes;

import data.*;
import java.util.*;
import utils.*;

public class Mensagem {

  public boolean incluir(MensagemDO msg) throws Exception {
    if(msg == null || msg.getMsg_msg().length() == 0 || msg.getMsg_msg().length() > 500)
      return false;
    
    msg.setMsg_visualizado(false);
    
    Transacao tr = new Transacao();
    try {
      tr.begin();
      (new MensagemDATA()).incluir(msg, tr);
      tr.commit();
      return true;
    } catch (Exception e) {
      tr.rollback();
      e.printStackTrace();
    }
    return false;
  }

  public Vector pesquisarPorCodDoReceptorMaisRecente(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      Vector v = (new MensagemDATA()).pesquisarPorCodDoReceptorMaisRecente(cod, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }
  
  public Vector pesquisarPorCodDoEmissor(int cod_emi, int cod_rec) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      Vector v = (new MensagemDATA()).pesquisarPorCodDoEmissor(cod_emi, cod_rec, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public void marcarLido(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      (new MensagemDATA()).marcarLido(cod, tr);
      tr.commit();
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
  }
}