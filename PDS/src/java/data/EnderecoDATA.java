package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.sql.Date;

public class EnderecoDATA {

  public void incluir(EnderecoDO endereco, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Endereco (End_cod, End_rua, End_num, End_bairro, Usuario_Usu_cod, Municipio_Mun_cod, Tipo_Endereco_TipEnd_cod) values (?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, endereco.getEnd_cod());
     ps.setString(2, endereco.getEnd_rua());
     ps.setInt(3, endereco.getEnd_num());
     ps.setString(4, endereco.getEnd_bairro());
     ps.setInt(5, endereco.getUsuario_Usu_cod());
     ps.setInt(6, endereco.getMunicipio_Mun_cod());
     ps.setInt(7, endereco.getTipo_Endereco_TipEnd_cod());
     int result = ps.executeUpdate();
  }


  public void atualizar(EnderecoDO endereco, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Endereco set End_rua=?, End_num=?, End_bairro=?  where End_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, endereco.getEnd_rua());
     ps.setInt(2, endereco.getEnd_num());
     ps.setString(3, endereco.getEnd_bairro());
     ps.setInt(4, endereco.getEnd_cod());
     int result = ps.executeUpdate();
  } // atualizar

  public EnderecoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Endereco where End_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     EnderecoDO endereco = new EnderecoDO();
     endereco.setEnd_cod(rs.getInt("End_cod"));
     endereco.setEnd_rua(rs.getString("End_rua"));
     endereco.setEnd_num(rs.getInt("End_num"));
     endereco.setEnd_bairro(rs.getString("End_bairro"));
     endereco.setUsuario_Usu_cod(rs.getInt("Usuario_Usu_cod"));
     endereco.setMunicipio_Mun_cod(rs.getInt("Municipio_Mun_cod"));
     endereco.setTipo_Endereco_TipEnd_cod(rs.getInt("Tipo_Endereco_TipEnd_cod"));
     return endereco;
  }

}

