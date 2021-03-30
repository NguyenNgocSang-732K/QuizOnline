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
//            cell.bindData(question: exam_1?.question)
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
    
    
}


