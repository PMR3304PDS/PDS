package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class IndicacaoDATA {
    
    public void incluir(IndicacaoDO indicacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Indicacao (Medico_Usuario_Usu_cod_indicante, Medico_Usuario_Usu_cod_indicado, Paciente_Usuario_Usu_cod) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, indicacao.getMedico_Usuario_Usu_cod_indicado());
     ps.setInt(2, indicacao.getMedico_Usuario_Usu_cod_indicante());
     ps.setInt(3, indicacao.getPaciente_Usuario_Usu_cod());
     int result = ps.executeUpdate();
  }
    
    public void atualizar(IndicacaoDO indicacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Indicacao set Medico_Usuario_Usu_cod_indicante=?, Medico_Usuario_Usu_cod_indicado=?, Paciente_Usuario_Usu_cod=? where Ind_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, indicacao.getMedico_Usuario_Usu_cod_indicado());
     ps.setInt(2, indicacao.getMedico_Usuario_Usu_cod_indicante());
     ps.setInt(3, indicacao.getPaciente_Usuario_Usu_cod());
     ps.setInt(4, indicacao.getInd_cod());
     int result = ps.executeUpdate();
  } // atualizar
    
    public IndicacaoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Indicacao where Ind_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     IndicacaoDO indicacao = new IndicacaoDO();
     indicacao.setInd_cod(rs.getInt("Ind_cod"));
     indicacao.setMedico_Usuario_Usu_cod_indicante(rs.getInt("Medico_Usuario_Usu_cod_indicante"));
     indicacao.setMedico_Usuario_Usu_cod_indicado(rs.getInt("Medico_Usuario_Usu_cod_indicado"));
     indicacao.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod;"));
     return indicacao;
  } // buscar
}
