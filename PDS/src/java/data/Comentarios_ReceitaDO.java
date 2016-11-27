package data;

import java.sql.Date;

public class Comentarios_ReceitaDO {
  private int ComRec_cod;
  private Date ComRec_data;
  private String ComRec_comentario;
  private int Tecnico_Usuario_Usu_cod;
  private int Medico_Usuario_Usu_cod;
  private int Receita_Rec_cod;
  private boolean Com_Rec_excluido;

    public int getComRec_cod() {
        return ComRec_cod;
    }

    public void setComRec_cod(int ComRec_cod) {
        this.ComRec_cod = ComRec_cod;
    }

    public Date getComRec_data() {
        return ComRec_data;
    }

    public void setComRec_data(Date ComRec_data) {
        this.ComRec_data = ComRec_data;
    }

    public String getComRec_comentario() {
        return ComRec_comentario;
    }

    public void setComRec_comentario(String ComRec_comentario) {
        this.ComRec_comentario = ComRec_comentario;
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

    public int getReceita_Rec_cod() {
        return Receita_Rec_cod;
    }

    public void setReceita_Rec_cod(int Receita_Rec_cod) {
        this.Receita_Rec_cod = Receita_Rec_cod;
    }

    public boolean isCom_Rec_excluido() {
        return Com_Rec_excluido;
    }

    public void setCom_Rec_excluido(boolean Com_Rec_excluido) {
        this.Com_Rec_excluido = Com_Rec_excluido;
    }
  
} // ContatoDO
