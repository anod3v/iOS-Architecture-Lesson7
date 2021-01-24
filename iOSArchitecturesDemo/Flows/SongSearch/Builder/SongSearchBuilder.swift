//
//  SongSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Andrey on 20/01/2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongSearchBuilder {
    static func build() -> (UIViewController & SongSearchViewInput) {
        let presenter = SongPresenter()
        let viewController = SongSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
