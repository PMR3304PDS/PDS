
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class Medico_has_EspecialidadeDATA {
    
  public void incluir(Medico_has_EspecialidadeDO medico_has_especialidade, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Medico_has_Especialidade (Medico_Usuario_Usu_cod, Especialidade_Esp_cod) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     
     ps.setInt(1, medico_has_especialidade.getMedico_Usuario_Usu_cod());
     ps.setInt(2, medico_has_especialidade.getEspecialidade_Esp_cod());
     int result = ps.executeUpdate();
  }
 
  
  public void atualizar(Medico_has_EspecialidadeDO medico_has_especialidade, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Medico_has_Especialidade set Medico_Usuario_Usu_cod=? where Especialidade_Esp_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, medico_has_especialidade.getMedico_Usuario_Usu_cod());
	 ps.setInt(2, medico_has_especialidade.getEspecialidade_Esp_cod());
     int result = ps.executeUpdate();
  } // atualizar

  public Medico_has_EspecialidadeDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Medico_has_Especialidade where  Medico_Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     Medico_has_EspecialidadeDO medico_has_especialidade = new Medico_has_EspecialidadeDO();
     medico_has_especialidade.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
     medico_has_especialidade.setEspecialidade_Esp_cod(rs.getInt("Especialidade_Esp_cod"));
     
     return medico_has_especialidade;
  } // buscar
}

