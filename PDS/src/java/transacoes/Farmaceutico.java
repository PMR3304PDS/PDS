package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Farmaceutico extends Usuario {

  public FarmaceuticoDO buscar(int cod) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      FarmaceuticoDO f = (new FarmaceuticoDATA()).buscar(cod, tr);
      tr.commit();
      if(f.isUsu_ativo())
        return f;
      else
        return null;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar" + cod);
      e.printStackTrace();
    }
    return null;
  }
}
