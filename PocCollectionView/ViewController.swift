//
//  ViewController.swift
//  PocCollectionView
//
//  Created by Nicolas Rios on 10/30/22.
//

import UIKit

class ViewController: UIViewController {
        
  fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self,forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .orange
       
        
        return cell
    }
    
    
}


class CustomCell: UICollectionViewCell {
    
    fileprivate let bg: UIView = {
            let iv = UIImageView()
            iv.image = UIImage(imageLiteralResourceName: "istockphoto-522716625-170667a")
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            iv.layer.cornerRadius = 5
            return iv
        
    }()
   
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        contentView .addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
