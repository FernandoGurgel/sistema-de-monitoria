package ifam.br.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Disciplina {

    @Id
    @GeneratedValue
    private Long discodigo;
    private String disnome;
    @ManyToOne
    private Curso curso;

    public Disciplina() {
    }

    public Disciplina(String disnome, Curso curso) {
        this.disnome = disnome;
        this.curso = curso;
    }

    public Long getDiscodigo() {
        return discodigo;
    }

    public void setDiscodigo(Long discodigo) {
        this.discodigo = discodigo;
    }

    public String getDisnome() {
        return disnome;
    }

    public void setDisnome(String disnome) {
        this.disnome = disnome;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
}
