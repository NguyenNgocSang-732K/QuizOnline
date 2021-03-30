//
//  HomeVC.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class HomeVC: BaseViewControllers {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var clv: UICollectionView!
    
    
    var arrObject = [
        Subject(id: "1", nameSubject: "Toán", imageSubject: #imageLiteral(resourceName: "math"), total: "9/10"),
        Subject(id: "2", nameSubject: "Ngữ Văn", imageSubject: #imageLiteral(resourceName: "van"), total: "9/10"),
        Subject(id: "3", nameSubject: "Vật Lý", imageSubject: #imageLiteral(resourceName: "vatly"), total: "9/10"),
        Subject(id: "4", nameSubject: "Hoá", imageSubject: #imageLiteral(resourceName: "hoa"), total: "9/10"),
        Subject(id: "5", nameSubject: "Sinh Học", imageSubject: #imageLiteral(resourceName: "sinhhoc"), total: "9/10"),
        Subject(id: "6", nameSubject: "Lịch sử", imageSubject: #imageLiteral(resourceName: "lichsu"), total: "9/10"),
        Subject(id: "7", nameSubject: "Địa Lý", imageSubject: #imageLiteral(resourceName: "dialy"), total: "9/10"),
        Subject(id: "8", nameSubject: "Tiếng Anh", imageSubject: #imageLiteral(resourceName: "english"), total: "9/10"),
        Subject(id: "9", nameSubject: "GDCD", imageSubject: #imageLiteral(resourceName: "gdcc"), total: "9/10"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        hidenNavigationBar()
        transparentNav(isTrans: true)
        clv.delegate = self
        clv.dataSource = self
        headerView.delegate = self
        clv.register(UINib(nibName: "CellHome", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        
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
extension HomeVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrObject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellHome
        
        let subject = arrObject[indexPath.item]
        
        cell.bindData(subject: subject)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width / 2) - 30
        let height:CGFloat = 100
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        print(indexPath.item)
       
        let detailsVC = DetailsVC()

        self.push(controller: detailsVC)
    }
    
}

extension HomeVC:TapProfileDelegate{
    func pushViewProfile() {
        print("asdasdasdas")
    }
    
    
}
