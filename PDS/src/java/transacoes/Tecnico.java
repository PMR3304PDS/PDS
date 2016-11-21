package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Tecnico {
  public TecnicoDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      TecnicoDO t = (new TecnicoDATA()).buscar(idobj, tr);
      tr.commit();
      return t;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar " + idobj);
      e.printStackTrace();
    }
    return null;
  } // buscar
} // Tecnico

