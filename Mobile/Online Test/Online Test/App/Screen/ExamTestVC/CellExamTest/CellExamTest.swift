//
//  CellExamTest.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit



class CellExamTest: UICollectionViewCell {

    @IBOutlet weak var tbv: UITableView!
    
    
    
    @IBOutlet weak var heightTbv: NSLayoutConstraint!
    
    
    var answers:[Answer] = []{
        didSet{
            tbv.reloadData()
        }
    }
    
    @IBOutlet weak var lbContent: UILabel!
    
    @IBOutlet weak var imv: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupUI()
        // Initialization code
    }

    
    func setupUI(){
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UINib(nibName: "CellAnswer", bundle: nil), forCellReuseIdentifier: CellAnswer.description())

        
        
        
        
    }
    
    func bindData(question:Question?){
        lbContent.text = question?.content
        
        if let image = question?.image{
            imv.load(nameImage: image)
        }
        
        if question?.answerType == 1{
            tbv.allowsMultipleSelection = false
            
        }
        else{
            tbv.allowsMultipleSelection = true
            
           
        }
        
        if let answers = question?.answers{
            heightTbv.constant = CGFloat(answers.count * 65)
            self.answers = answers
        }
    }
   
    
}

extension CellExamTest:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return answers.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
            let cell = tbv.dequeueReusableCell(withIdentifier: CellAnswer.description(), for: indexPath) as! CellAnswer
            let answer = answers[indexPath.row]
            
            cell.bindData(answer: answer)
            
            
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 65
       
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let cell = tableView.cellForRow(at: indexPath) as! CellAnswer
            
            cell.viewAnswer.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.4, blue: 0.4705882353, alpha: 1)
          
            print(indexPath)
    
       
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
            let cell = tableView.cellForRow(at: indexPath) as! CellAnswer
            cell.viewAnswer.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
            
            
            
            print(indexPath)
            
       
    }

    
}


