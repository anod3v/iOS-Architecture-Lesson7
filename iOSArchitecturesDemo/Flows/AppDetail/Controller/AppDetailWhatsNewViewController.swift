//
//  AppDetailWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 17/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailWhatsNewViewController: UIViewController {
    
    private let app: ITunesApp
    
    private let imageDownLoader = ImageDownloader()
    
    private var appDetailHeaderView: AppDetailHeaderView {
        return self.view as! AppDetailHeaderView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailHeaderView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }
    
    private func fillData() {
        downloadImage()
        appDetailHeaderView.titleLabel.text = app.appName
        appDetailHeaderView.subtitleLabel.text = app.appName
        appDetailHeaderView.ratingLabel.text = app.averageRating.flatMap { "\($0)" }
    }
    
    private func downloadImage() {
        guard let url = self.app.iconUrl else { return }
        
        imageDownLoader.getImage(fromUrl: url) { [weak self] (image, _) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.appDetailHeaderView.imageView.image = image
            }
        }
        
    }

}

