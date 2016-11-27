package data;

import java.io.InputStream;
import java.sql.Date;

public class ExameDO {
    
    private int Exa_cod;
    private String Exa_resumo;
    private InputStream Exa_exame;
    private InputStream Exa_Solicitar; 
    private int Tipo_Exame_TipExa_cod;
    private Integer Tecnico_Usuario_Usu_cod_uploader;
    private int Paciente_Usuario_Usu_cod;
    private Integer Medico_Usuario_Usu_cod_uploader;
    private boolean Exa_excluido;
    private Date Exa_data_upload;
    private Date Exa_previsao;

    public InputStream getExa_exame() {
        return Exa_exame;
    }

    public void setExa_exame(InputStream Exa_exame) {
        this.Exa_exame = Exa_exame;
    }

    public InputStream getExa_Solicitar() {
        return Exa_Solicitar;
    }

    public void setExa_Solicitar(InputStream Exa_Solicitar) {
        this.Exa_Solicitar = Exa_Solicitar;
    }

    public int getExa_cod() {
        return Exa_cod;
    }

    public void setExa_cod(int Exa_cod) {
        this.Exa_cod = Exa_cod;
    }

    public String getExa_resumo() {
        return Exa_resumo;
    }

    public void setExa_resumo(String Exa_resumo) {
        this.Exa_resumo = Exa_resumo;
    }

    public int getTipo_Exame_TipExa_cod() {
        return Tipo_Exame_TipExa_cod;
    }

    public void setTipo_Exame_TipExa_cod(int Tipo_Exame_TipExa_cod) {
        this.Tipo_Exame_TipExa_cod = Tipo_Exame_TipExa_cod;
    }

    public Integer getTecnico_Usuario_Usu_cod_uploader() {
        return Tecnico_Usuario_Usu_cod_uploader;
    }

    public void setTecnico_Usuario_Usu_cod_uploader(Integer Tecnico_Usuario_Usu_cod_uploader) {
        this.Tecnico_Usuario_Usu_cod_uploader = Tecnico_Usuario_Usu_cod_uploader;
    }

    public int getPaciente_Usuario_Usu_cod() {
        return Paciente_Usuario_Usu_cod;
    }

    public void setPaciente_Usuario_Usu_cod(int Paciente_Usuario_Usu_cod) {
        this.Paciente_Usuario_Usu_cod = Paciente_Usuario_Usu_cod;
    }

    public Integer getMedico_Usuario_Usu_cod_uploader() {
        return Medico_Usuario_Usu_cod_uploader;
    }

    public void setMedico_Usuario_Usu_cod_uploader(Integer Medico_Usuario_Usu_cod_uploader) {
        this.Medico_Usuario_Usu_cod_uploader = Medico_Usuario_Usu_cod_uploader;
    }

    public boolean isExa_excluido() {
        return Exa_excluido;
    }

    public void setExa_excluido(boolean Exa_excluido) {
        this.Exa_excluido = Exa_excluido;
    }

    public Date getExa_data_upload() {
        return Exa_data_upload;
    }

    public void setExa_data_upload(Date Exa_data_upload) {
        this.Exa_data_upload = Exa_data_upload;
    }

    public Date getExa_previsao() {
        return Exa_previsao;
    }

    public void setExa_previsao(Date Exa_previsao) {
        this.Exa_previsao = Exa_previsao;
    }
    
}
