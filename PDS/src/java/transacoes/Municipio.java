package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Municipio {

  public boolean incluir(MunicipioDO municipio) throws Exception {

    // validacao das regras de negocio
    if ((isEmpty(municipio.getMun_nome()))) {
      return false;
    }

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {

      tr.begin();
      MunicipioDATA mdata = new MunicipioDATA();
      mdata.incluir(municipio, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao incluir " + municipio.getMun_nome());
      e.printStackTrace();
    }
    return false;
  } // incluir

  public boolean atualizar(MunicipioDO municipio) throws Exception {
    Transacao tr = new Transacao();
    try {
      // inserir validacoes de regras de negocio
      tr.begin();
      MunicipioDATA mdata = new MunicipioDATA();
      mdata.atualizar(municipio, tr);
      tr.commit();
      return true;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao atualizar" + municipio.getMun_nome());
      e.printStackTrace();
    }
    return false;
  } // atualizar

  public MunicipioDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MunicipioDO m = (new MunicipioDATA()).buscar(idobj, tr);
      tr.commit();
      return m;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar " + idobj);
      e.printStackTrace();
    }
    return null;
  }

  private boolean isEmpty(String s) {
    if (null == s) {
      return true;
    }
    if (s.length() == 0) {
      return true;
    }
    return false;
  }

}
