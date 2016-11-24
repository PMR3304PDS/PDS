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
 * @author Lucas
 */
public class Consulta {
    public boolean incluir (ConsultaDO consulta) throws Exception{
        if ( (isEmpty(consulta.getCns_resumo()))) {
            return false;
        }
     
        Transacao tr = new Transacao();
        try {

            tr.begin();
            ConsultaDATA consultadata = new ConsultaDATA();
            consultadata.incluir(consulta, tr);
            tr.commit();
            return true;
       
        } catch(Exception e) {
            tr.rollback();
            System.out.println("erro ao incluir ");
            e.printStackTrace();
        }
        return false;
    }
    
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
    
    private boolean isEmpty(String s){
        if (null == s)
            return true;
        if (s.length() == 0)
            return true;
        return false;
    }
}
