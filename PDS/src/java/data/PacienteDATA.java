package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class PacienteDATA {

  public void incluir(PacienteDO paciente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Paciente (Pac_nascimento, Pac_peso, Pac_altura, "
     + "Pac_alergias,Pac_medicamentos,Pac_doencas_tratamento) values (?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setDate(1, paciente.getPac_nascimento());
     ps.setFloat(2, paciente.getPac_peso());
     ps.setFloat(3, paciente.getPac_altura());
     ps.setString(4, paciente.getPac_alergias());
     ps.setString(5, paciente.getPac_medicamentos());
     ps.setString(6, paciente.getPac_doencas_tratamento());
     int result = ps.executeUpdate();
  }

//  public void excluir (PacienteDO paciente, Transacao tr) throws Exception {
//  } // excluir 

  public void atualizar(PacienteDO paciente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Paciente set Pac_nascimento=? Pac_peso=? Pac_altura=? "
             + "Pac_alergias=? Pac_medicamentos=? Pac_doencas_tratamento=? where Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setDate(1, paciente.getPac_nascimento());
     ps.setFloat(2, paciente.getPac_peso());
     ps.setFloat(3, paciente.getPac_altura());
     ps.setString(4, paciente.getPac_alergias());
     ps.setString(5, paciente.getPac_medicamentos());
     ps.setString(6, paciente.getPac_doencas_tratamento());
     ps.setInt(7, paciente.getUsu_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public PacienteDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Paciente where  Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     PacienteDO paciente = new PacienteDO();
     paciente.setUsu_cod(rs.getInt("Usuario_Usu_cod"));
     paciente.setPac_nascimento(rs.getDate("Pac_nascimento"));
     paciente.setPac_peso(rs.getFloat("Pac_peso"));
     paciente.setPac_altura(rs.getFloat("Pac_altura"));
     paciente.setPac_alergias(rs.getString("Pac_alergias"));
     paciente.setPac_medicamentos(rs.getString("Pac_medicamentos"));
     paciente.setPac_doencas_tratamento(rs.getString("Pac_doencas_tratamento"));
     return paciente;
  } // buscar

}

