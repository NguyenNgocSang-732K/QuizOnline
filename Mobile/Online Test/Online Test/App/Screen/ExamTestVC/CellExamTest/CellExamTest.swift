//
//  CellExamTest.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class CellExamTest: UICollectionViewCell {

    @IBOutlet weak var tbv: UITableView!
    
    
    var exam_1:ExamModel?{
        didSet{
            tbv.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupUI()
        // Initialization code
    }

    
    func setupUI(){
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UINib(nibName: "CellQuestion", bundle: nil), forCellReuseIdentifier: CellQuestion.description())
        tbv.register(UINib(nibName: "CellAnswer", bundle: nil), forCellReuseIdentifier: CellAnswer.description())
        tbv.allowsMultipleSelection = true
        
    }
    
   
    
}

extension CellExamTest:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return exam_1?.answer.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tbv.dequeueReusableCell(withIdentifier: CellQuestion.description(), for: indexPath) as! CellQuestion
            cell.bindData(question: exam_1?.question)
            return cell
        default:
            let cell = tbv.dequeueReusableCell(withIdentifier: CellAnswer.description(), for: indexPath) as! CellAnswer
            let answer = exam_1?.answer[indexPath.row]
            
            cell.bindData(answer: answer?.answer, title: "A")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        default:
            return 65
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            break
        default:
         
            if let cell = tbv.cellForRow(at: indexPath) as? CellAnswer{
                cell.viewAnswer.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.4, blue: 0.4705882353, alpha: 1)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            break
        default:
         
            if let cell = tbv.cellForRow(at: indexPath) as? CellAnswer{
                cell.viewAnswer.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
            }
            
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        switch section{
        case 0:
            return UIView()
        default:
         return UIView()
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section{
        case 0:
            return 0
        default:
            return 50
        }
    }

    
    
}


