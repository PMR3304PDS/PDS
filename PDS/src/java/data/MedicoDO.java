/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author aluno
 */
public class MedicoDO extends UsuarioDO {
    private int Conselhos_Con_cod;
    private int Estado_Est_cod_conselho_emissor;
    private String Med_NumRegistro;

    public String getMed_NumRegistro() {
        return Med_NumRegistro;
    }

    public void setMed_NumRegistro(String Med_NumRegistro) {
        this.Med_NumRegistro = Med_NumRegistro;
    }
    
    public int getConselhos_Con_cod() {
        return Conselhos_Con_cod;
    }

    public void setConselhos_Con_cod(int Conselhos_Con_cod) {
        this.Conselhos_Con_cod = Conselhos_Con_cod;
    }

    public int getEstado_Est_cod_conselho_emissor() {
        return Estado_Est_cod_conselho_emissor;
    }

    public void setEstado_Est_cod_conselho_emissor(int Estado_Est_cod_conselho_emissor) {
        this.Estado_Est_cod_conselho_emissor = Estado_Est_cod_conselho_emissor;
    }
    
}
