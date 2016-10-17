package data;

import java.sql.Date;

public class Comentarios_ExameDO {
  private int ComExa_cod;
  private Date ComExa_data;
  private String ComExa_comentario;
  private int Medico_Usuario_Usu_cod;
  private int Exame_Exa_cod;
  private boolean Com_Exa_excluido;

    public int getComExa_cod() {
        return ComExa_cod;
    }

    public void setComExa_cod(int ComExa_cod) {
        this.ComExa_cod = ComExa_cod;
    }

    public Date getComExa_data() {
        return ComExa_data;
    }

    public void setComExa_data(Date ComExa_data) {
        this.ComExa_data = ComExa_data;
    }

    public String getComExa_comentario() {
        return ComExa_comentario;
    }

    public void setComExa_comentario(String ComExa_comentario) {
        this.ComExa_comentario = ComExa_comentario;
    }

    public int getMedico_Usuario_Usu_cod() {
        return Medico_Usuario_Usu_cod;
    }

    public void setMedico_Usuario_Usu_cod(int Medico_Usuario_Usu_cod) {
        this.Medico_Usuario_Usu_cod = Medico_Usuario_Usu_cod;
    }

    public int getExame_Exa_cod() {
        return Exame_Exa_cod;
    }

    public void setExame_Exa_cod(int Exame_Exa_cod) {
        this.Exame_Exa_cod = Exame_Exa_cod;
    }

    public boolean isCom_Exa_excluido() {
        return Com_Exa_excluido;
    }

    public void setCom_Exa_excluido(boolean Com_Exa_excluido) {
        this.Com_Exa_excluido = Com_Exa_excluido;
    }

    
  
} // ContatoDO
