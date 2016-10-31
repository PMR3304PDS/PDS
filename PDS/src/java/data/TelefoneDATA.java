
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TelefoneDATA {
    
    public void incluir(TelefoneDO telefone, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Telefone (Tel_numero, Usuario_Usu_Cod) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, telefone.getTel_numero());
     ps.setInt(2, telefone.getUsuario_Usu_Cod());
     
     int result = ps.executeUpdate();
  }

  public void excluir(TelefoneDO telefone, Transacao tr) throws Exception {
     excluir(telefone.getTel_cod(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
  } // excluir 

  public void atualizar(TelefoneDO telefone, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Telefone set Tel_numero=?, Usuario_Usu_Cod=? where TipEnd_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, telefone.getTel_numero());
     ps.setInt(2, telefone.getUsuario_Usu_Cod());
     ps.setInt(3, telefone.getTel_cod());
     int result = ps.executeUpdate();
  } // atualizar

  public TelefoneDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Telefone where  Tel_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TelefoneDO telefone = new TelefoneDO();
     telefone.setTel_numero(rs.getInt("Tel_numero"));
     telefone.setTel_numero(rs.getInt("Usuario_Usu_Cod"));
     
     return telefone;
  } // buscar
}
