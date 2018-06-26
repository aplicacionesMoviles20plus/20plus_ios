//
//  RegistrarProfesorViewController.swift
//  20plus
//
//  Created by Cristian Trigo on 6/24/18.
//  Copyright © 2018 renato. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class RegistrarProfesorViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var cursoArray=[cursoItem]()
    var horarioArray=[horario]()
    var distritoArray=[zona]()

    @IBOutlet weak var pvCursos: UIPickerView!
    @IBOutlet weak var pvHorario: UIPickerView!
    @IBOutlet weak var pvDistrito: UIPickerView!
    @IBOutlet weak var txtCelular: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = 0
        if pickerView == pvCursos{
            countrows = self.cursoArray.count
        }
        else if pickerView == pvHorario{
            countrows = self.horarioArray.count
        }
        else if pickerView == pvDistrito{
            countrows = self.distritoArray.count
        }
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var retornar : String = ""
        if pickerView == pvCursos{
            return cursoArray[row].nombre + cursoArray[row].grado + cursoArray[row].contenido
        }
        else if pickerView == pvHorario{
            return horarioArray[row].horarioinicio
        }
        else if pickerView == pvDistrito{
            return distritoArray[row].nombre
        }
        return retornar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pvCursos.dataSource=self
        pvCursos.delegate=self
        pvHorario.dataSource=self
        pvHorario.delegate=self
        pvDistrito.dataSource=self
        pvDistrito.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        Alamofire.request("http://192.168.1.4:9990/api/cursogradoes").responseJSON{
            response in
            if let json = response.result.value{
                let sJSON = JSON(json)
                for(index,subJson):(String, JSON) in sJSON{
                    let objCurso = cursoItem()
                    objCurso.nombre = subJson["nombre"].stringValue
                    objCurso.idcursogrado = subJson["idcursogrado"].intValue
                    self.cursoArray.append(objCurso)
                }
                self.pvCursos.reloadAllComponents()
            }
        }
        Alamofire.request("http://192.168.1.4:9990/api/horarios").responseJSON{
            response in
            if let json = response.result.value{
                let sJSON = JSON(json)
                for(index,subJson):(String, JSON) in sJSON{
                    let objHorario = horario()
                    objHorario.horarioinicio = subJson["horarioinicio"].stringValue
                    objHorario.idhorario = subJson["idhorario"].intValue
                    self.horarioArray.append(objHorario)
                }
                self.pvHorario.reloadAllComponents()
            }
        }
        Alamofire.request("http://192.168.1.4:9990/api/zonas").responseJSON{
            response in
            if let json = response.result.value{
                let sJSON = JSON(json)
                for(index,subJson):(String, JSON) in sJSON{
                    let objZona = zona()
                    objZona.nombre = subJson["zona"].stringValue
                    objZona.idzona = subJson["idzona"].intValue
                    self.distritoArray.append(objZona)
                }
                self.pvDistrito.reloadAllComponents()
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
