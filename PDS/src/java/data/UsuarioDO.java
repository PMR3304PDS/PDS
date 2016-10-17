
package data;

import java.io.FileInputStream;

public class UsuarioDO {
  private int Usu_cod;
  private String Usu_login;
  private String Usu_senha;
  private String Usu_nome;
  private String Usu_rg;
  private String Usu_cpf;
  private FileInputStream Usu_foto;
  private boolean Usu_ativo;

    public int getUsu_cod() {
        return Usu_cod;
    }

    public void setUsu_cod(int Usu_cod) {
        this.Usu_cod = Usu_cod;
    }

    public String getUsu_login() {
        return Usu_login;
    }

    public void setUsu_login(String Usu_login) {
        this.Usu_login = Usu_login;
    }

    public String getUsu_senha() {
        return Usu_senha;
    }

    public void setUsu_senha(String Usu_senha) {
        this.Usu_senha = Usu_senha;
    }

    public String getUsu_nome() {
        return Usu_nome;
    }

    public void setUsu_nome(String Usu_nome) {
        this.Usu_nome = Usu_nome;
    }

    public String getUsu_rg() {
        return Usu_rg;
    }

    public void setUsu_rg(String Usu_rg) {
        this.Usu_rg = Usu_rg;
    }

    public String getUsu_cpf() {
        return Usu_cpf;
    }

    public void setUsu_cpf(String Usu_cpf) {
        this.Usu_cpf = Usu_cpf;
    }

    public FileInputStream getUsu_foto() {
        return Usu_foto;
    }

    public void setUsu_foto(FileInputStream Usu_foto) {
        this.Usu_foto = Usu_foto;
    }

    public boolean isUsu_ativo() {
        return Usu_ativo;
    }

    public void setUsu_ativo(boolean Usu_ativo) {
        this.Usu_ativo = Usu_ativo;
    }

    
}
