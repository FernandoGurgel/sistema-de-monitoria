package ifam.br.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Aluno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long matricula;
    private String nome;
    private String telefone;
    private String email;
    private String senha;
    private EModulo modulo;
    @ManyToOne
    private Curso curso;

    public Aluno() {
    }

    public Aluno(String nome, String telefone, String email, String senha, EModulo modulo, Curso curso) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
        this.modulo = modulo;
        this.curso = curso;
    }

    public Aluno(Long mart,String nome, String telefone, String email, String senha, EModulo modulo, Curso curso) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
        this.modulo = modulo;
        this.curso = curso;
        this.matricula =  mart;
    }


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public long getMatricula() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula = matricula;
    }

    public EModulo getModulo() {
        return modulo;
    }

    public void setModulo(EModulo modulo) {
        this.modulo = modulo;
    }
}
