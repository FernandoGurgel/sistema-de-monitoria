package ifam.br.view;

import ifam.br.*;
import ifam.br.connectionFactory.ConnectionFactory;
import ifam.br.dao.AlunoDAO;
import ifam.br.model.Aluno;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class UsuarioView extends Application{

    private AlunoDAO dao;
    private Aluno aluno;

    public UsuarioView() {
        dao = new AlunoDAO(ConnectionFactory.getEntityManager());
        aluno = dao.findById(2l);
        System.out.println(aluno.getEmail());
        ConnectionFactory.closeEntityFactory();
    }

    public void start() {
        launch();
    }

    @Override
    public void start(Stage primaryStage) throws Exception {

        Parent root = FXMLLoader.load(getClass().getResource("../view/usuario.fxml"));
        primaryStage.setTitle("Sistema de Monitoria");
        primaryStage.initStyle(StageStyle.UNDECORATED);
        primaryStage.setScene(new Scene(root,900,529));
        primaryStage.show();
    }


}
