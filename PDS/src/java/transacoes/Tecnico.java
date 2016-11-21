package transacoes;

import utils.*;
import data.*;
import java.util.*;

public class Tecnico {

    public TecnicoDO buscar(int idobj) throws Exception {
        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            TecnicoDO t = (new TecnicoDATA()).buscar(idobj, tr);
            tr.commit();
            return t;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("erro ao buscar " + idobj);
            e.printStackTrace();
        }
        return null;
    } // 

    public Vector pesquisarTecnicoPorNome(String nome) throws Exception {
        if (isEmpty(nome)) {
            return null;
        }

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            TecnicoDATA cdata = new TecnicoDATA();
            Vector v = cdata.pesquisarTecnicoPorNome(nome, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }

    public Vector pesquisarTecnicoPorRg(String rg) throws Exception {
        if (isEmpty(rg)) {
            return null;
        }

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            TecnicoDATA cdata = new TecnicoDATA();
            Vector v = cdata.pesquisarTecnicoPorRg(rg, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }

    public Vector pesquisarTecnicoPorCpf(String cpf) throws Exception {
        if (isEmpty(cpf)) {
            return null;
        }

        Transacao tr = new Transacao();
        try {
            tr.beginReadOnly();
            TecnicoDATA cdata = new TecnicoDATA();
            Vector v = cdata.pesquisarTecnicoPorNome(cpf, tr);
            tr.commit();
            return v;
        } catch (Exception e) {
            tr.rollback();
            System.out.println("Error!");
            e.printStackTrace();
        }
        return null;
    }

    private boolean isEmpty(String s) {
        if (null == s) {
            return true;
        }
        if (s.length() == 0) {
            return true;
        }
        return false;
    }

}
