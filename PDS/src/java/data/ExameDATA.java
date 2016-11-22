package data;

import java.io.InputStream.*;
import java.sql.*;
import java.io.InputStream.*;
import java.util.*;
import utils.Transacao;

public class ExameDATA {

    public void incluir(ExameDO exame, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Exame (Exa_resumo, Exa_exame, "
                + "Exa_Solicitar,Tipo_Exame_TipExa_cod,Tecnico_Usuario_Usu_cod_uploader, "
                + "Paciente_Usuario_Usu_cod, Medico_Usuario_Usu_cod_uploader, Exa_excluido, Exa_data_upload, Exa_previsao ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
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
    }

    public void excluir(ExameDO exame, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Exame set Exa_excluido=true where Exa_cod=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, exame.getExa_cod());
        int result = ps.executeUpdate();
    } // excluir

    public void atualizar(ExameDO exame, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Exame set Exa_resumo=?, Exa_exame=?, "
                + "Exa_Solicitar=?,Tipo_Exame_TipExa_cod=?,Tecnico_Usuario_Usu_cod_uploader=?, "
                + "Paciente_Usuario_Usu_cod=?, Medico_Usuario_Usu_cod_uploader=?, Exa_excluido=?, Exa_data_upload=?, Exa_previsao=? where Exa_cod=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(11, exame.getExa_cod());
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
        ExameDO exame = new ExameDO();
        if (rs.next()) {
            exame.setExa_cod(rs.getInt("Exa_cod"));
            exame.setExa_resumo(rs.getString("Exa_resumo"));
            exame.setExa_exame(rs.getBinaryStream("Exa_exame"));
            exame.setExa_Solicitar(rs.getBinaryStream("Exa_Solicitar"));
            exame.setTipo_Exame_TipExa_cod(rs.getInt("Tipo_Exame_TipExa_cod"));
            exame.setTecnico_Usuario_Usu_cod_uploader(rs.getInt("Tecnico_Usuario_Usu_cod_uploader"));
            exame.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
            exame.setMedico_Usuario_Usu_cod_uploader(rs.getInt("Medico_Usuario_Usu_cod_uploader"));
            exame.setExa_excluido(rs.getBoolean("Exa_excluido"));
            exame.setExa_data_upload(rs.getDate("Exa_data_upload"));
            exame.setExa_previsao(rs.getDate("Exa_previsao"));
        }
        return exame;
    }

    public Vector pesquisarPorCod(int cod, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Exame where Paciente_Usuario_Usu_cod=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, cod);
        ResultSet rs = ps.executeQuery();
        Vector exames = new Vector();
        while (rs.next()) {
            ExameDO c = new ExameDO();
            c.setExa_cod(rs.getInt("Exa_cod"));
            c.setExa_resumo(rs.getString("Exa_resumo"));
            c.setExa_exame(rs.getBinaryStream("Exa_exame"));
            c.setExa_Solicitar(rs.getBinaryStream("Exa_Solicitar"));
            c.setTipo_Exame_TipExa_cod(rs.getInt("Tipo_Exame_TipExa_cod"));
            c.setTecnico_Usuario_Usu_cod_uploader(rs.getInt("Tecnico_Usuario_Usu_cod_uploader"));
            c.setPaciente_Usuario_Usu_cod(rs.getInt("Paciente_Usuario_Usu_cod"));
            c.setMedico_Usuario_Usu_cod_uploader(rs.getInt("Medico_Usuario_Usu_cod_uploader"));
            c.setExa_excluido(rs.getBoolean("Exa_excluido"));
            c.setExa_data_upload(rs.getDate("Exa_data_upload"));
            c.setExa_previsao(rs.getDate("Exa_previsao"));
            exames.add(c);
        }
        return exames;
    }// buscar

} // ExameDATA

