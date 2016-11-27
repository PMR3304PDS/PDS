package data;

import java.sql.Date;

public class MensagemDO {

  private int Msg_cod;
  private Date Msg_data;
  private String Msg_msg;
  private boolean Msg_visualizado;
  private int Usuario_emissor;
  private int Usuario_receptor;

  public int getMsg_cod() {
    return Msg_cod;
  }

  public Date getMsg_data() {
    return Msg_data;
  }

  public String getMsg_msg() {
    return Msg_msg;
  }

  public boolean isMsg_visualizado() {
    return Msg_visualizado;
  }

  public int getUsuario_emissor() {
    return Usuario_emissor;
  }

  public int getUsuario_receptor() {
    return Usuario_receptor;
  }

  public void setMsg_cod(int Msg_cod) {
    this.Msg_cod = Msg_cod;
  }

  public void setMsg_data(Date Msg_data) {
    this.Msg_data = Msg_data;
  }

  public void setMsg_msg(String Msg_msg) {
    this.Msg_msg = Msg_msg;
  }

  public void setMsg_visualizado(boolean Msg_visualizado) {
    this.Msg_visualizado = Msg_visualizado;
  }

  public void setUsuario_emissor(int Usuario_emissor) {
    this.Usuario_emissor = Usuario_emissor;
  }

  public void setUsuario_receptor(int Usuario_receptor) {
    this.Usuario_receptor = Usuario_receptor;
  }

}
