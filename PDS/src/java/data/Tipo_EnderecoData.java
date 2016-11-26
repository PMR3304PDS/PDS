
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class Tipo_EnderecoData {
     public void incluir(Tipo_EnderecoDO tipo_endereco, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Tipo_Endereco (TipEnd_tipo) values (?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tipo_endereco.getTipEnd_tipo());

     int result = ps.executeUpdate();
  }

//  public void excluir(Tipo_EnderecoDO tipo_endereco, Transacao tr) throws Exception {
//  } // excluir

  public void atualizar(Tipo_EnderecoDO tipo_endereco, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Tipo_Endereco set TipEnd_tipo=? where TipEnd_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tipo_endereco.getTipEnd_tipo());
	 ps.setInt(2, tipo_endereco.getTipEnd_cod());
     int result = ps.executeUpdate();
  } // atualizar
  public  Tipo_EnderecoDO buscarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Tipo_Endereco where  TipEnd_tipo=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Tipo_EnderecoDO tipo_endereco = new Tipo_EnderecoDO();
     tipo_endereco.setTipEnd_cod(rs.getInt("TipEnd_cod"));
     tipo_endereco.setTipEnd_tipo(rs.getString("TipEnd_tipo"));
     
     return tipo_endereco;
  } // buscar por nome
  public Tipo_EnderecoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Tipo_Endereco where  TipEnd_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Tipo_EnderecoDO tipo_endereco = new Tipo_EnderecoDO();
     tipo_endereco.setTipEnd_cod(rs.getInt("TipEnd_cod"));
     tipo_endereco.setTipEnd_tipo(rs.getString("TipEnd_tipo"));
     
     return tipo_endereco;
  } // buscar

}
