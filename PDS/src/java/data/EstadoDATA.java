/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import utils.Transacao;

/**
 *
 * @author gabri
 */
public class EstadoDATA {
    
    public void incluir(EstadoDO estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Estado (Est_nome) values (?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, estado.getEst_nome());
     int result = ps.executeUpdate();
  }

  public void atualizar(EstadoDO estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Estado set Est_nome=? where Est_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, estado.getEst_cod());
     ps.setString(2, estado.getEst_nome());
     int result = ps.executeUpdate();
  } // atualizar
  
  public EstadoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Estado where Est_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     EstadoDO estado = new EstadoDO();
     estado.setEst_cod(rs.getInt("Est_cod"));
     estado.setEst_nome(rs.getString("Est_nome"));
     return estado;
  } // buscar
  public Vector buscarTudo(Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * from Estado ";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        Vector Vec_con = new Vector();

        while (rs.next()) {
            ConselhosDO conselho = new ConselhosDO();
         EstadoDO estado = new EstadoDO();
         estado.setEst_cod(rs.getInt("Est_cod"));
         estado.setEst_nome(rs.getString("Est_nome"));
            Vec_con.add(estado);
        }
        return Vec_con;
    } // buscar tudo    
    
    
    
    
}
