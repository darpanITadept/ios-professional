//
//  TeamTableViewCell.swift
//  Football Chants
//
//  Created by Darpan Choudhary on 27/08/23.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell"
    
    // MARK: - UI
 
    private lazy var containerView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        
        return vw
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.spacing = 4
        stackVw.axis = .vertical
        
        return stackVw
    }()
    
    private lazy var badgeImgVw: UIImageView = {
        let imgVw = UIImageView()
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.contentMode = .scaleAspectFit

        return imgVw
    }()
    
    private lazy var playBackBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        
        return btn
    }()
    
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .white
        
        return lbl
    }()
    
    private lazy var foundedLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .white
        
        return lbl
    }()
    
    private lazy var jobLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 10, weight: .light)
        lbl.textColor = .white
        
        return lbl
    }()
    
    private lazy var infoLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = .white
        
        return lbl
    }()

    
    // MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    func configure() {
        
        containerView.backgroundColor = TeamType.arsenal.background
        
        badgeImgVw.image = TeamType.arsenal.badge
        playBackBtn.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32)),for: .normal)
        
        nameLbl.text = "Arsenal"
        foundedLbl.text = "1800"
        jobLbl.text = "Current Manager: Mikel Arteta"
        infoLbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce consequat massa vel orci convallis, et fermentum justo dictum. "
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badgeImgVw)
        containerView.addSubview(playBackBtn)
        
        contentStackView.addArrangedSubview(nameLbl)
        contentStackView.addArrangedSubview(foundedLbl)
        contentStackView.addArrangedSubview(jobLbl)
        contentStackView.addArrangedSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -8),
            
            
            badgeImgVw.heightAnchor.constraint(equalToConstant: 50),
            badgeImgVw.widthAnchor.constraint(equalToConstant: 50),
            badgeImgVw.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badgeImgVw.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),

            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: badgeImgVw.trailingAnchor, multiplier: 2),
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -16),
            contentStackView.trailingAnchor.constraint(equalTo: playBackBtn.leadingAnchor, constant: -8),
            
            
            playBackBtn.heightAnchor.constraint(equalToConstant: 44),
            playBackBtn.widthAnchor.constraint(equalToConstant: 44),
            playBackBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playBackBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
}













