package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ConselhosDATA {

  public void incluir(ConselhosDO conselho, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Conselhos (Con_cod, Con_nome, Con_sigla) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, conselho.getCon_cod());
     ps.setString(2, conselho.getCon_nome());
     ps.setString(3, conselho.getCon_sigla());
     int result = ps.executeUpdate();
  }

  public void atualizar(ConselhosDO conselho, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Conselhos set Con_nome=? where Con_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, conselho.getCon_nome());
     ps.setInt(2, conselho.getCon_cod());
     int result = ps.executeUpdate();
  } // atualizar

  public ConselhosDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Conselhos where  Con_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ConselhosDO conselho = new ConselhosDO();
     conselho.setCon_cod (rs.getInt("id"));
     conselho.setCon_nome (rs.getString("nome"));
     conselho.setCon_sigla(rs.getString("telefone"));
     return conselho;
  } // buscar

} // ConselhoData