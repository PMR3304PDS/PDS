/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.Vector;

/**
 *
 * @author Lucas
 */
public class Consulta {

  public boolean incluir(ConsultaDO consulta) throws Exception {
    if ((isEmpty(consulta.getCns_resumo()))) {
      return false;
    }

    Transacao tr = new Transacao();
    try {

      tr.begin();
      ConsultaDATA consultadata = new ConsultaDATA();
      consultadata.incluir(consulta, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao incluir ");
      e.printStackTrace();
    }
    return false;
  }

  public ConsultaDO busca_cns(int cns_cod) throws Exception {
    Transacao tr = new Transacao();

    try {
      tr.beginReadOnly();
      ConsultaDATA cdata = new ConsultaDATA();
      ConsultaDO cdo = new ConsultaDO();
      cdo = cdata.buscar(cns_cod, tr);
      return cdo;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar consulta");
      e.printStackTrace();
      return null;
    }
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

  public boolean atualizar(ConsultaDO consulta) throws Exception {
    if (isEmpty(consulta.getCns_resumo())) {
      return false;
    }

    Transacao tr = new Transacao();
    try {

      tr.begin();
      ConsultaDATA cdata = new ConsultaDATA();
      cdata.atualizar(consulta, tr);
      tr.commit();
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao atualizar consulta");
      e.printStackTrace();
      return false;
    }
    return true;
  }
  
    public Vector busca_paciente(int pac_cod) throws Exception {
    if (isEmpty(String.valueOf(pac_cod)))
          return null;
      
    Transacao tr = new Transacao();

    try {
      tr.beginReadOnly();
      ConsultaDATA cdata = new ConsultaDATA();
      Vector cdo = cdata.buscarPorPaciente(pac_cod, tr);
      return cdo;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar consulta");
      e.printStackTrace();
      return null;
    }
  }
  
}
