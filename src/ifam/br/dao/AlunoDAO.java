package ifam.br.dao;

import ifam.br.model.Aluno;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class AlunoDAO {

    private final EntityManager entityManager ;  //Um atributo final de uma classe pode ter seu valor atribuído uma única vez, seja na própria declaração ou no construtor.

    public AlunoDAO(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Aluno save(Aluno curso) {
        try {
            System.out.println("Salvando um curso.");
            // Inicia uma transação com o banco de dados.
            entityManager.getTransaction().begin();
            // Insere objeto no BD.
            entityManager.persist(curso);
            // Sincroniza transação.
            entityManager.getTransaction().commit();
        } catch(Exception e){
            entityManager.getTransaction().rollback();
        }
        return curso;
    }

    public Aluno update(Aluno curso) {
        try {
            System.out.println("Atualizando um curso.");
            // Inicia uma transação com o banco de dados.
            entityManager.getTransaction().begin();
            //Atualiza objeto no BD.
            entityManager.merge(curso);
            //Sincroniza transação.
            entityManager.getTransaction().commit();
        } catch(Exception e){
            entityManager.getTransaction().rollback();
        }
        return curso;
    }

    public void remove(Long idAluno) {
        try {
            System.out.println("Excluindo a curso.");
            //Inicia uma transação com o banco de dados.
            entityManager.getTransaction().begin();
            //Consulta curso pelo id
            Aluno curso = this.findById(idAluno);
            // Remove a curso do BD.
            entityManager.remove(curso);
            // Sincroniza a transação.
            entityManager.getTransaction().commit();
        } catch(Exception e){
            entityManager.getTransaction().rollback();
        }
    }

    public Aluno findById(Long idAluno) {
        Aluno curso = null;
        try {
            //Consulta curso pelo id
            curso = entityManager.find(Aluno.class, idAluno);
        } catch(Exception e){
            entityManager.getTransaction().rollback();
        }
        return curso;
    }

    public List<Aluno> findByDescricao(String descricao) {
        List<Aluno> listaAlunos = null;
        try {
            //monta consulta
            Query query = entityManager.createQuery("select c from Aluno as c "
                    + "where c.nome LIKE :param "
                    + "order by c.nome ");
            query.setParameter("param", "%"+descricao+"%");

            listaAlunos = query.getResultList();

        } catch(Exception e){
            entityManager.getTransaction().rollback();
        }
        return listaAlunos;
    }

}
