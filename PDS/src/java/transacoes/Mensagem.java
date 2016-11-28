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

  public Vector pesquisarPorCodDoReceptorMaisRecente(int cod_rec) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      Vector vr = (new MensagemDATA()).pesquisarPorCodDoReceptorMaisRecente(cod_rec, tr);
      Vector ve = (new MensagemDATA()).pesquisarPorCodDoEmissorMaisRecente(cod_rec, tr);
      Vector v = new Vector();
      Vector merge = new Vector();
      merge.addAll(vr);
      merge.addAll(ve);
      MensagemDO m1 = null;
      boolean add = true;
      for(int i = 0; i < merge.size(); i++)
      {
        add = true;
        m1 = (MensagemDO)merge.elementAt(i);
        for(int j = i+1; j < merge.size(); j++)
        {
          if(((MensagemDO)merge.elementAt(j)).getUsuario_emissor() == m1.getUsuario_receptor() && ((MensagemDO)merge.elementAt(j)).getUsuario_receptor()== m1.getUsuario_emissor())
            if(m1.getMsg_cod() < ((MensagemDO)merge.elementAt(j)).getMsg_cod())
              m1 = (MensagemDO)merge.elementAt(j);
        }
        for(int k = 0; k < v.size(); k++)
        {
          if((((MensagemDO)v.elementAt(k)).getUsuario_emissor() == m1.getUsuario_emissor() && ((MensagemDO)v.elementAt(k)).getUsuario_receptor()== m1.getUsuario_receptor()) ||
             (((MensagemDO)v.elementAt(k)).getUsuario_receptor()== m1.getUsuario_emissor() && ((MensagemDO)v.elementAt(k)).getUsuario_emissor() == m1.getUsuario_receptor()))
            add = false;
        }
        if(add)
          v.add(m1);
      }
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
