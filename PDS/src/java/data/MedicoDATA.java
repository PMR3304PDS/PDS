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

} // MedicoDATA
