package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class PacienteDATA {

  public void incluir(PacienteDO paciente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Paciente (Usu_cod, Pac_nascimento, Pac_peso, Pac_altura, "
     + "Pac_alergias,Pac_medicamentos,Pac_doencas_tratamento, Pac_historico_doencas) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, paciente.getUsu_cod());
     ps.setDate(2, paciente.getPac_nascimento());
     ps.setFloat(3, paciente.getPac_peso());
     ps.setFloat(4, paciente.getPac_altura());
     ps.setString(5, paciente.getPac_alergias());
     ps.setString(6, paciente.getPac_medicamentos());
     ps.setString(7, paciente.getPac_doencas_tratamento());
     ps.setString(8, paciente.getPac_historico_doencas());
     int result = ps.executeUpdate();
  }

//  public void excluir (PacienteDO paciente, Transacao tr) throws Exception {
//  } // excluir 

  public void atualizar(PacienteDO paciente, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Paciente set Pac_nascimento=?, Pac_peso=?, Pac_altura=?, "
             + "Pac_alergias=?, Pac_medicamentos=?, Pac_doencas_tratamento=?, Pac_historico_doencas=?"
             + " where Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setDate(1, paciente.getPac_nascimento());
     ps.setFloat(2, paciente.getPac_peso());
     ps.setFloat(3, paciente.getPac_altura());
     ps.setString(4, paciente.getPac_alergias());
     ps.setString(5, paciente.getPac_medicamentos());
     ps.setString(6, paciente.getPac_doencas_tratamento());
     ps.setString(7, paciente.getPac_historico_doencas());
     ps.setInt(8, paciente.getUsu_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public PacienteDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select u.*, p.* from Usuario as u inner join Paciente as p on u.Usu_cod = p.Usuario_Usu_cod where u.Usu_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      PacienteDO p = new PacienteDO();
      if (rs.getBoolean("Usu_ativo")) {
        p.setUsu_cod(rs.getInt("Usu_cod"));
        p.setUsu_login(rs.getString("Usu_login"));
        p.setUsu_rg(rs.getString("Usu_rg"));
        p.setUsu_cpf(rs.getString("Usu_cpf"));
        p.setUsu_nome(rs.getString("Usu_nome"));
        p.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        p.setUsu_foto(rs.getBinaryStream("Usu_foto"));
        p.setPac_nascimento(rs.getDate("Pac_nascimento"));
        p.setPac_peso(rs.getFloat("Pac_peso"));
        p.setPac_altura(rs.getFloat("Pac_altura"));
        p.setPac_alergias(rs.getString("Pac_alergias"));
        p.setPac_medicamentos(rs.getString("Pac_medicamentos"));
        p.setPac_doencas_tratamento(rs.getString("Pac_doencas_tratamento"));
        p.setPac_historico_doencas(rs.getString("Pac_historico_doencas"));
      }
      return p;
    }
    return null;
  } // buscar

}

