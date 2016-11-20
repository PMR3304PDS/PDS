package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MedicoDATA {

  public void incluir(MedicoDO medico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Medico (Conselhos_Con_cod, Estado_Est_cod_conselho_emissor, Med_NumRegistro) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, medico.getConselhos_Con_cond());
     ps.setInt(2, medico.getEstado_Est_cod_conselho_emissor());
     ps.setString(3, medico.getMed_NumRegistro());
     int result = ps.executeUpdate();
  }


  public void atualizar(MedicoDO medico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Medico set Estado_Est_cod_conselho_emissor=?, Med_NumRegistro=? where Conselhos_Con_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, medico.getEstado_Est_cod_conselho_emissor());
     ps.setString(2, medico.getMed_NumRegistro());
     ps.setInt(3, medico.getConselhos_Con_cond());
     int result = ps.executeUpdate();
  } // atualizar
  
  public MedicoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Medico where Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     MedicoDO medico = new MedicoDO();
     medico.setConselhos_Con_cond(rs.getInt("Conselhos_Con_cod"));
     medico.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
     medico.setMed_NumRegistro(rs.getString("Med_NumRegistro"));
     return medico;
  } // buscar
  
  public Vector pesquisarPorCrm(String crm, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Medico where Med_NumRegistro=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, crm);
     ResultSet rs = ps.executeQuery();
     Vector medicos = new Vector();
     while (rs.next()) {
        MedicoDO c = new MedicoDO();
        c.setUsu_cod(rs.getInt("Usu_cod"));
        c.setUsu_nome(rs.getString("Usu_nome"));
        System.out.println(" got " + c.getUsu_nome());
        c.setUsu_login(rs.getString("Usu_login"));
        c.setUsu_senha(rs.getString("Usu_senha"));
        c.setUsu_rg(rs.getString("Usu_rg"));
        c.setUsu_cpf(rs.getString("Usu_cpf"));
        c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
        c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        c.setConselhos_Con_cond(rs.getInt("Conselhos_Con_cod"));
        c.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
        c.setMed_NumRegistro(rs.getString("Med_NumRegistro"));
        
        medicos.add(c);
     }
     return medicos;
  }

} // MedicoDATA
