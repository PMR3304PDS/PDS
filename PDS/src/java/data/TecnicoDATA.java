package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TecnicoDATA {

  public void incluir(TecnicoDO tecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Tecnico (Conselhos_Con_cod, Estado_Est_cod_conselho_emissor) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, tecnico.getConselhos_Con_cod());
     ps.setInt(2, tecnico.getEstado_Est_cod_conselho_emissor());
     int result = ps.executeUpdate();
  }

//  public void excluir (TecnicoDO tecnico, Transacao tr) throws Exception {
//  } // excluir 

  public void atualizar(TecnicoDO tecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Tecnico set Conselhos_Con_cod=? Estado_Est_cod_conselho_emissor=? where Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, tecnico.getConselhos_Con_cod());
     ps.setInt(2, tecnico.getEstado_Est_cod_conselho_emissor());
     ps.setInt(3, tecnico.getUsu_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public TecnicoDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select u.*, t.* from Usuario as u inner join Tecnico as t on u.Usu_cod = t.Usuario_Usu_cod where u.Usu_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      TecnicoDO t = new TecnicoDO();
      if (rs.getBoolean("Usu_ativo")) {
        t.setUsu_cod(rs.getInt("Usu_cod"));
        t.setUsu_login(rs.getString("Usu_login"));
        t.setUsu_rg(rs.getString("Usu_rg"));
        t.setUsu_cpf(rs.getString("Usu_cpf"));
        t.setUsu_nome(rs.getString("Usu_nome"));
        t.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        t.setUsu_foto(rs.getBinaryStream("Usu_foto"));
        t.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
        t.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
      }
      return t;
    }
    return null;
  } // buscar

}

