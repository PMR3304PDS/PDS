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
public class MedicoDO {
    private int Usuario_Usu_cod;
    private int Conselhos_Con_cond;
    private int Estado_Est_cod_conselho_emissor;

    public int getUsuario_Usu_cod() {
        return Usuario_Usu_cod;
    }

    public void setUsuario_Usu_cod(int Usuario_Usu_cod) {
        this.Usuario_Usu_cod = Usuario_Usu_cod;
    }

    public int getConselhos_Con_cond() {
        return Conselhos_Con_cond;
    }

    public void setConselhos_Con_cond(int Conselhos_Con_cond) {
        this.Conselhos_Con_cond = Conselhos_Con_cond;
    }

    public int getEstado_Est_cod_conselho_emissor() {
        return Estado_Est_cod_conselho_emissor;
    }

    public void setEstado_Est_cod_conselho_emissor(int Estado_Est_cod_conselho_emissor) {
        this.Estado_Est_cod_conselho_emissor = Estado_Est_cod_conselho_emissor;
    }
    
}
