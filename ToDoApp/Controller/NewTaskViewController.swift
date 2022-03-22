//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Max Pavlov on 16.03.22.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var locationTextFiled: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!

    var taskManager: TaskManager!
    var geocoder = CLGeocoder()
    var dateFormatte: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let titleSting = titleTextField.text
        let locationString = locationTextFiled.text
        let date = dateFormatte.date(from: dateTextField.text!)
        let descriptionString = descriptionTextField.text
        let addressString = addressTextField.text
        
        geocoder.geocodeAddressString(addressString!) { [unowned self] placemarks, error in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            let task = Task(title: titleSting!, description: descriptionString, date: date, location: location)
            self.taskManager.add(task: task)
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
