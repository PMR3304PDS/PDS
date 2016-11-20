package data;


public class FarmaceuticoDO extends UsuarioDO {
    
    private int Conselhos_Con_cod;
    private int Estado_Est_cod_conselho_emissor;
    
    public int getConselhos_Con_cod() {
        return Conselhos_Con_cod;
    }

    public void setConselhos_Con_cod(int Conselhos_Con_cod) {
        this.Conselhos_Con_cod = Conselhos_Con_cod;
    }

    public int getEstado_Est_cod_conselho_emissor() {
        return Estado_Est_cod_conselho_emissor;
    }

    public void setEstado_Est_cod_conselho_emissor(int Estado_Est_cod_conselho_emissor) {
        this.Estado_Est_cod_conselho_emissor = Estado_Est_cod_conselho_emissor;
    }
}
