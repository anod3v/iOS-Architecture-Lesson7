//
//  AppDetailWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 17/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewView: UIView {
    
    private(set) lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Что нового?"
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var releaseNotesLabel: UILabel = {
        let label = UILabel()
//        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.sizeToFit()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var currentVersionReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .cyan
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI() {
        self.addSubview(whatsNewLabel)
        self.addSubview(versionLabel)
        self.addSubview(releaseNotesLabel)
        self.addSubview(currentVersionReleaseDateLabel)
        
        NSLayoutConstraint.activate([
            whatsNewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            whatsNewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            whatsNewLabel.widthAnchor.constraint(equalToConstant: 200),
            whatsNewLabel.heightAnchor.constraint(equalToConstant: 20),
            
            versionLabel.topAnchor.constraint(equalTo: whatsNewLabel.bottomAnchor, constant: 10),
            versionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            versionLabel.widthAnchor.constraint(equalToConstant: 200),
            versionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            releaseNotesLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 10),
            releaseNotesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            releaseNotesLabel.widthAnchor.constraint(equalToConstant: 200),
            
            currentVersionReleaseDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            currentVersionReleaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            currentVersionReleaseDateLabel.widthAnchor.constraint(equalToConstant: 100),
            currentVersionReleaseDateLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
}

