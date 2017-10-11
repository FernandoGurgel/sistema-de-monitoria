package ifam.br.model;

import javafx.beans.property.LongProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class AlunoProperty {

    private final StringProperty nome = new SimpleStringProperty();
    private StringProperty telefone;
    private StringProperty email;
    private CursoProperty curso;
    private StringProperty senha;
    private LongProperty matricula;
    private StringProperty modulo;

    public AlunoProperty() {
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

    public String getTelefone() {
        return telefone.get();
    }

    public StringProperty telefoneProperty() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone.set(telefone);
    }

    public String getEmail() {
        return email.get();
    }

    public StringProperty emailProperty() {
        return email;
    }

    public void setEmail(String email) {
        this.email.set(email);
    }

    public CursoProperty getCurso() {
        return curso;
    }

    public void setCurso(CursoProperty curso) {
        this.curso = curso;
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

    public long getMatricula() {
        return matricula.get();
    }

    public LongProperty matriculaProperty() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula.set(matricula);
    }

    public String getModulo() {
        return modulo.get();
    }

    public StringProperty moduloProperty() {
        return modulo;
    }

    public void setModulo(int index) {
        String valor = null;
        if (index == 1){
            valor = String.valueOf(EModulo.Comum);
        }else{
            valor = String.valueOf(EModulo.Monitor);
        }
        this.modulo.set(valor);
    }
}
