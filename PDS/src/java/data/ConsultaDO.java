package data;
import java.sql.Date;

public class ConsultaDO {
  private int Cns_cod;
  private int Medico_Usuario_Usu_cod;
  private int Paciente_Usuario_Usu_cod;
  private Date Cns_data;
  private String Cns_resumo;
  private int Exame_Exa_cod;
  private int Receita_Rec_cod;
  
    public int getCns_cod() {
        return Cns_cod;
    }

    public void setCns_cod(int Con_cod) {
        this.Cns_cod = Con_cod;
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

    public Date getCns_data() {
        return Cns_data;
    }

    public void setCns_data(Date Cns_data) {
        this.Cns_data = Cns_data;
    }

    public String getCns_resumo() {
        return Cns_resumo;
    }

    public void setCns_resumo(String Cns_resumo) {
        this.Cns_resumo = Cns_resumo;
    }

}