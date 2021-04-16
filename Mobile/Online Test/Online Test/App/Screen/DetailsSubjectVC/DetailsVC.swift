//
//  DetailsSubjectVS.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class DetailsVC: BaseViewControllers {
    
    
    @IBOutlet weak var tbv: UITableView!
    
    
    var arrExam:[Exam]? = []
    
    init(arrExam:[Exam]?) {
        self.arrExam = arrExam
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

    deinit {
        print("adasdasdasdasdasdasd")
    }
    
    func setupUI(){
        self.navigationItem.title = "De thi"
        changeLeftButton(title: nil, image: #imageLiteral(resourceName: "back"))
        changeBackgroundColor()
        transparentNav(isTrans: true)
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UINib(nibName: "CellExam", bundle: nil), forCellReuseIdentifier: CellExam.description())
    }
    
    
    
    override func clickLeftBtn() {
        self.popVc()
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
extension DetailsVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrExam?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbv.dequeueReusableCell(withIdentifier: CellExam.description(), for: indexPath) as! CellExam
        
        let exam = arrExam?[indexPath.item]
        
        
        cell.bindData(exam: exam)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let questions = arrExam?[indexPath.item].question
//        let time = arrExam?[indexPath.item].time
//        let beforeVC = BeforeTestVC(questions: questions, time:time)
//
//        self.push(controller: beforeVC)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
