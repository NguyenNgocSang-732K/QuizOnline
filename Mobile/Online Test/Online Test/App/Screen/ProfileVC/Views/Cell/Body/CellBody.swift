//
//  CellBody.swift
//  Online Test
//
//  Created by vinova on 4/1/21.
//

import UIKit

class CellBody: UITableViewCell {
    @IBOutlet weak var clv: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(){
        clv.dataSource = self
        clv.delegate = self
        clv.register(UINib(nibName: "CellSubjectList", bundle: nil), forCellWithReuseIdentifier: CellSubjectList.description())
        clv.allowsMultipleSelection = false
        
    }
    
}

extension CellBody:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clv.dequeueReusableCell(withReuseIdentifier: CellSubjectList.description(), for: indexPath) as! CellSubjectList
        
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.frame.size.width / 4 - 10
        let size = CGSize(width: width, height: 40)
        
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = clv.cellForItem(at: indexPath)
        
        cell?.contentView.backgroundColor = #colorLiteral(red: 0.1529411765, green: 0.4, blue: 0.4705882353, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = clv.cellForItem(at: indexPath)
        
        cell?.contentView.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8784313725, blue: 0.9176470588, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
}
