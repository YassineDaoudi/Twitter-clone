//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Findl MAC on 19/03/2019.
//  Copyright © 2019 YD. All rights reserved.
//

import LBTAComponents


class HomeDatasource: Datasource {
    
    let users : [User] = {
        let yassineUser = User(name: "Yassine Daoudi", username: "@yassinedaoudii", bioText: "iPhone, iPad, iOS Programmer using swift programing language.", profileImage: UIImageView(image: UIImage(named: "yd_profile_image")))
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming ", profileImage: UIImageView(image: UIImage(named: "ray_profile_image")))
        
        let elonUser = User(name: "Elon Musk", username: "@elonmusk", bioText: "is a technology entrepreneur and engineer. He is the founder, CEO, and lead designer of SpaceX, co-founder, CEO, and product architect of Tesla. ", profileImage: UIImageView(image: UIImage(named: "elon_profile_image")))
        return [yassineUser,rayUser,elonUser]
    }()
    
    let tweets: [Tweet] = {
       
         let yassineUser = User(name: "Yassine Daoudi", username: "@yassinedaoudii", bioText: "iPhone, iPad, iOS Programmer using swift programing language.", profileImage: UIImageView(image: UIImage(named: "yd_profile_image")))
        
        let tweet = Tweet(user: yassineUser, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ligula mauris, volutpat id gravida in, feugiat sit amet enim. Nullam sit amet tempus metus")
        
        let tweet2 = Tweet(user: yassineUser, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ligula mauris, volutpat id gravida in, feugiat sit amet enim. Nullam sit amet tempus metus")
        
        return [tweet,tweet2]
    }()
    
    

    override func numberOfSections() -> Int {
        return 2
    }
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return[UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return[UserFooter.self]
    }
}
