/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import data.*;
import utils.*;

/**
 *
 * @author owner
 */
public class Medico_has_Especialidade {

  public boolean incluir(Medico_has_EspecialidadeDO MHE) throws Exception {

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {

      tr.begin();
      Medico_has_EspecialidadeDATA cdata = new Medico_has_EspecialidadeDATA();
      cdata.incluir(MHE, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      e.printStackTrace();
    }
    return false;
  }
}
