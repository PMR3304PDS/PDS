/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package documentos;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import utils.Transacao;

/**
 *
 * @author Lucas
 */
public class DocumentoData {
    
    public void incluir(DocumentoDO doc, Transacao tr) throws SQLException, FileNotFoundException{
        Connection con = tr.obterConexao();
        String sql = "insert into Exame ("
                + "Exa_exame, "
                + "Exa_resumo, "
                + "Tipo_Exame_TipExa_cod, "
                + "Tecnico_Usuario_Usu_cod_uploader, "
                + "Paciente_Usuario_Usu_cod, "
                + "Medico_Usuario_Usu_cod_uploader, "
                + "Exa_excluido, "
                + "Exa_data_upload, "
                + "Exa_previsao"
                + ") values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setBinaryStream(1, doc.getExame());
        ps.setString(2, doc.getResumo());
        ps.setInt(3, doc.getTipExa_cod());
        ps.setInt(4, doc.getTec_cod());
        ps.setInt(5, doc.getPac_cod());
        ps.setInt(6, doc.getMed_cod());
        ps.setBoolean(7, doc.isExcluido());
        ps.setDate(8, doc.getData_upload());
        ps.setDate(9, doc.getPrevisao());
        
        int result = ps.executeUpdate();
    }//upload de documentos
    
    public void buscar(int idExa, String filename, Transacao tr) throws SQLException {
        Connection con = tr.obterConexao();
        String sql = "select Exa_exame from Exame where  Exa_cod=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idExa);
        ResultSet rs = ps.executeQuery();
        rs.next();
    }
    //TODO: alterar, excluir, download
}
