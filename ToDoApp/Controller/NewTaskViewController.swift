//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Дмитрий Бабаев on 10.02.2022.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var taskManager: TaskManager!
    
    var dateFormatter: DateFormatter {
        let dt = DateFormatter()
        dt.dateFormat = "dd.MM.yy"
        return dt
    }
    
    var geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func save() {
        
        guard let titleString = titleTextField.text,
        let locationString = locationTextField.text,
        let dateString = dateTextField.text,
        let descriptionString = descriptionTextField.text,
        let addressString = addressTextField.text
        else { return }
        let date = dateFormatter.date(from: dateString)
        
        geocoder.geocodeAddressString(addressString) { [unowned  self] placemarks, error in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString, coordinate: coordinate)
            let task = Task(title: titleString, description: descriptionString, date: date, location: location)
            self.taskManager.add(task: task)
        }
    }
    
}