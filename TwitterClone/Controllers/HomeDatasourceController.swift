//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Findl MAC on 19/03/2019.
//  Copyright © 2019 YD. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if indexPath.section == 0 {
            if let user = self.datasource?.item(indexPath) as? User {
                
                let estimatedHeight = estimatedHeightForText(user.bioText)
                
                return CGSize(width: view.frame.width, height: estimatedHeight + 66)
                
            }
        } else if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else {return .zero}
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
            
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
}


extension HomeDatasourceController {
    
    private func setupNavigationBarItems() {
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        
        let titleImageView = UIImageView(image: UIImage(named: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        setupLeftNavItems()
        setupRightNavItems()
        
    }
    
    private func setupLeftNavItems() {
        
        
        let followButton = UIButton(type: .system)
        followButton.setImage(UIImage(named: "follow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton)]
    }
    
    private func estimatedHeightForText(_ text:String) -> CGFloat {
        
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
        
    }
    
}
