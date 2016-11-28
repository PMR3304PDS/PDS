
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
  
  public void excluir(MedicoDO mhe, Transacao tr) throws Exception {
     excluir(mhe.getUsu_cod(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Medico_has_Especialidade where Medico_Usuario_Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
  } // excluir
 
  
//  public void atualizar(Medico_has_EspecialidadeDO medico_has_especialidade, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "update Medico_has_Especialidade set Medico_Usuario_Usu_cod=? where Especialidade_Esp_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setInt(1, medico_has_especialidade.getMedico_Usuario_Usu_cod());
//	 ps.setInt(2, medico_has_especialidade.getEspecialidade_Esp_cod());
//     int result = ps.executeUpdate();
//  } // atualizar
//
}

