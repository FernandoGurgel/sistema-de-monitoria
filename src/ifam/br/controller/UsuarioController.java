package ifam.br.controller;


import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;

import java.net.URL;
import java.util.ResourceBundle;

public class UsuarioController implements Initializable{

//
//    @FXML
//    private Button btnPrincipal;
//    @FXML
//    private Button btnMeusHorarios;
//    @FXML
//    private Button btnMonitoria;
//    @FXML
//    private Button btnMinimizar;
    @FXML
    private Button btnPerfil;
    @FXML
    private Button btnSair;
    @FXML
    private Pane vwPerfil;
    @FXML
    private TextField pfNome;
    @FXML
    private TextField pfTelefone;
    @FXML
    private TextField pfEmail;
    @FXML
    private TextField pfCurso;
    @FXML
    private TextField pfSenha;
    @FXML
    private Label pfModulo;
    @FXML
    private Label pfMatricula;
    @FXML
    private Button pfBtnSalvar;
    @FXML
    private Button pfBtnSolicita;
    @FXML
    private Label menuNome;
    @FXML
    private Label menuCurso;


    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }


    public void OnClose(){
        Platform.exit();
    }

    @FXML
    public void OnSelectButton(ActionEvent e){
        if(e.getSource().equals(btnSair)){
            System.out.println("Voltando para tela inicial!!!");
        }else if (e.getSource().equals(btnPerfil)){
            vwPerfil.setVisible(true);
        }
    }


}
