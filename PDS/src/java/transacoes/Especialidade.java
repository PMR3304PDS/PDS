/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import data.*;
import java.util.Vector;
import utils.Transacao;

public class Especialidade {

//  public MunicipioDO buscar(int idobj) throws Exception {
//    Transacao tr = new Transacao();
//    try {
//      tr.beginReadOnly();
//      MunicipioDO m = (new MunicipioDATA()).buscar(idobj, tr);
//      tr.commit();
//      return m;
//    } catch (Exception e) {
//      tr.rollback();
//      System.out.println("erro ao buscar " + idobj);
//      e.printStackTrace();
//    }
//    return null;
//  }
  public Vector pesquisar() {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      EspecialidadeDATA cdata = new EspecialidadeDATA();
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
