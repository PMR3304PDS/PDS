package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class AvaliacaoDATA {

  public void incluir(AvaliacaoDO avaliacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Avaliacao (Ava_cod, Medico_Usuario_Usu_cod, "
     + "Paciente_Usuario_Usu_cod, Num_Aval) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, avaliacao.getAva_cod());
     ps.setInt(2, avaliacao.getMedico_Usuario_Usu_cod());
     ps.setInt(3, avaliacao.getPaciente_Usuario_Usu_cod());
     ps.setInt(4, avaliacao.getNum_Aval());
     int result = ps.executeUpdate();
  }

  public void atualizar(AvaliacaoDO avaliacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Avaliacao set =? where Ava_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, avaliacao.getAva_cod());
     ps.setInt(2, avaliacao.getMedico_Usuario_Usu_cod());
     ps.setInt(3, avaliacao.getPaciente_Usuario_Usu_cod());
     ps.setInt(4, avaliacao.getNum_Aval());
     int result = ps.executeUpdate();
  } // atualizar
  
  public AvaliacaoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Avaliacao where Ava_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     AvaliacaoDO avaliacao = new AvaliacaoDO();
     avaliacao.setAva_cod(rs.getInt("Ava_cod"));
     avaliacao.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
     avaliacao.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usu_cod"));
     avaliacao.setNum_Aval(rs.getInt("Num_Aval"));
     return avaliacao;
  } // buscar

} // Comentarios_ReceitaDATA

