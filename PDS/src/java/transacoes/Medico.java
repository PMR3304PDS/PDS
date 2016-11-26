package transacoes;

import utils.*;
import data.*;
import java.util.*;

/**
 *
 * @author Caio
 */
public class Medico extends Usuario {
    
    public boolean incluirMed(MedicoDO medico) throws Exception {

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {

      tr.begin();
      MedicoDATA cdata = new MedicoDATA();
      cdata.incluir(medico, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      e.printStackTrace();
    }
    return false;
  } // incluir

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

  public MedicoDO pesquisarPorCrm2(String crm, int estado) throws Exception {
    if (isEmpty(crm)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      MedicoDO v = cdata.pesquisarPorCrm2(crm, estado, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public boolean verificaPorCrm(String crm) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      Vector v = cdata.pesquisarPorCrm3(crm, tr);
      tr.commit();
      if (v != null && v.size() > 0) {
        return true;
      }
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return false;
  }

    public Vector pesquisarPorCrm3(String crm) throws Exception {
     
        
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              MedicoDATA cdata = new MedicoDATA();
              Vector v = cdata.pesquisarPorCrm3(crm, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
    
  public Vector pesquisarMedicoPorNome(String nome) throws Exception {
    if (isEmpty(nome)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      Vector v = cdata.pesquisarMedicoPorNome(nome, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public Vector pesquisarMedicoPorRg(String rg) throws Exception {
    if (isEmpty(rg)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      Vector v = cdata.pesquisarMedicoPorRg(rg, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public Vector pesquisarMedicoPorCpf(String cpf) throws Exception {
    if (isEmpty(cpf)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      Vector v = cdata.pesquisarMedicoPorNome(cpf, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public boolean verificaPorCpf(String cpf) throws Exception {

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      Vector v = cdata.pesquisarMedicoPorCpf(cpf, tr);
      tr.commit();
      if (v != null && v.size() > 0) {
        return true;
      }
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return false;
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
