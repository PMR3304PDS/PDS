package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.sql.Date;

public class ConsultaDATA {

  public void incluir(ConsultaDO consulta, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "insert into Consulta (Medico_Usuario_Usu_cod, Paciente_Usuario_Usu_cod, Cns_data, Cns_resumo) values (?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
    ps.setInt(1, consulta.getMedico_Usuario_Usu_cod());
    ps.setInt(2, consulta.getPaciente_Usuario_Usu_cod());
    ps.setDate(3, consulta.getCns_data());
    ps.setString(4, consulta.getCns_resumo());
    int result = ps.executeUpdate();

    ResultSet rs = ps.getGeneratedKeys();

    int key = 0;
    if (rs.next()) {
      key = rs.getInt(1);
    }
    consulta.setCns_cod(key);
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

  
  public Vector buscarPorPaciente(int idobj, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from Consulta where Paciente_Usuario_Usu_cod=? order by Cns_data desc";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    Vector consultas = new Vector();
    while (rs.next()) {
        ConsultaDO c = new ConsultaDO();
        c.setCns_cod(rs.getInt("Cns_cod"));
        c.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
        c.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
        c.setCns_data(rs.getDate("Cns_data"));
        c.setCns_resumo(rs.getString("Cns_resumo"));
        consultas.add(c);
    }
    return consultas;
  }
  
}
