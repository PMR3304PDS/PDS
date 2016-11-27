package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Tipo_Exame {

    /*
  public Tipo_EnderecoDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      Tipo_EnderecoDO t = (new Tipo_EnderecoData()).buscar(idobj, tr);
      tr.commit();
      return t;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar " + idobj);
      e.printStackTrace();
    }
    return null;
  }
*/
    
  public Tipo_ExameDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
        Tipo_ExameData tp = new Tipo_ExameData();
        Tipo_ExameDO t = tp.buscar(idobj, tr);
      tr.commit();
      return t;
    } catch (Exception e) {
      tr.rollback();
      e.printStackTrace();
    }
    return null;
  }

}