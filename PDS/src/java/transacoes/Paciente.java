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
    if (isEmpty(paciente.getUsu_login())) {
      return false;
    }

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {

      tr.begin();

      UsuarioData usudata = new UsuarioData();
      UsuarioDO usudo = new UsuarioDO();
      usudo.setUsu_cpf(paciente.getUsu_cpf());
      usudo.setUsu_foto(null);
      usudo.setUsu_nome(paciente.getUsu_nome());
      usudo.setUsu_login(paciente.getUsu_login());
      usudo.setUsu_rg(paciente.getUsu_rg());
      usudo.setUsu_senha(paciente.getUsu_senha());
      usudo.setUsu_ativo(true);
      usudata.incluir(usudo, tr);

      UsuarioDO newusudo = usudata.pesquisarPorLogin(usudo.getUsu_login(), tr);

      PacienteDATA pacdata = new PacienteDATA();
      paciente.setUsu_cod(newusudo.getUsu_cod());
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

  public Vector pesquisarPacientePorNome(String nome) throws Exception {
    if (isEmpty(nome)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      PacienteDATA paciente = new PacienteDATA();
      Vector v = paciente.pesquisarPacientePorNome(nome, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Erro ao buscar paciente por nome");
      e.printStackTrace();
    }
    return null;
  }

  public Vector pesquisarPacientePorRg(String rg) throws Exception {
    if (isEmpty(rg)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      PacienteDATA paciente = new PacienteDATA();
      Vector v = paciente.pesquisarPacientePorRg(rg, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Erro ao buscar paciente por RG");
      e.printStackTrace();
    }
    return null;
  }

  public Vector pesquisarPacientePorCpf(String cpf) throws Exception {
    if (isEmpty(cpf)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      PacienteDATA paciente = new PacienteDATA();
      Vector v = paciente.pesquisarPacientePorCpf(cpf, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Erro ao buscar paciente por CPF");
      e.printStackTrace();
    }
    return null;
  }
  
  public Vector pesquisarPacientePorLogin(String login) throws Exception {
    if (isEmpty(login)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      PacienteDATA paciente = new PacienteDATA();
      Vector v = paciente.pesquisarPacientePorCpf(login, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Erro ao buscar paciente por Login");
      e.printStackTrace();
    }
    return null;
  }

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
      if(p.isUsu_ativo())
        return p;
      else
        return null;
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

//  public static void main(String[] args) {
//    Paciente p = new Paciente();
//    PacienteDO paciente = new PacienteDO();
//    try {
//      paciente = p.buscar(1);
//      System.out.println(paciente.getPac_nascimento());
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//  } // main
}
