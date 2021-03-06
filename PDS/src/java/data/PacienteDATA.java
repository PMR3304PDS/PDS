package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class PacienteDATA {

  public void incluir(PacienteDO paciente, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "insert into Paciente (Usuario_Usu_cod, Pac_nascimento, Pac_peso, Pac_altura, "
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
    rs.next();
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
        
        return p;
     }
    else{
        return null;
    }
  }
    
    public PacienteDO buscar2(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select u.*, p.* from Usuario as u inner join Paciente as p on u.Usu_cod = p.Usuario_Usu_cod where u.Usu_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    rs.next();
    PacienteDO p = new PacienteDO();
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
        return p;    
        
  } // buscar

  public Vector pesquisarPacientePorNome(String nome, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * "
            + "from Usuario inner join Paciente "
            + "on Usuario.Usu_cod = Paciente.Usuario_Usu_Cod "
            + "where Usu_nome like ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, "%" + nome + "%");
    ResultSet rs = ps.executeQuery();
    Vector pacientes = new Vector();
    while (rs.next()) {
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
        pacientes.add(p);
      }
    }
    return pacientes;
  }

  public Vector pesquisarPacientePorRg(String rg, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * "
            + "from Usuario inner join Paciente "
            + "on Usuario.Usu_cod = Paciente.Usuario_Usu_Cod "
            + "where Usu_rg like ? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, rg);
    ResultSet rs = ps.executeQuery();
    Vector pacientes = new Vector();
    while (rs.next()) {
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
        pacientes.add(p);
      }
    }
    return pacientes;
  }

  public Vector pesquisarPacientePorCpf(String cpf, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * "
            + "from Usuario inner join Paciente "
            + "on Usuario.Usu_cod = Paciente.Usuario_Usu_Cod "
            + "where Usu_cpf like ? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, cpf);
    ResultSet rs = ps.executeQuery();
    Vector pacientes = new Vector();
    while (rs.next()) {
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
        pacientes.add(p);
      }
    }
    return pacientes;
  }
  
  public Vector pesquisarPacientePorLogin(String login, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * "
            + "from Usuario inner join Paciente "
            + "on Usuario.Usu_cod = Paciente.Usuario_Usu_Cod "
            + "where Usu_login like ? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, login);
    ResultSet rs = ps.executeQuery();
    Vector pacientes = new Vector();
    while (rs.next()) {
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
        pacientes.add(p);
      }
    }
    return pacientes;
  }

}
