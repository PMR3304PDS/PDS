/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.Vector;
import utils.Transacao;

/**
 *
 * @author aluno
 */
public class ReceitaDATA {
    public void incluir (ReceitaDO receita, Transacao tr) throws SQLException{
        Connection con = tr.obterConexao();
        String sql = "insert into Receita ("
                + "Rec_excluido, "
                + "Rec_data_upload, "
                + "Paciente_Usuario_Usu_cod, "
                + "Tecnico_Usuario_Usu_cod, "
                + "Medico_Usuario_Usu_cod, "
                + "Rec_check, "
                + "Rec_Receita, "
                + "Rec_Resumo"
                + ") values (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setBoolean(1, receita.isRec_excluido());
        ps.setDate(2, receita.getRec_data_upload());
        ps.setInt(3, receita.getPaciente_Usuario_Usu_cod());
        if (receita.getTecnico_Usuario_Usu_cod() == -1) {
            ps.setNull(4, java.sql.Types.INTEGER);
        }else{
            ps.setInt(4, receita.getTecnico_Usuario_Usu_cod());
        }
        if (receita.getMedico_Usuario_Usu_cod() == -1) {
            ps.setNull(5, java.sql.Types.INTEGER);
        }else{
            ps.setInt(5, receita.getMedico_Usuario_Usu_cod());
        }
        ps.setBoolean(6, receita.isRec_check());
        ps.setBinaryStream(7, receita.getRec_receita());
        ps.setString(8, receita.getRec_resumo());
        
        int result = ps.executeUpdate();
    }//incluir
//    
//    public void atualizar(ReceitaDO receita, Transacao tr) throws SQLException{
//        Connection con = tr.obterConexao();
//        String sql = "update Receita set Rec_excluido = ?, "
//                + "Rec_data_upload = ?, "
//                + "Paciente_Usuario_Usu_cod = ?, "
//                + "Farmaceutico_Usuario_Usu_cod = ?, "
//                + "Tecnico_Usuario_Usu_cod = ?, "
//                + "Medico_Usuario_Usu_cod = ?, "
//                + "Rec_check = ?, "
//                + "Rec_Receita = ?, "
//                + "Rec_Resumo = ? "
//                + "where Rec_cod = ?";
//        PreparedStatement ps = con.prepareStatement(sql);
//        
//        ps.setBoolean(1, receita.isRec_excluido());
//        ps.setDate(2, receita.getRec_data_upload());
//        ps.setInt(3, receita.getPaciente_Usuario_Usu_cod());
//        ps.setInt(4, receita.getFarmaceutico_Usuario_Usu_cod());
//        ps.setInt(6, receita.getMedico_Usuario_Usu_cod());
//        ps.setBoolean(7, receita.isRec_check());
//        ps.setBinaryStream(8, receita.getRec_receita());
//        ps.setString(9, receita.getRec_resumo());
//        ps.setInt(10, receita.getRec_cod());
//        
//        int result = ps.executeUpdate();
//    }//atualizar
//    

  public void excluir(ReceitaDO receita, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update Receita set Rec_excluido=true where Rec_cod=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, receita.getRec_cod());
    int result = ps.executeUpdate();
  } // excluir

  public ReceitaDO buscar(int idobj, Transacao tr) throws SQLException {
    Connection con = tr.obterConexao();
    String sql = "select * from Receita where Rec_cod = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, idobj);
    ResultSet rs = ps.executeQuery();
    rs.next();
    ReceitaDO receita = new ReceitaDO();
    receita.setRec_cod(rs.getInt("Rec_cod"));
    receita.setRec_excluido(rs.getBoolean("Rec_excluido"));
    receita.setRec_data_upload(rs.getDate("Rec_data_upload"));
    receita.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
    receita.setTecnico_Usuario_Usu_cod(rs.getInt("Tecnico_Usuario_Usu_cod"));
    receita.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
    receita.setRec_check(rs.getBoolean("Rec_check"));
    receita.setRec_receita(rs.getBinaryStream("Rec_receita"));
    receita.setRec_resumo(rs.getString("Rec_resumo"));

    return receita;
  }//buscar

  public Vector GetListaReceitas(int cod, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "select * from Receita where Paciente_Usuario_Usu_cod=? and Rec_excluido=false";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod);
    ResultSet rs = ps.executeQuery();
    Vector receitas = new Vector();
    while (rs.next()) {
      ReceitaDO c = new ReceitaDO();
      c.setRec_cod(rs.getInt("Rec_cod"));
      c.setRec_excluido(rs.getBoolean("Rec_excluido"));
      c.setRec_data_upload(rs.getDate("Rec_data_upload"));
      c.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
      c.setTecnico_Usuario_Usu_cod(rs.getInt("Tecnico_Usuario_Usu_cod"));
      c.setMedico_Usuario_Usu_cod(rs.getInt("Medico_Usuario_Usu_cod"));
      c.setRec_check(rs.getBoolean("Rec_check"));
      c.setRec_receita(rs.getBinaryStream("Rec_receita"));
      c.setRec_resumo(rs.getString("Rec_resumo"));
      receitas.add(c);
    }
    return receitas;
  }// buscar

  public void atualizar(int cod, Transacao tr) throws Exception {
    Connection con = tr.obterConexao();
    String sql = "update Receita set Rec_check = true where Rec_cod=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, cod);
    int result = ps.executeUpdate();
  }

}
