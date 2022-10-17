//
//  ViewController.swift
//  HTTP
//
//  Created by Mikel Valle on 4/10/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red//Cambio de color de la view
        idLabel.text = ""
        nameLabel.text = ""//Aquí le damos la funcionalidad de introducir caranteres string pero de forma vacía.
        nameLabel.numberOfLines = 0//Esto se hace para que las label tengan lineas infinitas
        emailLabel.text = ""
        emailLabel.numberOfLines = 0
        //hidesWhenStopped es para darle funcionalidad solo cuando se esté usando, cuando le quitemos desaparecerá
        activityIndicator.hidesWhenStopped = true
    }
    @IBAction func getUserAction(_ sender: Any) {
        activityIndicator.startAnimating()//Inicia la animación cuando pulsamos el botón getUser
        NetworkingProvider.shared.getUser(id: 3141) { user in
            
            self.idLabel.text = user.id?.description//Transformamos el entero en una cadena de texto.
            self.activityIndicator.stopAnimating()//Le indicamos que pare la animación cuando tenga información
            self.nameLabel.text = user.name//Le especificamos que en la Label salga en forma de texto la información conseguida de user.name
            self.emailLabel.text = user.email//En esta realizamos lo mismo solo que con la información .email
        } failure: { Error in
            self.nameLabel.text = Error.debugDescription//Le indicamos que si hay un error lo muestre en la nameLabel.
            self.activityIndicator.stopAnimating()
        }

    }
    
    @IBAction func postUserAction(_ sender: Any) {
    }
    
}

