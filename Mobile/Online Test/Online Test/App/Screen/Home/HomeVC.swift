//
//  HomeVC.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit
import KRProgressHUD

class HomeVC: BaseViewControllers {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var clv: UICollectionView!
    
    
    var arrSubject:[Subject] = []
    
//    var arrObject = [
//        Subject(id: "1", nameSubject: "Toán", imageSubject: #imageLiteral(resourceName: "math"), total: "9/10"),
//        Subject(id: "2", nameSubject: "Ngữ Văn", imageSubject: #imageLiteral(resourceName: "van"), total: "9/10"),
//        Subject(id: "3", nameSubject: "Vật Lý", imageSubject: #imageLiteral(resourceName: "vatly"), total: "9/10"),
//        Subject(id: "4", nameSubject: "Hoá", imageSubject: #imageLiteral(resourceName: "hoa"), total: "9/10"),
//        Subject(id: "5", nameSubject: "Sinh Học", imageSubject: #imageLiteral(resourceName: "sinhhoc"), total: "9/10"),
//        Subject(id: "6", nameSubject: "Lịch sử", imageSubject: #imageLiteral(resourceName: "lichsu"), total: "9/10"),
//        Subject(id: "7", nameSubject: "Địa Lý", imageSubject: #imageLiteral(resourceName: "dialy"), total: "9/10"),
//        Subject(id: "8", nameSubject: "Tiếng Anh", imageSubject: #imageLiteral(resourceName: "english"), total: "9/10"),
//        Subject(id: "9", nameSubject: "GDCD", imageSubject: #imageLiteral(resourceName: "gdcc"), total: "9/10"),
//    ]
    
    init(arrSubject:[Subject]){
        self.arrSubject = arrSubject
        super.init(nibName: nil, bundle: nil)
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
        
        transparentNav(isTrans: true)
        clv.delegate = self
        clv.dataSource = self
        headerView.delegate = self
        clv.register(UINib(nibName: "CellHome", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidenNavigationBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hidenNavigationBar(isHiden: false)
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
        return arrSubject.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellHome
        
        let subject = arrSubject[indexPath.item]
//
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
        KRProgressHUD.show()
       
        let idSubject = arrSubject[indexPath.item].id
        
        Provider.shared.getSubject.getExamBySubject(idSubject: idSubject) { data in
            
            
            if let exams =  data?.data{
                let detailsVC = DetailsVC(arrExam: exams)

                self.push(controller: detailsVC)
                KRProgressHUD.dismiss()
            }
            
            KRProgressHUD.showError(withMessage: data?.statusMessage ?? "")
            
        } failure: { err in
            print("Asdasdasd", err)
            KRProgressHUD.dismiss()
        }
        
        
    }
    
}

extension HomeVC:TapProfileDelegate{
    func pushViewProfile() {
        let profileVC = ProfileVC()
        self.push(controller: profileVC)
    }
        
    
}
