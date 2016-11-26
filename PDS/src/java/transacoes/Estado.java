package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Estado {

  public EstadoDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      EstadoDO e = (new EstadoDATA()).buscar(idobj, tr);
      tr.commit();
      return e;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar " + idobj);
      e.printStackTrace();
    }
    return null;
  }

  public Vector pesquisar() {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      EstadoDATA cdata = new EstadoDATA();
      Vector v = cdata.buscarTudo(tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      System.out.println("erro ao pesquisar ");
      e.printStackTrace();
    }
    return null;
  } // pesquisar

//  private boolean isEmpty(String s) {
//    if (null == s) {
//      return true;
//    }
//    if (s.length() == 0) {
//      return true;
//    }
//    return false;
//  }
}
