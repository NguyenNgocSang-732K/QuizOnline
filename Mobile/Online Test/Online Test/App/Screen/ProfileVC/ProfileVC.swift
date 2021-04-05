//
//  ProfileVC.swift
//  Online Test
//
//  Created by vinova on 3/31/21.
//

import UIKit

class ProfileVC: BaseViewControllers {
    @IBOutlet weak var tbv: UITableView!
    
    @IBOutlet weak var headerView: HeaderProfile!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidenNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hidenNavigationBar(isHiden: false)
    }
    
    func setupUI(){
        
        headerView.delegate = self
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UINib(nibName: "CellHeader", bundle: nil), forCellReuseIdentifier: CellHeader.description())
        tbv.register(UINib(nibName: "CellBody", bundle: nil), forCellReuseIdentifier: CellBody.description())
        tbv.register(UINib(nibName: "CellExam", bundle: nil), forCellReuseIdentifier: CellExam.description())
    }


}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0{
                let cell = tbv.dequeueReusableCell(withIdentifier: CellHeader.description(), for: indexPath) as! CellHeader
                
                cell.delegate = self
                
                return cell
            }
            else{
                let cell = tbv.dequeueReusableCell(withIdentifier: CellBody.description(), for: indexPath) as! CellBody
                
                return cell
            }
        default:
            let cell = tbv.dequeueReusableCell(withIdentifier: CellExam.description(), for: indexPath) as! CellExam
            return cell
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0{
                return 270
            }
            else{
                return 120
            }
        default:
            return 80
        }
    }
    
}
extension ProfileVC: TapActiontDelegate{
    func pushLogin() {
        AppRouter.shared.gotoLogin()
    }
    
    func pushBack() {
        self.popVc()
    }
    
    
}
extension ProfileVC: TapEditDelegate{
    func pushEdit() {
        let editVC = EditVC()
        
        self.push(controller: editVC)
    }
    
    
}
