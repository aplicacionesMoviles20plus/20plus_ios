//
//  ViewController.swift
//  20plus
//
//  Created by renato on 5/29/18.
//  Copyright © 2018 renato. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var txtCorreoElcrotnico: UITextField!
    
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var btnIniciarSesion: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logInToApp(_ sender: UIButton) {
        
        
         Auth.auth().singIn(WithEmail: txtCorreoElcrotnico.text, txtPass.text ) { (user,error)in
            
            
        }
    
    
    }

}

