package ifam.br.model;

import org.hibernate.annotations.ManyToAny;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Diciplina {

    @Id@GeneratedValue
    private Integer codigo;
    private String nome;
    @ManyToOne
    private Curso curso;

    public Diciplina(String nome, Curso curso) {
        this.nome = nome;
        this.curso = curso;
    }

    public Diciplina() {}

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
