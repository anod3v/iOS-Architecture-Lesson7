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
    
    let dateFormatter = DateFormatter()
    
//    private let imageDownLoader = ImageDownloader()
    
    private var appDetailWhatsNewView: AppDetailWhatsNewView {
        return self.view as! AppDetailWhatsNewView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailWhatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }
    
    private func fillData() {
//        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
//        let dateReleased = dateFormatter.string(from: app.currentVersionReleaseDate ?? Date())
        let timeInterval = Date() - (app.currentVersionReleaseDate ?? Date())
        
//        downloadImage()
        appDetailWhatsNewView.versionLabel.text = "Версия \(app.version ?? "")"
        appDetailWhatsNewView.releaseNotesLabel.text = app.releaseNotes ?? ""
        appDetailWhatsNewView.currentVersionReleaseDateLabel.text = "\(timeInterval.day ?? 0) дней назад"
    }
    
//    private func downloadImage() {
//        guard let url = self.app.iconUrl else { return }
//
//        imageDownLoader.getImage(fromUrl: url) { [weak self] (image, _) in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                self.appDetailWhatsNewView.imageView.image = image
//            }
//        }
//
//    }

}

extension Date {

    static func -(recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }

}

