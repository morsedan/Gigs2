//
//  GigDetailViewController.swift
//  Gigs2
//
//  Created by morse on 5/30/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class GigDetailViewController: UIViewController {
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var descriptionTextField: UITextView!
    
    var gigController: GigController?
    var gig: Gig?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(with: gig)
    }
    
    func updateViews(with gig: Gig?) {
        guard let gig = gig else { return }
        titleTextField.text = gig.title
        descriptionTextField.text = gig.description
        datePicker.date = gig.dueDate
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, let description = descriptionTextField.text else { return }
        let date = datePicker.date
        
        gigController?.createGig(title: title, description: description, dueDate: date, completion: { error in
            if let error = error {
                print("Error saving gig: \(error)")
            }
        })
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
