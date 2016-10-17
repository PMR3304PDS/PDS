
package data;

import java.io.FileInputStream;

public class UsuarioDO {
  private int _Usu_cod;
  private String _Usu_login;
  private String _Usu_senha;
  private String _Usu_nome;
  private String _Usu_rg;
  private String _Usu_cpf;
  private FileInputStream _Usu_foto;
  private boolean _Usu_ativo;

    public int getUsu_cod() {
        return _Usu_cod;
    }

    public void setUsu_cod(int _Usu_cod) {
        this._Usu_cod = _Usu_cod;
    }

    public String getUsu_login() {
        return _Usu_login;
    }

    public void setUsu_login(String _Usu_login) {
        this._Usu_login = _Usu_login;
    }

    public String getUsu_senha() {
        return _Usu_senha;
    }

    public void setUsu_senha(String _Usu_senha) {
        this._Usu_senha = _Usu_senha;
    }

    public String getUsu_nome() {
        return _Usu_nome;
    }

    public void setUsu_nome(String _Usu_nome) {
        this._Usu_nome = _Usu_nome;
    }

    public String getUsu_rg() {
        return _Usu_rg;
    }

    public void setUsu_rg(String _Usu_rg) {
        this._Usu_rg = _Usu_rg;
    }

    public String getUsu_cpf() {
        return _Usu_cpf;
    }

    public void setUsu_cpf(String _Usu_cpf) {
        this._Usu_cpf = _Usu_cpf;
    }

    public FileInputStream getUsu_foto() {
        return _Usu_foto;
    }

    public void setUsu_foto(FileInputStream _Usu_foto) {
        this._Usu_foto = _Usu_foto;
    }

    public boolean isUsu_ativo() {
        return _Usu_ativo;
    }

    public void setUsu_ativo(boolean _Usu_ativo) {
        this._Usu_ativo = _Usu_ativo;
    }  
}
