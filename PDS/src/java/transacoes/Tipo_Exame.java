/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Tipo_Exame {
    public List<Tipo_ExameDO> buscar() throws Exception{
        Transacao tr = new Transacao();
        
        try {

            tr.begin();
            Tipo_ExameData tipo = new Tipo_ExameData();
            return tipo.buscar(tr);
            
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar ");
            e.printStackTrace();
        }
        
        return null;
    }
    
    public Tipo_ExameDO buscar(int idobj) throws Exception {
        Transacao tr = new Transacao();
        try {
          tr.beginReadOnly();
            Tipo_ExameData tp = new Tipo_ExameData();
            Tipo_ExameDO t = tp.buscar(idobj, tr);
          tr.commit();
          return t;
        } catch (Exception e) {
          tr.rollback();
          e.printStackTrace();
        }
        return null;
    }
    
}
