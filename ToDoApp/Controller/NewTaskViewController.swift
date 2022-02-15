//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Дмитрий Бабаев on 10.02.2022.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presentingViewController?.viewWillAppear(true)
    }
    
    
    @IBAction func save() {
        
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let dateString = dateTextField.text
        let descriptionString = descriptionTextField.text
        let addressString = addressTextField.text
        let date = dateFormatter.date(from: dateString!)
        
        geocoder.geocodeAddressString(addressString!) { [unowned self] placemarks, error in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            let task = Task(title: titleString!, description: descriptionString, date: date, location: location)
            self.taskManager.add(task: task)
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
