/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.Transacao;

/**
 *
 * @author gabri
 */
public class EstadoDATA {
    
    public void incluir(EstadoDO estado, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Estado (Est_cod, Est_nome) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, estado.getEst_cod());
     ps.setString(2, estado.getEst_nome());
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
    
    
    
}
