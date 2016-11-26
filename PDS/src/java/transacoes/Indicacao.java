package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Indicacao {

  public Vector pesquisarporCRM(int crm) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      IndicacaoDATA cdata = new IndicacaoDATA();
      Vector v = cdata.pesquisarporCRM(crm, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

//     private boolean isEmpty(String s) {
//        if (null == s)
//            return true;
//        if (s.length() == 0)
//            return true;
//        return false;
//    }
  public boolean incluir(IndicacaoDO indicacao) throws Exception {

    // validacao das regras de negocio
    if (indicacao == null) {
      return false;
    }

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {
      tr.begin();
      IndicacaoDATA idata = new IndicacaoDATA();
      idata.incluir(indicacao, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao incluir ");
      e.printStackTrace();
    }
    return false;
  } // incluir 

}
