package transacoes;

import utils.*;
import data.*;
import java.util.*;

/**
 *
 * @author Renan
 */
public class UsuarioTransacao {
   
    public boolean incluir (UsuarioDO usuario) throws Exception{

     // validacao das regras de negocio
     if ( (isEmpty(usuario.getUsu_nome())) ) {
       return false;
     }

     // efetuando a transacao
     Transacao tr = new Transacao();
     try {

       tr.begin();
         UsuarioData udata = new UsuarioData();
         udata.incluir(usuario, tr);
       tr.commit();
       return true;
       
     } catch(Exception e) {
         tr.rollback();
         System.out.println("erro ao incluir " + usuario.getUsu_nome());
         e.printStackTrace();
     }
     return false;
  } // incluir
    
    public UsuarioDO buscar(String user_name) throws Exception {
        Transacao tr = new Transacao();
            try {
                tr.beginReadOnly();
                  UsuarioData cdata = new UsuarioData();
                  UsuarioDO c = cdata.pesquisarPorLogin(user_name, tr);
                tr.commit();
                return c;
            } catch (Exception e) {
                tr.rollback();
                System.out.println("Error!");
                e.printStackTrace();
            }
            return null;
    }
    
    private boolean isEmpty(String s) {
     if (null == s)
       return true;
     if (s.length() == 0)
       return true;
     return false;
  }
    
}
