package data;

import java.sql.*;
import java.io.FileInputStream.*;
import java.util.*;
import utils.Transacao;

public class ExameDATA {
   
  public void incluir(ExameDO exame, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Exame (Exa_cod, Exa_resumo, Exa_exame, "
             + "Exa_Solicitar,Tipo_Exame_TipExa_cod,Tecnico_Usuario_Usu_cod_uploader, " 
             + "Paciente_Usuario_Usu_cod, Medico_Usuario_Usu_cod_uploader, Exa_excluido, Exa_data_upload, Exa_previsao ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1,exame.getExa_cod());
     ps.setString(2, exame.getExa_resumo());
     ps.setBinaryStream(3, exame.getExa_exame());
     ps.setBinaryStream(4, exame.getExa_Solicitar());
     ps.setInt(5, exame.getTipo_Exame_TipExa_cod());
     ps.setInt(6, exame.getTecnico_Usuario_Usu_cod_uploader());
     ps.setInt(7, exame.getPaciente_Usuario_Usu_cod());
     ps.setInt(8, exame.getMedico_Usuario_Usu_cod_uploader());
     ps.setBoolean(9, exame.isExa_excluido());
     ps.setDate(10, exame.getExa_data_upload());
     ps.setDate(11, exame.getExa_previsao());
     int result = ps.executeUpdate();
  }

  public void atualizar(ExameDO exame, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Exame set Exa_resumo=?, Exa_exame=?, "
             + "Exa_Solicitar=?,Tipo_Exame_TipExa_cod=?,Tecnico_Usuario_Usu_cod_uploader=?, " 
             + "Paciente_Usuario_Usu_cod=?, Medico_Usuario_Usu_cod_uploader=?, Exa_excluido=?, Exa_data_upload=?, Exa_previsao=? where Exa_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(11,exame.getExa_cod());
     ps.setString(1, exame.getExa_resumo());
     ps.setBinaryStream(2, exame.getExa_exame());
     ps.setBinaryStream(3, exame.getExa_Solicitar());
     ps.setInt(4, exame.getTipo_Exame_TipExa_cod());
     ps.setInt(5, exame.getTecnico_Usuario_Usu_cod_uploader());
     ps.setInt(6, exame.getPaciente_Usuario_Usu_cod());
     ps.setInt(7, exame.getMedico_Usuario_Usu_cod_uploader());
     ps.setBoolean(8, exame.isExa_excluido());
     ps.setDate(9, exame.getExa_data_upload());
     ps.setDate(10, exame.getExa_previsao());
     int result = ps.executeUpdate();
  } // atualizar
  
  public ExameDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Exame where Exa_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ExameDO exame = new ExameDO();
     exame.setExa_cod(rs.getInt("Exa_cod"));
     
     return exame;
  } // buscar

} // ExameDATA

    

