
package transacoes;

import data.*;
import utils.*;

/**
 *
 * @author aluno
 */
public class vis_inf_cns {
    public ConsultaDO busca_cns(int cns_cod)
    {
        Transacao tr = new Transacao();
        
        try
        {
            tr.beginReadOnly();
            ConsultaDATA cdata = new ConsultaDATA();
            ConsultaDO cdo = new ConsultaDO();
            cdo = cdata.buscar(cns_cod, tr);
            return cdo;
        }
        catch(Exception e)
        {
            //tr.rollback();
            System.out.println("erro ao buscar consulta");
            e.printStackTrace();
            return null;
        }
    }
    
    public MedicoDO busca_med(int med_cod)
    {
        Transacao tr = new Transacao();
        
        try
        {
            tr.beginReadOnly();
            MedicoDATA mdata = new MedicoDATA();
            MedicoDO mdo = new MedicoDO();
            mdo = mdata.buscar(med_cod, tr);
            return mdo;
        }
        catch(Exception e)
        {
            //tr.rollback();
            System.out.println("erro ao buscar medico");
            e.printStackTrace();
            return null;
        }
    }
    
    public PacienteDO busca_pac(int pac_cod)
    {
        Transacao tr = new Transacao();
        
        try
        {
            tr.beginReadOnly();
            PacienteDATA pdata = new PacienteDATA();
            PacienteDO pdo = new PacienteDO();
            pdo = pdata.buscar(pac_cod, tr);
            return pdo;
        }
        catch(Exception e)
        {
            //tr.rollback();
            System.out.println("erro ao buscar paciente");
            e.printStackTrace();
            return null;
        }
    }
}
