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

  private boolean isEmpty(String s) {
    if (null == s) {
      return true;
    }
    if (s.length() == 0) {
      return true;
    }
    return false;
  }

}
