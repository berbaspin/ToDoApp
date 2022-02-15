//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Дмитрий Бабаев on 09.02.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    func configure(withTask task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dateLabel.text = ""
            locationLabel.text = ""
        } else {
            titleLabel.attributedText = .none
            titleLabel.text = task.title
            locationLabel.text = task.location?.name
            
            
            let dateString = dateFormatter.string(from: task.date)
            dateLabel.text = dateString
        }
    }
}
