package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TecnicoDATA {

  public void incluir(TecnicoDO tecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Paciente (Conselhos_Con_cod, Estado_Est_cod_conselho_emissor) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, tecnico.getConselhos_Con_cod());
     ps.setInt(2, tecnico.getEstado_Est_cod_conselho_emissor());
     int result = ps.executeUpdate();
  }
//  public void excluir(PacienteDO comentario, Transacao tr) throws Exception {
//        excluir(comentario.getUsu_cod(), tr);
//  } // excluir
//
//  public void excluir (int idobj, Transacao tr) throws Exception {
//     Connection con = tr.obterConexao();
//     String sql = "update Paciente set Com_Rec_excluido=true where ComRec_cod=?";
//     PreparedStatement ps = con.prepareStatement(sql);
//     ps.setInt(1, idobj);
//     int result = ps.executeUpdate();
//  } // excluir 

  public void atualizar(TecnicoDO tecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Tecnico set Conselhos_Con_cod=? Estado_Est_cod_conselho_emissor=? where Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, tecnico.getConselhos_Con_cod());
     ps.setInt(2, tecnico.getEstado_Est_cod_conselho_emissor());
     ps.setInt(3, tecnico.getUsu_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public TecnicoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Paciente where Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TecnicoDO tecnico = new TecnicoDO();
     tecnico.setUsu_cod(rs.getInt("Usu_cod"));
     tecnico.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
     tecnico.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
     return tecnico;
  } // buscar

}

