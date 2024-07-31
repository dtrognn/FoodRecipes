//
//  LoadingConfiguration.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import Foundation
import FRCommon
import SVProgressHUD

class DefaultLoadingConfiguration: ILoadingConfiguration {
    func configure() {
        SVProgressHUD.setDefaultMaskType(.black)
    }

    func showLoading() {
        SVProgressHUD.show()
    }

    func hideLoading() {
        SVProgressHUD.dismiss(withDelay: 0.5)
    }
}
