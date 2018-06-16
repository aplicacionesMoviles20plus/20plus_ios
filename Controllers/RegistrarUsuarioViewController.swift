//
//  RegistrarUsuarioViewController.swift
//  20plus
//
//  Created by renato mercado luna on 6/15/18.
//  Copyright © 2018 renato. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class RegistrarUsuarioViewController: UIViewController {

    //Outlets
    
    @IBOutlet weak var txtNombreUsuario: UITextField!
    @IBOutlet weak var txtApellidoUsuario: UITextField!
    @IBOutlet weak var txtContraseniaUsuario: UITextField!
    @IBOutlet weak var txtconfirmarcontreniaUsuario: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSavePressed(_ sender: Any) {
        
        //Set parameters
        let parameters : Parameters = ["nombre" : self.txtNombreUsuario.text!,
                                       "apellido" : self.txtApellidoUsuario.text!,
                                       "password" : self.txtContraseniaUsuario.text!,
                                       "email" : self.txtCorreo.text!]
    
        Alamofire.request("http://192.168.1.2:9990/api/padres", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            print("Result Value: \(String(describing: response.result.value))")               // response serialization result
            
            switch(response.result){
            case .failure(_):
                let alert = UIAlertController(title: "Fail!", message: "Something went wrong! Please try again!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                break;
            case .success:                    print("se regiustor  :)")
            break;
            }
            
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
