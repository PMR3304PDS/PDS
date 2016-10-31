package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class Comentarios_ExameDATA {

  public void incluir(Comentarios_ExameDO comentario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into ComentarioExame (ComExa_data, ComExa_comentario, "
             + "Medico_Usuario_Usu_cod,Exame_Exa_cod,Com_Exa_excluido) values ( ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setDate(1, comentario.getComExa_data());
     ps.setString(2, comentario.getComExa_comentario());
     ps.setInt(3, comentario.getMedico_Usuario_Usu_cod());
     ps.setInt(4, comentario.getExame_Exa_cod());
     ps.setBoolean(5, comentario.isCom_Exa_excluido());
     int result = ps.executeUpdate();
  }

  public void excluir(Comentarios_ExameDO comentario, Transacao tr) throws Exception {
        excluir(comentario.getComExa_cod(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ComentarioExame set Com_Exa_excluido=true where ComExa_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(Comentarios_ExameDO comentario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ComentarioExame set ComExa_comentario=? where ComExa_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, comentario.getComExa_comentario());
     ps.setInt(2, comentario.getComExa_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public Comentarios_ExameDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from ComentarioExame where ComExa_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Comentarios_ExameDO comentario = new Comentarios_ExameDO();
     comentario.setComExa_cod(rs.getInt("ComExa_cod"));
     comentario.setComExa_comentario(rs.getString("ComExa_comentario"));
     comentario.setComExa_data(rs.getDate("ComExa_data"));
     comentario.setCom_Exa_excluido(rs.getBoolean("ComExa_excluido"));
     comentario.setExame_Exa_cod(rs.getInt("Exame_Exa_cod"));
     comentario.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
     return comentario;
  } // buscar

} // Comentarios_ExameDATA
