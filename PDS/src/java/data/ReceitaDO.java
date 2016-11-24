/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.InputStream;
import java.sql.Date;

/**
 *
 * @author aluno
 */
public class ReceitaDO {
    private int Rec_cod;
    private boolean Rec_excluido;
    private Date Rec_data_upload;
    private int Paciente_Usuario_Usu_cod;
    private int Farmaceutico_Usuario_Usu_cod;
    private int Tecnico_Usuario_Usu_cod;
    private int Medico_Usuario_Usu_cod;
    private boolean Rec_check;
    private InputStream Rec_receita;
    private String Rec_resumo;

    public int getRec_cod() {
        return Rec_cod;
    }

    public void setRec_cod(int Rec_cod) {
        this.Rec_cod = Rec_cod;
    }

    public boolean isRec_excluido() {
        return Rec_excluido;
    }

    public void setRec_excluido(boolean Rec_excluido) {
        this.Rec_excluido = Rec_excluido;
    }

    public Date getRec_data_upload() {
        return Rec_data_upload;
    }

    public void setRec_data_upload(Date Rec_data_upload) {
        this.Rec_data_upload = Rec_data_upload;
    }

    public int getPaciente_Usuario_Usu_cod() {
        return Paciente_Usuario_Usu_cod;
    }

    public void setPaciente_Usuario_Usu_cod(int Paciente_Usuario_Usu_cod) {
        this.Paciente_Usuario_Usu_cod = Paciente_Usuario_Usu_cod;
    }

    public int getFarmaceutico_Usuario_Usu_cod() {
        return Farmaceutico_Usuario_Usu_cod;
    }

    public void setFarmaceutico_Usuario_Usu_cod(int Farmaceutico_Usuario_Usu_cod) {
        this.Farmaceutico_Usuario_Usu_cod = Farmaceutico_Usuario_Usu_cod;
    }

    public int getTecnico_Usuario_Usu_cod() {
        return Tecnico_Usuario_Usu_cod;
    }

    public void setTecnico_Usuario_Usu_cod(int Tecnico_Usuario_Usu_cod) {
        this.Tecnico_Usuario_Usu_cod = Tecnico_Usuario_Usu_cod;
    }

    public int getMedico_Usuario_Usu_cod() {
        return Medico_Usuario_Usu_cod;
    }

    public void setMedico_Usuario_Usu_cod(int Medico_Usuario_Usu_cod) {
        this.Medico_Usuario_Usu_cod = Medico_Usuario_Usu_cod;
    }

    public boolean isRec_check() {
        return Rec_check;
    }

    public void setRec_check(boolean Rec_check) {
        this.Rec_check = Rec_check;
    }

    public InputStream getRec_receita() {
        return Rec_receita;
    }

    public void setRec_receita(InputStream Rec_receita) {
        this.Rec_receita = Rec_receita;
    }

    public String getRec_resumo() {
        return Rec_resumo;
    }

    public void setRec_resumo(String Rec_resumo) {
        this.Rec_resumo = Rec_resumo;
    }
    
    public String getRec_resumo(String Rec_resumo) {
        return Rec_resumo;
    }
    
    
}
