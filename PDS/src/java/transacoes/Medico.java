
package transacoes;

import utils.*;
import data.*;
import java.util.*;

/**
 *
 * @author Caio
 */
public class Medico extends Usuario {
    
    public Vector pesquisarPorCrm(String crm) throws Exception {
        if (isEmpty(crm)) {
            return null;
        }
        
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              MedicoDATA cdata = new MedicoDATA();
              Vector v = cdata.pesquisarPorCrm(crm, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
    
    private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }
        
  public MedicoDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDO t = (new MedicoDATA()).buscar(idobj, tr);
      tr.commit();
      return t;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar " + idobj);
      e.printStackTrace();
    }
    return null;
  }
}
