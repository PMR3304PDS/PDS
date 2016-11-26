
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class Tipo_ExameData {
    
//  public void incluir(Tipo_ExameDO tipo_exame, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "insert into Tipo_Exame (TipExa_descricao) values (?)";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setString(1, tipo_exame.getTipExa_descricao());
//
//     int result = ps.executeUpdate();
//  }
//
////  public void excluir(Tipo_ExameDO tipo_exame, Transacao tr) throws Exception {
////  } // excluir
//
//  public void atualizar(Tipo_ExameDO tipo_exame, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "update Tipo_Exame set TipExa_descricao=? where TipExa_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setString(1, tipo_exame.getTipExa_descricao());
//	 ps.setInt(2, tipo_exame.getTipExa_cod());
//     int result = ps.executeUpdate();
//  } // atualizar
//
//  public Tipo_ExameDO buscar(int idobj, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "select * from Tipo_Exame where  TipExa_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setInt(1, idobj);
//     ResultSet rs = ps.executeQuery();
//     rs.next();
//     Tipo_ExameDO tipo_exame = new Tipo_ExameDO();
//     tipo_exame.setTipExa_cod(rs.getInt("TipExa_cod"));
//     tipo_exame.setTipExa_descricao(rs.getString("TipExa_descricao"));
//     
//     return tipo_exame;
//  } // buscar
}
