//
//  CalendarPopVC.swift
//  Online Test
//
//  Created by vinova on 4/2/21.
//

import UIKit


protocol ActionPickerDelegate:class {
    func didTapOk(value:String)
    func didTapCancel()
}

class CalendarPopVC: UIViewController {
    @IBOutlet weak var viewDate: UIView!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate:ActionPickerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        datePicker.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.4, blue: 0.4705882353, alpha: 1)
        datePicker.setValue(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), forKey: "textColor")
        datePicker.setValue(false, forKey: "highlightsToday")
        viewDate.layer.cornerRadius = 30
        viewDate.clipsToBounds = true
        datePicker.layer.cornerRadius = 30
        datePicker.clipsToBounds = true
        btnCancel.layer.cornerRadius = 15
        btnCancel.clipsToBounds = true
        btnOk.layer.cornerRadius = 15
        btnOk.clipsToBounds = true
        
        let currentDate = Date()
        var dateComponents = DateComponents()
        let calendar = Calendar.init(identifier: .gregorian)
        dateComponents.year = -100
        let minDate = calendar.date(byAdding: dateComponents, to: currentDate)
        dateComponents.year = -13
        let maxDate = calendar.date(byAdding: dateComponents, to: currentDate)
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
    }

    @IBAction func changeDate(_ sender: Any) {
        
    }
    
    @IBAction func clickOK(_ sender: Any) {
        
        
        let date = datePicker.date.getFormattedDate(format: "dd-MM-yyyy") // Set output formate
       
        self.delegate?.didTapOk(value: date)
    }
    @IBAction func clickCancel(_ sender: Any) {
        self.delegate?.didTapCancel()
    }
    
}


