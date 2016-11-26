/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.Transacao;

/**
 *
 * @author aluno
 */
public class FarmaceuticoDATA {

//  public void incluir(FarmaceuticoDO farmaceutico, Transacao tr) throws Exception {
//    Connection con = tr.obterConexao();
//    String sql = "insert into Farmaceutico (Conselhos_Con_cod, Estado_Est_cod_conselho_emissor) values (?, ?)";
//    PreparedStatement ps = con.prepareStatement(sql);
//    ps.setInt(1, farmaceutico.getConselhos_Con_cod());
//    ps.setInt(2, farmaceutico.getEstado_Est_cod_conselho_emissor());
//    int result = ps.executeUpdate();
//  }
//
////  public void excluir (FarmaceuticoDO farmaceutico, Transacao tr) throws Exception {
////  } // excluir 
//  public void atualizar(FarmaceuticoDO farmaceutico, Transacao tr) throws Exception {
//    Connection con = tr.obterConexao();
//    String sql = "update Farmaceutico set Conselhos_Con_cod=? Estado_Est_cod_conselho_emissor=? where Usu_cod=?";
//    PreparedStatement ps = con.prepareStatement(sql);
//    ps.setInt(1, farmaceutico.getConselhos_Con_cod());
//    ps.setInt(2, farmaceutico.getEstado_Est_cod_conselho_emissor());
//    ps.setInt(3, farmaceutico.getUsu_cod());
//    int result = ps.executeUpdate();
//  } // atualizar
  public FarmaceuticoDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select u.*, f.* from Usuario as u inner join Farmaceutico as f on u.Usu_cod = f.Usuario_Usu_cod where u.Usu_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      FarmaceuticoDO f = new FarmaceuticoDO();
      if (rs.getBoolean("Usu_ativo")) {
        f.setUsu_cod(rs.getInt("Usu_cod"));
        f.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
        f.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
        f.setUsu_nome(rs.getString("Usu_nome"));
        f.setUsu_login(rs.getString("Usu_login"));
        f.setUsu_rg(rs.getString("Usu_rg"));
        f.setUsu_cpf(rs.getString("Usu_cpf"));
        f.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        f.setUsu_foto(rs.getBinaryStream("Usu_foto"));
      }
      return f;
    }
    return null;
  } // buscar
}
