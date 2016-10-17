package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.sql.Date;

public class ConsultaDATA {

  public void incluir(ConsultaDO consulta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Consulta (Medico_Usuario_Usu_cod, Paciente_Usuario_Usu_cod, Cns_data, Cns_resumo) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, consulta.getMedico_Usuario_Usu_cod());
     ps.setInt(2, consulta.getPaciente_Usuario_Usu_cod());
     ps.setDate(3, consulta.getCns_data());
     ps.setString(4, consulta.getCns_resumo());
     int result = ps.executeUpdate();
  }


  public void atualizar(ConsultaDO consulta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Consulta set Cns_data=?, Cns_resumo=?  where Medico_Usuario_Usu_cod=? and Paciente_Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, consulta.getMedico_Usuario_Usu_cod());
     ps.setInt(2, consulta.getPaciente_Usuario_Usu_cod());
     ps.setDate(3, consulta.getCns_data());
     ps.setString(4, consulta.getCns_resumo());
     ps.setInt(5, consulta.getMedico_Usuario_Usu_cod());
     ps.setInt(6, consulta.getPaciente_Usuario_Usu_cod());
     int result = ps.executeUpdate();
  } // atualizar

  public ConsultaDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Consulta where Medico_Usuario_Usu_cod=? and Paciente_Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ConsultaDO consulta = new ConsultaDO();
     consulta.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
     consulta.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
     consulta.setCns_data(rs.getDate("Cns_data"));
     consulta.setCns_resumo(rs.getString("Cns_resumo"));
     return consulta;
  }

}

