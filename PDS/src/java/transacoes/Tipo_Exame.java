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
            System.out.println("erro ao incluir ");
            e.printStackTrace();
        }
        
        return null;
    }
}
