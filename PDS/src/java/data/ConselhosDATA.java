package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ConselhosDATA {

//  public void incluir(ConselhosDO conselho, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "insert into Conselhos ( Con_nome, Con_sigla) values (?, ?)";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setString(1, conselho.getCon_nome());
//     ps.setString(2, conselho.getCon_sigla());
//     int result = ps.executeUpdate();
//  }
//
//  public void atualizar(ConselhosDO conselho, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "update Conselhos set Con_nome=? where Con_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setString(1, conselho.getCon_nome());
//     ps.setInt(2, conselho.getCon_cod());
//     int result = ps.executeUpdate();
//  } // atualizar
//
  public ConselhosDO buscar(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from Conselhos where Con_cod=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    rs.next();
    ConselhosDO conselho = new ConselhosDO();
    conselho.setCon_cod(rs.getInt("Con_cod"));
    conselho.setCon_nome(rs.getString("Con_nome"));
    conselho.setCon_sigla(rs.getString("Con_sigla"));
    return conselho;
  }

  public Vector buscarTudo(Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from Conselhos ";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    Vector Vec_con = new Vector();

    while (rs.next()) {
      ConselhosDO conselho = new ConselhosDO();
      conselho.setCon_cod(rs.getInt("Con_cod"));
      conselho.setCon_nome(rs.getString("Con_nome"));
      conselho.setCon_sigla(rs.getString("Con_sigla"));
      Vec_con.add(conselho);
    }
    return Vec_con;
  } // buscar tudo

} // ConselhoData
