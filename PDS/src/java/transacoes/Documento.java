/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transacoes;

import documentos.DocumentoDO;
import documentos.DocumentoData;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Transacao;

/**
 *
 * @author Lucas
 */
public class Documento {
    
    public boolean incluir (DocumentoDO documento) {
        
        try {
            Transacao tr = new Transacao();
            
            tr.begin();
            DocumentoData docdata = new DocumentoData();
            docdata.incluir(documento, tr);
            tr.commit();
            
            return true;
        } catch (Exception ex) {
            Logger.getLogger(Documento.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("erro ao incluir documento" + documento.getCod());
        }
        
        return false;
    }
    
    public static void main(String[] args) throws FileNotFoundException, Exception {
        
            DocumentoDO documento = new DocumentoDO();
            File file = new File("C:/Users/aluno/Desktop/Teste.pdf");
            FileInputStream exame = new FileInputStream(file);
            documento.setExame(exame);
            documento.setResumo("teste");
            documento.setTipExa_cod(1);
            documento.setMed_cod(6);
            documento.setPac_cod(1);
            documento.setTec_cod(11);
            documento.setExcluido(false);
            documento.setData_upload(null);
            documento.setPrevisao(null);
            
            Documento doc = new Documento();
            doc.incluir(documento);
        
        
    }
    
}
