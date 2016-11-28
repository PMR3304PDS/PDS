package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.sql.Date;

public class EnderecoDATA {

  public void incluir(EnderecoDO endereco, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "insert into Endereco (End_rua, End_num, End_bairro, Usuario_Usu_cod, Municipio_Mun_cod, Tipo_Endereco_TipEnd_cod) values (?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, endereco.getEnd_rua());
    ps.setInt(2, endereco.getEnd_num());
    ps.setString(3, endereco.getEnd_bairro());
    ps.setInt(4, endereco.getUsuario_Usu_cod());
    ps.setInt(5, endereco.getMunicipio_Mun_cod());
    ps.setInt(6, endereco.getTipo_Endereco_TipEnd_cod());
    int result = ps.executeUpdate();
  }

public void atualizar(EnderecoDO endereco, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update Endereco set End_rua=?, End_num=?, End_bairro=?, Usuario_Usu_cod=?, Municipio_Mun_cod=?, Tipo_Endereco_TipEnd_cod=?  where End_cod=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, endereco.getEnd_rua());
    ps.setInt(2, endereco.getEnd_num());
    ps.setString(3, endereco.getEnd_bairro());
    ps.setInt(4, endereco.getUsuario_Usu_cod());
    ps.setInt(5, endereco.getMunicipio_Mun_cod());
    ps.setInt(6, endereco.getTipo_Endereco_TipEnd_cod());
    ps.setInt(7, endereco.getEnd_cod());
    int result = ps.executeUpdate();
} // atualizar

public void atualizarDados(EnderecoDO endereco, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update Endereco set End_rua=?, End_num=?, End_bairro=?, Municipio_Mun_cod=?, Tipo_Endereco_TipEnd_cod=?  where End_cod=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, endereco.getEnd_rua());
    ps.setInt(2, endereco.getEnd_num());
    ps.setString(3, endereco.getEnd_bairro());
    ps.setInt(4, endereco.getMunicipio_Mun_cod());
    ps.setInt(5, endereco.getTipo_Endereco_TipEnd_cod());
    ps.setInt(6, endereco.getEnd_cod());
    int result = ps.executeUpdate();
} // atualizar

public void excluir(EnderecoDO endereco, Transacao tr) throws Exception {
     excluir(endereco.getEnd_cod(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Endereco where End_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
  } // excluir
//
//  public EnderecoDO buscar(int idobj, Transacao tr) throws Exception {
//    Connection con = tr.obterConexao();
//    String sql = "select * from Endereco where End_cod=?";
//    PreparedStatement ps = con.prepareStatement(sql);
//    ps.setInt(1, idobj);
//    ResultSet rs = ps.executeQuery();
//    rs.next();
//    EnderecoDO endereco = new EnderecoDO();
//    endereco.setEnd_cod(rs.getInt("End_cod"));
//    endereco.setEnd_rua(rs.getString("End_rua"));
//    endereco.setEnd_num(rs.getInt("End_num"));
//    endereco.setEnd_bairro(rs.getString("End_bairro"));
//    endereco.setUsuario_Usu_cod(rs.getInt("Usuario_Usu_cod"));
//    endereco.setMunicipio_Mun_cod(rs.getInt("Municipio_Mun_cod"));
//    endereco.setTipo_Endereco_TipEnd_cod(rs.getInt("Tipo_Endereco_TipEnd_cod"));
//    return endereco;
//  }
  public Vector pesquisarPorCodDaPessoa(int cod, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from Endereco where Usuario_Usu_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod);
    ResultSet rs = ps.executeQuery();
    Vector end = new Vector();
    while (rs.next()) {
      EnderecoDO e = new EnderecoDO();
      e.setEnd_cod(rs.getInt("End_cod"));
      e.setEnd_rua(rs.getString("End_rua"));
      e.setEnd_num(rs.getInt("End_num"));
      e.setEnd_bairro(rs.getString("End_bairro"));
      e.setUsuario_Usu_cod(rs.getInt("Usuario_Usu_cod"));
      e.setMunicipio_Mun_cod(rs.getInt("Municipio_Mun_cod"));
      e.setTipo_Endereco_TipEnd_cod(rs.getInt("Tipo_Endereco_TipEnd_cod"));
      end.add(e);
    }
    return end;
  }

}
