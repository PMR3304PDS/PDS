package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MedicoDATA {

    public void incluir(MedicoDO medico, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "insert into Medico (Conselhos_Con_cod, Estado_Est_cod_conselho_emissor, Med_NumRegistro) values (?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, medico.getConselhos_Con_cod());
        ps.setInt(2, medico.getEstado_Est_cod_conselho_emissor());
        ps.setString(3, medico.getMed_NumRegistro());
        int result = ps.executeUpdate();
    }

    public void atualizar(MedicoDO medico, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "update Medico set Estado_Est_cod_conselho_emissor=?, Med_NumRegistro=? where Conselhos_Con_cod=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, medico.getEstado_Est_cod_conselho_emissor());
        ps.setString(2, medico.getMed_NumRegistro());
        ps.setInt(3, medico.getConselhos_Con_cod());
        int result = ps.executeUpdate();
    } // atualizar

    public MedicoDO buscar(int idobj, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select u.*, m.* from Usuario as u inner join Medico as m on u.Usu_cod = m.Usuario_Usu_cod where u.Usu_cod = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, idobj);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            MedicoDO m = new MedicoDO();
            if (rs.getBoolean("Usu_ativo")) {
                m.setUsu_cod(rs.getInt("Usu_cod"));
                m.setUsu_nome(rs.getString("Usu_nome"));
                m.setUsu_login(rs.getString("Usu_login"));
                m.setUsu_rg(rs.getString("Usu_rg"));
                m.setUsu_cpf(rs.getString("Usu_cpf"));
                m.setUsu_ativo(rs.getBoolean("Usu_ativo"));
                m.setUsu_foto(rs.getBinaryStream("Usu_foto"));
                m.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
                m.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
                m.setMed_NumRegistro(rs.getString("Med_NumRegistro"));
            }
            return m;
        }
        return null;
    } // buscar

    public Vector pesquisarPorCrm(String crm, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * "
                + "from Usuario inner join Medico "
                + "on Usuario.Usu_cod = Medico.Usuario_Usu_Cod "
                + "where Medico.Med_NumRegistro = ? ";;
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, crm);
        ResultSet rs = ps.executeQuery();
        Vector medicos = new Vector();
        while (rs.next()) {
            MedicoDO c = new MedicoDO();
            c.setUsu_cod(rs.getInt("Usu_cod"));
            c.setUsu_nome(rs.getString("Usu_nome"));
            System.out.println(" got " + c.getUsu_nome());
            c.setUsu_login(rs.getString("Usu_login"));
            c.setUsu_senha(rs.getString("Usu_senha"));
            c.setUsu_rg(rs.getString("Usu_rg"));
            c.setUsu_cpf(rs.getString("Usu_cpf"));
            c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
            c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
            c.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
            c.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
            c.setMed_NumRegistro(rs.getString("Med_NumRegistro"));

            medicos.add(c);
        }
        return medicos;
    }

    public MedicoDO pesquisarPorCrm2(String crm, int estado, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select u.*, m.* from Usuario as u inner join Medico as "
                + "m on u.Usu_cod = m.Usuario_Usu_cod where m.Med_NumRegistro = ?"
                + "and m.Estado_Est_cod_conselho_emissor = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, crm);
        ps.setInt(2, estado);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            MedicoDO m = new MedicoDO();
            if (rs.getBoolean("Usu_ativo")) {
                m.setUsu_cod(rs.getInt("Usu_cod"));
                m.setUsu_nome(rs.getString("Usu_nome"));
                m.setUsu_login(rs.getString("Usu_login"));
                m.setUsu_rg(rs.getString("Usu_rg"));
                m.setUsu_cpf(rs.getString("Usu_cpf"));
                m.setUsu_ativo(rs.getBoolean("Usu_ativo"));
                m.setUsu_foto(rs.getBinaryStream("Usu_foto"));
                m.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
                m.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
                m.setMed_NumRegistro(rs.getString("Med_NumRegistro"));
            }
            return m;
        }

        return null;

    }

    public Vector pesquisarMedicoPorNome(String nome, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * "
                + "from Usuario inner join Medico "
                + "on Usuario.Usu_cod = Medico.Usuario_Usu_Cod "
                + "where Usu_nome like %?% ";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, nome);
        ResultSet rs = ps.executeQuery();
        Vector medicos = new Vector();
        while (rs.next()) {
            MedicoDO c = new MedicoDO();
            c.setUsu_cod(rs.getInt("Usu_cod"));
            c.setUsu_nome(rs.getString("Usu_nome"));
            System.out.println(" got " + c.getUsu_nome());
            c.setUsu_login(rs.getString("Usu_login"));
            c.setUsu_senha(rs.getString("Usu_senha"));
            c.setUsu_rg(rs.getString("Usu_rg"));
            c.setUsu_cpf(rs.getString("Usu_cpf"));
            c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
            c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
            c.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
            c.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
            c.setMed_NumRegistro(rs.getString("Med_NumRegistro"));

            medicos.add(c);
        }
        return medicos;
    }

    public Vector pesquisarMedicoPorRg(String rg, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * "
                + "from Usuario inner join Medico "
                + "on Usuario.Usu_cod = Medico.Usuario_Usu_Cod "
                + "where Usu_rg like ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, rg);
        ResultSet rs = ps.executeQuery();
        Vector medicos = new Vector();
        while (rs.next()) {
            MedicoDO c = new MedicoDO();
            c.setUsu_cod(rs.getInt("Usu_cod"));
            c.setUsu_nome(rs.getString("Usu_nome"));
            System.out.println(" got " + c.getUsu_nome());
            c.setUsu_login(rs.getString("Usu_login"));
            c.setUsu_senha(rs.getString("Usu_senha"));
            c.setUsu_rg(rs.getString("Usu_rg"));
            c.setUsu_cpf(rs.getString("Usu_cpf"));
            c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
            c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
            c.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
            c.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
            c.setMed_NumRegistro(rs.getString("Med_NumRegistro"));

            medicos.add(c);
        }
        return medicos;
    }

    public Vector pesquisarMedicoPorCpf(String cpf, Transacao tr) throws Exception {
        Connection con = tr.obterConexao();
        String sql = "select * "
                + "from Usuario inner join Medico "
                + "on Usuario.Usu_cod = Medico.Usuario_Usu_Cod "
                + "and Usu_cpf like ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, cpf);
        ResultSet rs = ps.executeQuery();
        Vector medicos = new Vector();
        while (rs.next()) {
            MedicoDO c = new MedicoDO();
            c.setUsu_cod(rs.getInt("Usu_cod"));
            c.setUsu_nome(rs.getString("Usu_nome"));
            System.out.println(" got " + c.getUsu_nome());
            c.setUsu_login(rs.getString("Usu_login"));
            c.setUsu_senha(rs.getString("Usu_senha"));
            c.setUsu_rg(rs.getString("Usu_rg"));
            c.setUsu_cpf(rs.getString("Usu_cpf"));
            c.setUsu_foto(rs.getBinaryStream("Usu_foto"));
            c.setUsu_ativo(rs.getBoolean("Usu_ativo"));
            c.setConselhos_Con_cod(rs.getInt("Conselhos_Con_cod"));
            c.setEstado_Est_cod_conselho_emissor(rs.getInt("Estado_Est_cod_conselho_emissor"));
            c.setMed_NumRegistro(rs.getString("Med_NumRegistro"));

            medicos.add(c);
        }
        return medicos;
    }

}// MedicoDATA
