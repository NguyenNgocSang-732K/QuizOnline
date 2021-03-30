//
//  BaseViewControllers.swift
//  Online Test
//
//  Created by vinova on 3/29/21.
//

import UIKit

class BaseViewControllers: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    func changeBackgroundColor(){
        self.view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }
    
    
    func hidenNavigationBar(isHiden:Bool = true){
        self.navigationController?.navigationBar.isHidden = isHiden
    }
    
    func changeLeftButton(title:String? = "", image: UIImage = UIImage()){
        let btnLeft = UIButton()
        btnLeft.setTitle(title, for: .normal)
        btnLeft.setBackgroundImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        btnLeft.addTarget(self, action: #selector(clickLeftBtn), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnLeft)
    }
    func changeRightButton(title:String? = "", image: UIImage = UIImage()){
        let btnLeft = UIButton()
        btnLeft.setTitle(title, for: .normal)
        btnLeft.setBackgroundImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnLeft)
    }
    
    func transparentNav(isTrans:Bool){
        if isTrans{
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.view.backgroundColor = .clear
        }
        else{
            
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .none
        }
       
    }
    
    func push(controller:UIViewController){
        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    @objc func clickLeftBtn(){
        
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
