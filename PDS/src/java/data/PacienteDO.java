/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Date;

/**
 *
 * @author aluno
 */
public class PacienteDO extends UsuarioDO {
    private Date Pac_nascimento;
    private float Pac_peso;
    private float Pac_altura;
    private String Pac_alergias;
    private String Pac_medicamentos;
    private String Pac_doencas_tratamento;

    public Date getPac_nascimento() {
        return Pac_nascimento;
    }

    public void setPac_nascimento(Date Pac_nascimento) {
        this.Pac_nascimento = Pac_nascimento;
    }

    public float getPac_peso() {
        return Pac_peso;
    }

    public void setPac_peso(float Pac_peso) {
        this.Pac_peso = Pac_peso;
    }

    public float getPac_altura() {
        return Pac_altura;
    }

    public void setPac_altura(float Pac_altura) {
        this.Pac_altura = Pac_altura;
    }

    public String getPac_alergias() {
        return Pac_alergias;
    }

    public void setPac_alergias(String Pac_alergias) {
        this.Pac_alergias = Pac_alergias;
    }

    public String getPac_medicamentos() {
        return Pac_medicamentos;
    }

    public void setPac_medicamentos(String Pac_medicamentos) {
        this.Pac_medicamentos = Pac_medicamentos;
    }

    public String getPac_doencas_tratamento() {
        return Pac_doencas_tratamento;
    }

    public void setPac_doencas_tratamento(String Pac_doencas_tratamento) {
        this.Pac_doencas_tratamento = Pac_doencas_tratamento;
    }

    public String getPac_historico_doencas() {
        return Pac_historico_doencas;
    }

    public void setPac_historico_doencas(String Pac_historico_doencas) {
        this.Pac_historico_doencas = Pac_historico_doencas;
    }
    private String Pac_historico_doencas;
}
