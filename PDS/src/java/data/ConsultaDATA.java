package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.sql.Date;

public class ConsultaDATA {

  public void incluir(ConsultaDO consulta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Consulta (Cns_cod, Medico_Usuario_Usu_cod, Paciente_Usuario_Usu_cod, Cns_data, Cns_resumo) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, consulta.getCns_cod());
     ps.setInt(2, consulta.getMedico_Usuario_Usu_cod());
     ps.setInt(3, consulta.getPaciente_Usuario_Usu_cod());
     ps.setDate(4, consulta.getCns_data());
     ps.setString(5, consulta.getCns_resumo());
     int result = ps.executeUpdate();
  }


  public void atualizar(ConsultaDO consulta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Consulta set Medico_Usuario_Usu_cod=?, Paciente_Usuario_Usu_cod=?, Cns_data=?, Cns_resumo=?  where Cns_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, consulta.getMedico_Usuario_Usu_cod());
     ps.setInt(2, consulta.getPaciente_Usuario_Usu_cod());
     ps.setDate(3, consulta.getCns_data());
     ps.setString(4, consulta.getCns_resumo());
     ps.setInt(5, consulta.getCns_cod());
     int result = ps.executeUpdate();
  } // atualizar

  public ConsultaDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Consulta where Cns_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ConsultaDO consulta = new ConsultaDO();
     consulta.setCns_cod(rs.getInt("Cns_cod"));
     consulta.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
     consulta.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
     consulta.setCns_data(rs.getDate("Cns_data"));
     consulta.setCns_resumo(rs.getString("Cns_resumo"));
     return consulta;
  }

}

