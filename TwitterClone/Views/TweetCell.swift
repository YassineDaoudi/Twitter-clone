//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Findl MAC on 20/03/2019.
//  Copyright © 2019 YD. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            guard let tweet  = datasourceItem as? Tweet else {return}
            
            let attributedText  = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = "  \(tweet.user.username)\n"
           
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]))
            
            
            
            messageTextView.attributedText = attributedText
        }
    }
    
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample TextView"
        tv.backgroundColor = .clear
        tv.isUserInteractionEnabled = false
        return tv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yd_profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send_message")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override func setupViews() {
            super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        
        backgroundColor = .white
        
        
        addSubview(profileImageView)
        addSubview(messageTextView)
     
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
       // replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
       // retweetButton.anchor(nil, left: replyButton.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
        setupBottomButtons()
        
    }
    
   fileprivate func setupBottomButtons() {
    
        let replyButtonContainerView = UIView()
    
        let retweetButtonContainerView = UIView()
    
        let likeButtonContainerView = UIView()
    
        let directButtonContainerView = UIView()
    
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
    
        addSubview(buttonStackView)
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)


    
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 24)
    
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: replyButtonContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    
    
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: retweetButtonContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    
    
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    
        directMessageButton.anchor(directButtonContainerView.topAnchor, left: directButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
}
