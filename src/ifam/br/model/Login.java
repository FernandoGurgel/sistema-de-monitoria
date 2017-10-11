package ifam.br.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Login {

    @Id
    @GeneratedValue
    private Long logcodigo;
    private String lognome;
    private String logsenha;

    public Login(String lognome, String logsenha) {
        this.lognome = lognome;
        this.logsenha = logsenha;
    }

    public Login() {
    }

    public Long getLogcodigo() {
        return logcodigo;
    }

    public void setLogcodigo(Long logcodigo) {
        this.logcodigo = logcodigo;
    }

    public String getLognome() {
        return lognome;
    }

    public void setLognome(String lognome) {
        this.lognome = lognome;
    }

    public String getLogsenha() {
        return logsenha;
    }

    public void setLogsenha(String logsenha) {
        this.logsenha = logsenha;
    }
}
