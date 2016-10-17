/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author gabri
 */
public class AvaliacaoDO {
    
    private int Ava_cod;
    private int Medico_Usuario_Usu_cod;
    private int Paciente_Usuario_Usu_cod;
    private int Num_Aval;

    public int getNum_Aval() {
        return Num_Aval;
    }

    public void setNum_Aval(int Num_Aval) {
        this.Num_Aval = Num_Aval;
    }

    
    public int getAva_cod() {
        return Ava_cod;
    }

    public void setAva_cod(int Ava_cod) {
        this.Ava_cod = Ava_cod;
    }

    public int getMedico_Usuario_Usu_cod() {
        return Medico_Usuario_Usu_cod;
    }

    public void setMedico_Usuario_Usu_cod(int Medico_Usuario_Usu_cod) {
        this.Medico_Usuario_Usu_cod = Medico_Usuario_Usu_cod;
    }

    public int getPaciente_Usuario_Usu_cod() {
        return Paciente_Usuario_Usu_cod;
    }

    public void setPaciente_Usuario_Usu_cod(int Paciente_Usuario_Usu_cod) {
        this.Paciente_Usuario_Usu_cod = Paciente_Usuario_Usu_cod;
    }
    
    
    
}
