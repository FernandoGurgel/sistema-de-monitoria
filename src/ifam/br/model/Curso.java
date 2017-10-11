package ifam.br.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Curso {

    @Id
    @GeneratedValue
    private Long curcodigo;
    private String curnome;

    public Curso(String curnome) {
        this.curnome = curnome;
    }

    public Curso() {

    }

    public Long getCurcodigo() {
        return curcodigo;
    }

    public void setCurcodigo(Long curcodigo) {
        this.curcodigo = curcodigo;
    }

    public String getCurnome() {
        return curnome;
    }

    public void setCurnome(String curnome) {
        this.curnome = curnome;
    }
}
