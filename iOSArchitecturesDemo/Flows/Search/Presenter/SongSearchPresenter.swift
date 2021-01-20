//
//  SongSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 20/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongSearchViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SongSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(app: ITunesSong)
}

class SongPresenter {
    weak var viewInput: (UIViewController & SongSearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestApp(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openDetails(for app: ITunesSong) {
//        let appDetailViewController = AppDetailViewController(app: app)
//        
//        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}

extension SongPresenter: SongSearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestApp(with: query)
    }
    
    func viewDidSelectApp(app: ITunesSong) {
        openDetails(for: app)
    }
    
    
}

