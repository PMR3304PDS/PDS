package transacoes;

import utils.*;
import data.*;
import java.util.*;

/**
 *
 * @author Renan
 */
public class Usuario {

  public boolean incluir(UsuarioDO usuario) throws Exception {

    // efetuando a transacao
    Transacao tr = new Transacao();
    try {

      tr.begin();
      UsuarioData cdata = new UsuarioData();
      cdata.incluir(usuario, tr);
      tr.commit();
      return true;

    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao incluir " + usuario.getUsu_nome());
      e.printStackTrace();
    }
    return false;
  } // incluir

  public UsuarioDO buscar(String user_name) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      UsuarioData cdata = new UsuarioData();
      UsuarioDO c = cdata.pesquisarPorLogin(user_name, tr);
      tr.commit();
      if (!c.isUsu_ativo()) {
        return null;
      }
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public UsuarioDO pesquisarPorRg2(String rg) throws Exception {
    if (isEmpty(rg)) {
      return null;
    }
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      UsuarioData cdata = new UsuarioData();
      UsuarioDO c = cdata.pesquisarPorRg2(rg, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error por rg!");
      e.printStackTrace();
    }
    return null;
  }

  public UsuarioDO pesquisarPorCpf2(String cpf) throws Exception {
    if (isEmpty(cpf)) {
      return null;
    }
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      UsuarioData cdata = new UsuarioData();
      UsuarioDO c = cdata.pesquisarPorCpf2(cpf, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error por cpf!");
      e.printStackTrace();
    }
    return null;
  }

  public UsuarioDO pesquisarPorId(int id) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      UsuarioData cdata = new UsuarioData();
      UsuarioDO c = cdata.pesquisarPorId(id, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

//    public Vector pesquisarPorNome(String nome) throws Exception {
//        if (isEmpty(nome)) {
//            return null;
//        }
//        
//        Transacao tr = new Transacao();
//        try {
//            tr.beginReadOnly();
//              UsuarioData cdata = new UsuarioData();
//              Vector v = cdata.pesquisarPorNome(nome, tr);
//            tr.commit();
//            return v;
//        } catch (Exception e) {
//            tr.rollback();
//            System.out.println("Error!");
//            e.printStackTrace();
//        }
//        return null;
//    }
//    public Vector pesquisarPorRg(String rg) throws Exception {
//        if (isEmpty(rg)) {
//            return null;
//        }
//        
//        Transacao tr = new Transacao();
//        try {
//            tr.beginReadOnly();
//              UsuarioData cdata = new UsuarioData();
//              Vector v = cdata.pesquisarPorRg(rg, tr);
//            tr.commit();
//            return v;
//        } catch (Exception e) {
//            tr.rollback();
//            System.out.println("Error!");
//            e.printStackTrace();
//        }
//        return null;
//    }
  public Vector pesquisarPorCpf(String cpf) throws Exception {
    if (isEmpty(cpf)) {
      return null;
    }

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      UsuarioData cdata = new UsuarioData();
      Vector v = cdata.pesquisarPorCpf(cpf, tr);
      tr.commit();
      return v;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public MedicoDO buscarMedico(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      MedicoDATA cdata = new MedicoDATA();
      MedicoDO c = cdata.buscar(idobj, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public PacienteDO buscarPaciente(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      PacienteDATA cdata = new PacienteDATA();
      PacienteDO c = cdata.buscar(idobj, tr);
      tr.commit();
      return c;
    } catch (Exception e) {
      tr.rollback();
      System.out.println("Error!");
      e.printStackTrace();
    }
    return null;
  }

  public TecnicoDO buscarTecnico(int idobj) throws Exception {
    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      TecnicoDATA cdata = new TecnicoDATA();
      TecnicoDO c = cdata.buscar(idobj, tr);
      tr.commit();
      return c;
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
      UsuarioData cdata = new UsuarioData();
      Vector v = cdata.pesquisarPorCpf(cpf, tr);
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
public boolean verificaPorLogin(String login) throws Exception {

    Transacao tr = new Transacao();
    try {
      tr.beginReadOnly();
      UsuarioData cdata = new UsuarioData();
      UsuarioDO v = cdata.pesquisarPorLogin(login, tr);
      tr.commit();
      if (v != null ) {
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

  public boolean mudar_senha(UsuarioDO usuario, String senha_antiga, String senha_nova) throws Exception {
    if ((senha_antiga == null) || (senha_nova == null)) {
      return false;
    }

    Transacao tr = new Transacao();

    try {
      tr.begin();
      UsuarioData udata = new UsuarioData();
      if (senha_antiga.equals(usuario.getUsu_senha())) {
        usuario.setUsu_senha(senha_nova);
        udata.atualizar(usuario, tr);
        tr.commit();
        return true;
      }
    } catch (Exception e) {
      tr.rollback();
      System.out.println("erro ao mudar a senha");
      e.printStackTrace();
    }
    return false;
  }

}
