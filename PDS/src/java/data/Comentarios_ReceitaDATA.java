package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class Comentarios_ReceitaDATA {

  public void incluir(Comentarios_ReceitaDO comentario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into ComentarioReceita (ComRec_data, ComRec_comentario, "
     + "Medico_Usuario_Usu_cod,Farmaceutico_Usuario_Usu_cod,Receita_Rec_cod,Com_Rec_excluido,) values ( ?, ?, ?, ?, ?,?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setDate(1, comentario.getComRec_data());
     ps.setString(2, comentario.getComRec_comentario());
     ps.setInt(3, comentario.getMedico_Usuario_Usu_cod());
     ps.setInt(4, comentario.getFarmaceutico_Usuario_Usu_cod());
     ps.setInt(5, comentario.getReceita_Rec_cod());
     ps.setBoolean(6, comentario.isCom_Rec_excluido());
     int result = ps.executeUpdate();
  }
  public void excluir(Comentarios_ReceitaDO comentario, Transacao tr) throws Exception {
        excluir(comentario.getComRec_cod(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ComentarioReceita set Com_Rec_excluido=true where ComRec_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(Comentarios_ReceitaDO comentario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ComentarioReceita set ComExa_comentario=? where ComExa_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, comentario.getComRec_comentario());
     ps.setInt(2, comentario.getComRec_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public Comentarios_ReceitaDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from ComentarioReceita where ComRec_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Comentarios_ReceitaDO comentario = new Comentarios_ReceitaDO();
     comentario.setComRec_cod(rs.getInt("ComRec_cod"));
     comentario.setComRec_comentario(rs.getString("ComRec_comentario"));
     comentario.setComRec_data(rs.getDate("ComRec_data"));
     comentario.setCom_Rec_excluido(rs.getBoolean("ComRec_excluido"));
     comentario.setReceita_Rec_cod(rs.getInt("Receita_Rec_cod"));
     comentario.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
     comentario.setFarmaceutico_Usuario_Usu_cod(rs.getInt("Farmaceutico_Usuario_Usu_cod"));
     return comentario;
  } // buscar

} // Comentarios_ReceitaDATA

