//
//  ExamTestVC.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class ExamTestVC: BaseViewControllers {

    @IBOutlet weak var clv: UICollectionView!
    
    
    var exam:ExamBase?
    
    init(exam:ExamBase?) {
        self.exam = exam
        super.init(nibName: "ExamTestVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        setupUI()
        // Do any additional setup after loading the view.
    }

    
    func setupUI(){
        
        clv.delegate = self
        clv.dataSource = self
        clv.register(UINib(nibName: "CellExamTest", bundle: nil), forCellWithReuseIdentifier: CellExamTest.description())
        
    }



}
extension ExamTestVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exam?.questionExam?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = clv.dequeueReusableCell(withReuseIdentifier: CellExamTest.description(), for: indexPath) as! CellExamTest
        
        let exam_1 = exam?.questionExam?[indexPath.item]
        
        cell.exam_1 = exam_1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = clv.frame.size.height
        let size = CGSize(width: width, height: height)
        
        
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
