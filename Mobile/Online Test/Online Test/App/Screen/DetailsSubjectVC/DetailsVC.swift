//
//  DetailsSubjectVS.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class DetailsVC: BaseViewControllers {
    
    
    @IBOutlet weak var tbv: UITableView!
    
    
    
    var arrExam = [
        ExamBase(id: "1", nameExam: "Đề 1", questionExam: [
            ExamModel(id: "ex_0", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:asdnadasdmnasmdamnsdbamnsdbmansbdmansbdmansbdmasndbmansbdmansbdmansbdmansbdmnasbdmansbdmnasbdmnasbdnmasbdmnasbdmnasbdmnabdmnasbdmansbdmnasdmansdbamnsdbmansdmansdasdnadasdmnasmdamnsdbamnsdbmansbdmansbdmansbdmasndbmansbdmansbdmansbdmansbdmnasbdmansbdmnasbdmnasbdnmasbdmnasbdmnasbdmnabdmnasbdmansbdmnasdmansdbamnsdbmansdmansd...", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "3"),
                Answer(answer: "4"),
                Answer(answer: "6")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_2", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:asdnadasdmnasmdamnsdbamnsdbmansbdmansbdmansbdmasndbmansbdmansbdmansbdmansbdmnasbdmansbdmnasbdmnasbdnmasbdmnasbdmnasbdmnabdmnasbdmansbdmnasdmansdbamnsdbmansdmansd", imageExam: nil, answer: [
                Answer(answer: "1"),
                Answer(answer: "3"),
                Answer(answer: "5"),
                Answer(answer: "6")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_3", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:asdnadasdmnasmdamnsdbamnsdbmansbdmansbdmansbdmasndbmansbdmansbdmansbdmansbdmnasbdmansbdmnasbdmnasbdnmasbdmnasbdmnasbdmnabdmnasbdmansbdmnasdmansdbamnsdbmansdmansd", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_4", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"])
        ], time: "30:00"),
        ExamBase(id: "2", nameExam: "Đề 2", questionExam: [
            ExamModel(id: "ex_0", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_1", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer:[
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_2", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_3", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_4", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"])
        ], time: "30:00"),
        ExamBase(id: "3", nameExam: "Đề 3", questionExam: [
            ExamModel(id: "ex_0", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_1", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_2", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_3", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"]),
            ExamModel(id: "ex_4", nameModelExam: "a", question: "Câu 1: Khoanh tròn vào chữ cái trước kết quả đúng: (0,5 điểm) Kết quả của phép tính 17 + 9 là:", imageExam: nil, answer: [
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12"),
                Answer(answer: "12")
    ], answerUser: [], answerExam: ["A"])
        ], time: "30:00"),
        ]
    
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
        return arrExam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbv.dequeueReusableCell(withIdentifier: CellExam.description(), for: indexPath) as! CellExam
        
        let examBase = arrExam[indexPath.item]
        
        cell.bindData(examBase: examBase)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let exam = arrExam[indexPath.item]
        let beforeVC = BeforeTestVC(exam: exam)
        
        self.push(controller: beforeVC)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
