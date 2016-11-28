package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import utils.Transacao;

public class MensagemDATA {

  public void incluir(MensagemDO msg, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "insert into Mensagem (Msg_data, Msg_msg, Msg_visualizado, Usuario_emissor, Usuario_receptor) values (?, ?, false, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setDate(1, msg.getMsg_data());
    ps.setString(2, msg.getMsg_msg());
    ps.setInt(3, msg.getUsuario_emissor());
    ps.setInt(4, msg.getUsuario_receptor());
    int result = ps.executeUpdate();
  }

  public Vector pesquisarPorCodDoReceptorMaisRecente(int cod_rec, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    //String sql = "select * from (select * from mensagem where Usuario_receptor = ?) as s group by s.Usuario_emissor desc";
    String sql = "select * from (select * from mensagem group by Usuario_emissor desc) as s where s.Usuario_receptor = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod_rec);
    ResultSet rs = ps.executeQuery();
    Vector msg = new Vector();
    while (rs.next()) {
      MensagemDO m = new MensagemDO();
      m.setMsg_cod(rs.getInt("Msg_cod"));
      m.setMsg_data(rs.getDate("Msg_data"));
      m.setMsg_msg(rs.getString("Msg_msg"));
      m.setMsg_visualizado(rs.getBoolean("Msg_visualizado"));
      m.setUsuario_emissor(rs.getInt("Usuario_emissor"));
      m.setUsuario_receptor(rs.getInt("Usuario_receptor"));
      msg.add(m);
    }
    return msg;
  }
  
  public Vector pesquisarPorCodDoEmissorMaisRecente(int cod_emi, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    //String sql = "select * from (select * from mensagem where Usuario_emissor = ?) as s group by s.Usuario_receptor desc";
    String sql = "select * from (select * from mensagem group by Usuario_receptor desc) as s where s.Usuario_emissor = ?";
    
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod_emi);
    ResultSet rs = ps.executeQuery();
    Vector msg = new Vector();
    while (rs.next()) {
      MensagemDO m = new MensagemDO();
      m.setMsg_cod(rs.getInt("Msg_cod"));
      m.setMsg_data(rs.getDate("Msg_data"));
      m.setMsg_msg(rs.getString("Msg_msg"));
      m.setMsg_visualizado(rs.getBoolean("Msg_visualizado"));
      m.setUsuario_emissor(rs.getInt("Usuario_emissor"));
      m.setUsuario_receptor(rs.getInt("Usuario_receptor"));
      msg.add(m);
    }
    return msg;
  }

  public Vector pesquisarPorCodDoEmissor(int cod_emi, int cod_rec, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from mensagem where (Usuario_emissor = ? and Usuario_receptor = ?) or (Usuario_emissor = ? and Usuario_receptor = ?) order by Msg_cod";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod_emi);
    ps.setInt(2, cod_rec);
    ps.setInt(3, cod_rec);
    ps.setInt(4, cod_emi);
    ResultSet rs = ps.executeQuery();
    Vector msg = new Vector();
    while (rs.next()) {
      MensagemDO m = new MensagemDO();
      m.setMsg_cod(rs.getInt("Msg_cod"));
      m.setMsg_data(rs.getDate("Msg_data"));
      m.setMsg_msg(rs.getString("Msg_msg"));
      m.setMsg_visualizado(rs.getBoolean("Msg_visualizado"));
      m.setUsuario_emissor(rs.getInt("Usuario_emissor"));
      m.setUsuario_receptor(rs.getInt("Usuario_receptor"));
      msg.add(m);
    }
    return msg;
  }

  public void marcarLido(int cod, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update Mensagem set Msg_visualizado = true where Msg_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod);
    int result = ps.executeUpdate();
  }

}
