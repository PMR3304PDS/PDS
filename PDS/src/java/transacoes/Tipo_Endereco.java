package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Tipo_Endereco {

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
  
   public int buscarPorNome(String nome) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      Tipo_EnderecoDO t = (new Tipo_EnderecoData()).buscarPorNome(nome, tr);
      tr.commit();
      return t.getTipEnd_cod();
    } catch (Exception e) {
      tr.rollback();
      e.printStackTrace();
    }
    return 0;
  }
  
}
