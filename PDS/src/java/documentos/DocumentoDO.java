/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package documentos;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Date;

/**
 *
 * @author Lucas
 */
public class DocumentoDO {
    private int _cod;
    private FileInputStream _exame;
    private String _resumo;
    private int _TipExa_cod;
    private int _Tec_cod;
    private int _Pac_cod;
    private int _Med_cod;
    private boolean _excluido;
    private Date _data_upload;
    private Date _previsao;

    public int getCod() {
        return _cod;
    }

    public void setCod(int _cod) {
        this._cod = _cod;
    }

    public FileInputStream getExame() {
        return _exame;
    }

    public void setExame(FileInputStream _exame) {
        this._exame = _exame;
    }

    public String getResumo() {
        return _resumo;
    }

    public void setResumo(String _resumo) {
        this._resumo = _resumo;
    }

    public int getTipExa_cod() {
        return _TipExa_cod;
    }

    public void setTipExa_cod(int _TipExa_cod) {
        this._TipExa_cod = _TipExa_cod;
    }

    public int getTec_cod() {
        return _Tec_cod;
    }

    public void setTec_cod(int _Tec_cod) {
        this._Tec_cod = _Tec_cod;
    }

    public int getPac_cod() {
        return _Pac_cod;
    }

    public void setPac_cod(int _Pac_cod) {
        this._Pac_cod = _Pac_cod;
    }

    public int getMed_cod() {
        return _Med_cod;
    }

    public void setMed_cod(int _Med_cod) {
        this._Med_cod = _Med_cod;
    }

    public boolean isExcluido() {
        return _excluido;
    }

    public void setExcluido(boolean _excluido) {
        this._excluido = _excluido;
    }

    public Date getData_upload() {
        return _data_upload;
    }

    public void setData_upload(Date _data_upload) {
        this._data_upload = _data_upload;
    }

    public Date getPrevisao() {
        return _previsao;
    }

    public void setPrevisao(Date _previsao) {
        this._previsao = _previsao;
    }
    
    
    
}
