//
//  ProfesorInfoViewController.swift
//  20plus
//
//  Created by renato mercado luna on 6/18/18.
//  Copyright © 2018 renato. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProfesorInfoViewController: UIViewController {

    var id = 0
    //Cursos
    var categoriesCursosProfe = [cursoItem]()
    
    var profesor: profesor? = nil
    var dummyCalificacion : Int = 0
    var dummyNumero : Int = 0
    
    @IBOutlet weak var tableCursos: UITableView!
    
    //OutLets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblExperiencia: UILabel!
    @IBOutlet weak var lblNumeorTlefono: UILabel!
    @IBOutlet weak var lblNumero: UILabel!
    
    
    //funcitons for table
    func numberOfComponents(in pickerView: UITableView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UITableView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesCursosProfe.count
    }
    
    func pickerView(_ pickerView: UITableView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesCursosProfe[row].contenido
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(profesor?.nombre)
        
        self.dummyCalificacion = (profesor?.calificacion)!
        self.dummyNumero = (profesor?.celular)!
        
        self.lblName.text=(profesor?.nombre)! + " " + (profesor?.apellido)!
        self.lblDescription.text=profesor?.descripcion
        self.lblNumero.text = String(self.dummyCalificacion)
        self.lblNumeorTlefono.text = String(self.dummyNumero)
        self.lblExperiencia.text = profesor?.experiencia
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
