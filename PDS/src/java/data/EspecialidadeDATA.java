package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class EspecialidadeDATA {

//  public void incluir(EspecialidadeDO contato, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "insert into Especialidade ( Esp_nome) values ( ?)";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setString(1, contato.getEsp_nome());
//     int result = ps.executeUpdate();
//  }
//
//
//  public void atualizar(EspecialidadeDO especialidade, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "update Especialidade set Esp_nome=? where Esp_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setString(1, especialidade.getEsp_nome());
//     ps.setInt(2, especialidade.getEsp_cod());
//     int result = ps.executeUpdate();
//  } // atualizar
//
//  public EspecialidadeDO buscar(int idobj, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "select * from Especialidade where Esp_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setInt(1, idobj);
//     ResultSet rs = ps.executeQuery();
//     rs.next();
//     EspecialidadeDO contato = new EspecialidadeDO();
//     contato.setEsp_cod (rs.getInt("Esp_cod"));
//     contato.setEsp_nome (rs.getString("Esp_nome"));
//     return contato;
//  } // buscar
  public Vector buscarTudo(Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from Especialidade ";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    Vector Vec_con = new Vector();

    while (rs.next()) {
      EspecialidadeDO contato = new EspecialidadeDO();
      contato.setEsp_cod(rs.getInt("Esp_cod"));
      contato.setEsp_nome(rs.getString("Esp_nome"));
      Vec_con.add(contato);
    }
    return Vec_con;
  }
  
   public Vector pesquisarEspecialidadesdoMedico(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Especialidade inner join Medico_has_especialidade "
             + "on Especialidade.Esp_cod = Medico_has_especialidade.Especialidade_Esp_cod "
             + "where Medico_Usuario_Usu_cod like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     Vector resultados = new Vector();
     while (rs.next()) {
        EspecialidadeDO e = new EspecialidadeDO();
        e.setEsp_cod (rs.getInt("Esp_cod"));
        e.setEsp_nome (rs.getString("Esp_nome"));
        resultados.add(e);
     }
     return resultados;
  }

}
