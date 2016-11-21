/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.*;

/**
 *
 * @author Thiago
 */
public class Paciente {

  public boolean incluir(PacienteDO paciente) throws Exception {

    // validacao das regras de negocio
    if ((isEmpty(paciente.getPac_alergias())) || (isEmpty(paciente.getPac_medicamentos())) || (isEmpty(paciente.getPac_doencas_tratamento())) || (isEmpty(paciente.getPac_historico_doencas()))) {
      return false;
    }

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {

      tr.begin();
      PacienteDATA pacdata = new PacienteDATA();
      pacdata.incluir(paciente, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao incluir " + paciente.getPac_alergias());
      e.printStackTrace();
    }
    return false;
  } // incluir

  public boolean atualizar(PacienteDO paciente) throws Exception {
    Transacao tr = new Transacao();
    try {
      // inserir validacoes de regras de negocio
      tr.begin();
      PacienteDATA pacdata = new PacienteDATA();
      pacdata.atualizar(paciente, tr);
      tr.commit();
      return true;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao atualizar" + paciente.getPac_alergias());
      e.printStackTrace();
    }
    return false;
  } // atualizar

  public PacienteDO buscar(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      PacienteDATA pacdata = new PacienteDATA();
      PacienteDO p = pacdata.buscar(idobj, tr);
      tr.commit();
      return p;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao buscar " + idobj);
      e.printStackTrace();
    }
    return null;
  } // buscar

  private boolean isEmpty(String s) {
    if (null == s) {
      return true;
    }
    if (s.length() == 0) {
      return true;
    }
    return false;
  }

  public static void main(String[] args) {
    Paciente p = new Paciente();
    PacienteDO paciente = new PacienteDO();
    try {
      paciente = p.buscar(1);
      System.out.println(paciente.getPac_nascimento());
    } catch (Exception e) {
      e.printStackTrace();
    }
  } // main
} // Paciente

