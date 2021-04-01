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
    var counter = 5
    
    var index = 0{
        didSet{
            if index == 0{
                self.hideLeftBtn()
                changeRightButton(title: nil, image: #imageLiteral(resourceName: "next"))
            }else{
                guard let exams = exam?.questionExam else {
                    return
                }
                self.changeLeftButton(image: #imageLiteral(resourceName: "pre"))
                index == exams.count - 1 ? changeRightButton(title: "Nop Bai", image: nil) : changeRightButton(title: nil, image: #imageLiteral(resourceName: "next"))
            }
        }
    }
    
    
    var timer:Timer?

  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer = nil
    }
    
    func setupUI(){
        
        clv.delegate = self
        clv.dataSource = self
        clv.register(UINib(nibName: "CellExamTest", bundle: nil), forCellWithReuseIdentifier: CellExamTest.description())
        
        navigationItem.title = "30:00"
        self.hideLeftBtn()
        changeRightButton(title: nil, image: #imageLiteral(resourceName: "next"))
        
        
        //bo Điều chỉnh các Insets của Scroll View
        
        clv.contentInsetAdjustmentBehavior = .never
        
        
       
    }
    
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        var bottomPadding:CGFloat = 0
//
//        if #available(iOS 11.0, *) {
//            if let window = UIApplication.shared.keyWindow{
//                bottomPadding = window.safeAreaInsets.bottom - 10
//                if bottomPadding < 0 {
//                    bottomPadding = 0
//                }
//            }
//        }
////        let cellSize = UIScreen.main.bounds.size
//        let contentOffset = clv.contentOffset
//
////        let r = CGRect(x: 0, y: contentOffset.y - bottomPadding, width: cellSize.width, height: cellSize.height)
//        self.clv.setContentOffset(CGPoint(x: 0, y: contentOffset.y - bottomPadding ), animated: false)
//
//
////        let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y , width: cellSize.width, height: cellSize.height)
////
////        self.clv.setContentOffset(CGPoint(x: contentOffset.x + cellSize.width, y: contentOffset.y), animated: true)
//
//    }
    
    @objc func updateCounter() {
        
        if counter > 0 {
            counter -= 1
            navigationItem.title = "\(counter)"
        }
        if counter == 0{
            timer?.invalidate()
            timer = nil
            let resultVC = ResultVC()
            resultVC.modalPresentationStyle = .fullScreen
            
            self.present(resultVC, animated: true, completion: {
                self.removeFromParent()
            })
        }
    }
    
    override func clickLeftBtn() {
        index -= 1
        
        if index < 0{
            index = 0
            return
        }
        else{
            clv.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
    
    override func clickRightBtn() {
        
        index += 1
        
        guard let arr = exam?.questionExam else {
            return
        }
        
        if index >= arr.count{
            index = arr.count - 1
            return
        }
        else{
            clv.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        
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
