//
//  BaseViewDelegate.swift
//  robook
//
//  Created by Roberto Franco on 03/01/21.
//

import Foundation

protocol BaseViewDelegate: NSObjectProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showError(_ error: String, okText: String?)
}
