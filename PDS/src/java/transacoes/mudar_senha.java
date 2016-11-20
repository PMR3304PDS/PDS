/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;

/**
 *
 * @author Eduardo Della Noce
 */
public class mudar_senha {
    public boolean mudar_senha(UsuarioDO usuario, String senha_antiga, String senha_nova) throws Exception
    {
        if((usuario.getUsu_senha()==null)||(senha_antiga == null)||(senha_nova==null))
            return false;
        
        Transacao tr = new Transacao();
        
        try
        {
            tr.begin();
            UsuarioData udata = new UsuarioData();
            if(senha_antiga.equals(usuario.getUsu_senha()))
            {
                usuario.setUsu_senha(senha_nova);
                udata.atualizar(usuario,tr);
                tr.commit();
                return true;
            }
        }
        catch(Exception e)
        {
            tr.rollback();
            System.out.println("erro ao mudar a senha de " + usuario.getUsu_nome());
            e.printStackTrace();
        }
        return false;
    }
}
