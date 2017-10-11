package ifam.br.model;

import javafx.beans.property.LongProperty;
import javafx.beans.property.StringProperty;

public class CoordenadorProperty {

    private StringProperty nome;
    private LongProperty matricula;
    private StringProperty senha;

    public String getNome() {
        return nome.get();
    }

    public StringProperty nomeProperty() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome.set(nome);
    }

    public long getMatricula() {
        return matricula.get();
    }

    public LongProperty matriculaProperty() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula.set(matricula);
    }

    public String getSenha() {
        return senha.get();
    }

    public StringProperty senhaProperty() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha.set(senha);
    }
}
