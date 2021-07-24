//
//  ViewUtils.swift
//  airviroment-2021-mobile
//
//  Created by Letnja Praksa 4 on 23.7.21..
//

import UIKit

class ViewUtils {

    static func getKeyWindow() -> UIWindow? {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.makeKeyAndVisible()
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
}
