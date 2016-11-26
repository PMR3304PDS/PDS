package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Municipio {
    
    public MunicipioDO pesquisarPorEstado(int cod_est) throws Exception {
        if (isEmpty(Integer.toString(cod_est))) {
            return null;
        }
        
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              MunicipioDATA cdata = new MunicipioDATA();
              MunicipioDO v = cdata.pesquisarPorEstado(cod_est, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
    
    public Vector pesquisarporEstado2(int cod_est) throws Exception {
        if (isEmpty(Integer.toString(cod_est))) {
            return null;
        }
        
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              MunicipioDATA cdata = new MunicipioDATA();
              Vector v = cdata.pesquisarPorEstado2(cod_est, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
    
  

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

   public Vector pesquisar() {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            MunicipioDATA cdata = new MunicipioDATA();
            Vector v = cdata.buscarTudo(tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            System.out.println("erro ao pesquisar ");
            e.printStackTrace();
        }
        return null;
    } // pesquisar
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
