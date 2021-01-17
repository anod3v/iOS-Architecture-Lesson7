//
//  AppDetailWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 17/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewView: UIView {
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var currentVersionReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
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
        self.addSubview(versionLabel)
        self.addSubview(releaseNotesLabel)
        self.addSubview(currentVersionReleaseDateLabel)
        
        NSLayoutConstraint.activate([
            
            versionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            versionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            versionLabel.widthAnchor.constraint(equalToConstant: 100),
            versionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            releaseNotesLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 10),
            releaseNotesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            releaseNotesLabel.widthAnchor.constraint(equalToConstant: 100),
            releaseNotesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currentVersionReleaseDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            currentVersionReleaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            currentVersionReleaseDateLabel.widthAnchor.constraint(equalToConstant: 100),
            currentVersionReleaseDateLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
}
