package transacoes;

import java.util.Vector;
import utils.Transacao;
import data.*;

/**
 *
 * @author aluno
 */
public class Conselhos {

  public Vector pesquisar() {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      ConselhosDATA cdata = new ConselhosDATA();
      Vector v = cdata.buscarTudo(tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      System.out.println("erro ao pesquisar ");
      e.printStackTrace();
    }
    return null;
  } // pesquisar
  
  public ConselhosDO buscar(int idobj) {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      ConselhosDO c = (new ConselhosDATA()).buscar(idobj, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      System.out.println("erro ao pesquisar ");
      e.printStackTrace();
    }
    return null;
  }

//    private boolean isEmpty(String s) {
//        if (null == s) {
//            return true;
//        }
//        if (s.length() == 0) {
//            return true;
//        }
//        return false;
//    }
}
