//
//  ExamTestVC.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class ExamTestVC: BaseViewControllers {

    @IBOutlet weak var clv: UICollectionView!
    
    var time:Int?
    var questions:[Question]?
    
    init(questions:[Question]?, time:Int?) {
        self.time = time
        self.questions = questions
        super.init(nibName: "ExamTestVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var index = 0{
        didSet{
            if index == 0{
                self.hideLeftBtn()
                changeRightButton(title: nil, image: #imageLiteral(resourceName: "next"))
            }else{
                guard let exams = questions else {
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
        
        navigationItem.title = "\(time ?? 0)"
        self.hideLeftBtn()
        changeRightButton(title: nil, image: #imageLiteral(resourceName: "next"))
        
        
        //bo Điều chỉnh các Insets của Scroll View
        
        clv.contentInsetAdjustmentBehavior = .never
        
        
       
    }
    
    
    
    @objc func updateCounter() {
        
        
        guard var time = time else {
            return
        }
        
        if time > 0 {
            time -= 1
            navigationItem.title = "\(time)"
        }
        if time == 0{
            timer?.invalidate()
            timer = nil
            let resultVC = ResultVC()
            resultVC.modalPresentationStyle = .overFullScreen
            
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
        
        guard let arr = questions else {
            return
        }
        
        if index >= arr.count{
            
            let resultVC = ResultVC()
            resultVC.modalPresentationStyle = .fullScreen
            
            self.present(resultVC, animated: true, completion: {
                self.removeFromParent()
            })
        }
        else{
            clv.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        }
    }



}
extension ExamTestVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = clv.dequeueReusableCell(withReuseIdentifier: CellExamTest.description(), for: indexPath) as! CellExamTest
        
        let question = questions?[indexPath.item]
        
        cell.question = question
        
        
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
