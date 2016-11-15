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
    
    public MedicoDO buscarMedico(int idobj) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              MedicoDATA cdata = new MedicoDATA();
              MedicoDO c = cdata.buscar(idobj, tr);
            tr.commit();
            return c;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
    
    public PacienteDO buscarPaciente(int idobj) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              PacienteDATA cdata = new PacienteDATA();
              PacienteDO c = cdata.buscar(idobj, tr);
            tr.commit();
            return c;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }
    
    public TecnicoDO buscarTecnico(int idobj) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
              TecnicoDATA cdata = new TecnicoDATA();
              TecnicoDO c = cdata.buscar(idobj, tr);
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
