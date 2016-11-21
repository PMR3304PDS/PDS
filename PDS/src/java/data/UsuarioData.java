
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.io.InputStream;
public class UsuarioData {
    
    public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Usuario (Usu_login, Usu_senha, Usu_nome, Usu_rg, Usu_cpf, Usu_foto, Usu_ativo) values (?, ?, ?, ?,?,?,?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getUsu_login());
     ps.setString(2, usuario.getUsu_senha());
     ps.setString(3, usuario.getUsu_nome());
     ps.setString(4, usuario.getUsu_rg());
     ps.setString(5, usuario.getUsu_cpf());
     ps.setBinaryStream(6, usuario.getUsu_foto());
     ps.setBoolean(7, usuario.isUsu_ativo());
     int result = ps.executeUpdate();
  }

  public void excluir (UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Usuario set Usu_ativo=false where Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, usuario.getUsu_cod());
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Usuario set Usu_login=?, Usu_senha=?, Usu_nome=?, Usu_rg=?, Usu_cpf=?, Usu_foto=?, Usu_ativo =?  where Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getUsu_login());
     ps.setString(2, usuario.getUsu_senha());
     ps.setString(3, usuario.getUsu_nome());
     ps.setString(4, usuario.getUsu_rg());
     ps.setString(5, usuario.getUsu_cpf());
     ps.setBinaryStream(6, usuario.getUsu_foto());
     ps.setBoolean(7, usuario.isUsu_ativo());
	 ps.setInt(8, usuario.getUsu_cod());
         
     int result = ps.executeUpdate();
  } // atualizar

  public UsuarioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where  Usu_cod=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setUsu_cod(rs.getInt("Usu_cod"));
     usuario.setUsu_login(rs.getString("Usu_login"));
     usuario.setUsu_senha(rs.getString("Usu_senha"));
     usuario.setUsu_nome(rs.getString("Usu_nome"));
     usuario.setUsu_rg(rs.getString("Usu_rg"));
     usuario.setUsu_cpf(rs.getString("Usu_cpf"));
     
     usuario.setUsu_foto(rs.getBinaryStream("Usu_foto"));
     
     usuario.setUsu_ativo(rs.getBoolean("Usu_ativo"));
     return usuario;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where Usu_nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
        UsuarioDO c = new UsuarioDO();
        c.setUsu_cod(rs.getInt("Usu_cod"));
        c.setUsu_nome(rs.getString("Usu_nome"));
        System.out.println(" got " + c.getUsu_nome());
        c.setUsu_login(rs.getString("Usu_login"));
        c.setUsu_senha(rs.getString("Usu_senha"));
        c.setUsu_rg(rs.getString("Usu_rg"));
        c.setUsu_cpf(rs.getString("Usu_cpf"));
        
        c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
        
        c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        usuarios.add(c);
     }
     return usuarios;
  } // pesquisarPorNome

    public UsuarioDO pesquisarPorLogin(String login, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where  Usu_login=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, login);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setUsu_cod(rs.getInt("Usu_cod"));
     usuario.setUsu_login(rs.getString("Usu_login"));
     usuario.setUsu_senha(rs.getString("Usu_senha"));
     usuario.setUsu_nome(rs.getString("Usu_nome"));
     usuario.setUsu_rg(rs.getString("Usu_rg"));
     usuario.setUsu_cpf(rs.getString("Usu_cpf"));
     
     usuario.setUsu_foto(rs.getBinaryStream("Usu_foto"));
     
     usuario.setUsu_ativo(rs.getBoolean("Usu_ativo"));
     return usuario;
  } // buscar
    
    public Vector pesquisarPorRg(String rg, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where Usu_rg like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, rg);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
        UsuarioDO c = new UsuarioDO();
        c.setUsu_cod(rs.getInt("Usu_cod"));
        c.setUsu_nome(rs.getString("Usu_nome"));
        System.out.println(" got " + c.getUsu_nome());
        c.setUsu_login(rs.getString("Usu_login"));
        c.setUsu_senha(rs.getString("Usu_senha"));
        c.setUsu_rg(rs.getString("Usu_rg"));
        c.setUsu_cpf(rs.getString("Usu_cpf"));
        
        c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
        
        c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        usuarios.add(c);
     }
     return usuarios;
  }
    
    public UsuarioDO pesquisarPorRg2(String rg, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where Usu_rg like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, rg);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     UsuarioDO usuario = new UsuarioDO();
     if(rs.next()){      
     usuario.setUsu_cod(rs.getInt("Usu_cod"));
     usuario.setUsu_nome(rs.getString("Usu_nome"));
     System.out.println(" got " + usuario.getUsu_nome());
     usuario.setUsu_login(rs.getString("Usu_login"));
     usuario.setUsu_senha(rs.getString("Usu_senha"));
     usuario.setUsu_rg(rs.getString("Usu_rg"));
     usuario.setUsu_cpf(rs.getString("Usu_cpf"));
     usuario.setUsu_foto(rs.getBinaryStream("Usu_foto"));
     usuario.setUsu_ativo(rs.getBoolean("Usu_ativo"));
     }
     return usuario;
  }
    
    public UsuarioDO pesquisarPorCpf2(String cpf, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where Usu_cpf like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, cpf);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     UsuarioDO usuario = new UsuarioDO();
     if(rs.next()){
        usuario.setUsu_cod(rs.getInt("Usu_cod"));
        usuario.setUsu_nome(rs.getString("Usu_nome"));
        System.out.println(" got " + usuario.getUsu_nome());
        usuario.setUsu_login(rs.getString("Usu_login"));
        usuario.setUsu_senha(rs.getString("Usu_senha"));
        usuario.setUsu_rg(rs.getString("Usu_rg"));
        usuario.setUsu_cpf(rs.getString("Usu_cpf"));
        usuario.setUsu_foto(rs.getBinaryStream("Usu_foto"));
        usuario.setUsu_ativo(rs.getBoolean("Usu_ativo"));
     }
     return usuario;
  }
    
  public Vector pesquisarPorCpf(String rg, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where Usu_cpf like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, rg);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector usuarios = new Vector();
     while (rs.next()) {
        UsuarioDO c = new UsuarioDO();
        c.setUsu_cod(rs.getInt("Usu_cod"));
        c.setUsu_nome(rs.getString("Usu_nome"));
        System.out.println(" got " + c.getUsu_nome());
        c.setUsu_login(rs.getString("Usu_login"));
        c.setUsu_senha(rs.getString("Usu_senha"));
        c.setUsu_rg(rs.getString("Usu_rg"));
        c.setUsu_cpf(rs.getString("Usu_cpf"));
        c.setUsu_foto(rs.getBinaryStream("Usu_foto"));     
        c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
        usuarios.add(c);
     }
     return usuarios;
  }  
}
