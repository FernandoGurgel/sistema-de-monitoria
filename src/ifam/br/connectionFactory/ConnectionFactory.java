package ifam.br.connectionFactory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConnectionFactory {

    private static EntityManagerFactory managerFactory;

    public static EntityManager getEntityManager(){
        if(managerFactory==null|| !managerFactory.isOpen()){
            System.out.println("Criando EntityManager....");
            managerFactory =
                    Persistence.createEntityManagerFactory("pds");
        }
        return managerFactory.createEntityManager();
    }

    public static void closeEntityFactory(){
        managerFactory.close();
    }
}
