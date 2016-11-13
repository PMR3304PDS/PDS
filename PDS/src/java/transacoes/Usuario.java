package transacoes;

import utils.*;
import data.*;
import java.util.*;

/**
 *
 * @author Renan
 */
public class Usuario{
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
}
