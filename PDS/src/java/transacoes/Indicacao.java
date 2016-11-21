
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
     
     private boolean isEmpty(String s) {
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }
    
}
