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
public class MunicipioDATA {
    
    public void incluir(MunicipioDO municipio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Municipio (Mun_cod, Mun_nome, Estado_Est_cod) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, municipio.getMun_cod());
     ps.setString(2, municipio.getMun_nome());
     ps.setInt(3, municipio.getEstado_Est_cod());
     int result = ps.executeUpdate();
  }

  public void atualizar(MunicipioDO municipio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Municipio set Mun_nome=?, Estado_Est_cod=? where Mun_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, municipio.getMun_nome());
     ps.setInt(2, municipio.getEstado_Est_cod());
     ps.setInt(3, municipio.getMun_cod());
     int result = ps.executeUpdate();
  } // atualizar
  
  public MunicipioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Municipio where Mun_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     MunicipioDO municipio = new MunicipioDO();
     municipio.setMun_cod(rs.getInt("Mun_cod"));
     municipio.setMun_nome(rs.getString("Mun_nome"));
     municipio.setEstado_Est_cod(rs.getInt("Estado_Est_cod"));
     return municipio;
  } // buscar
    
}
