package ifam.br.model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.StringProperty;

public class CursoProperty {

    private IntegerProperty codigo;
    private StringProperty nome;

    public int getCodigo() {
        return codigo.get();
    }

    public IntegerProperty codigoProperty() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo.set(codigo);
    }

    public String getNome() {
        return nome.get();
    }

    public StringProperty nomeProperty() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome.set(nome);
    }
}
