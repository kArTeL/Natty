
//
//  UITableViewExtension.swift
//  Natty
//
//  Created by Neil García on 9/28/18.
//  Copyright © 2018 Natty. All rights reserved.
//

import UIKit

extension UITableView {

    /// Dequeue cell of given class from tableView.
    public func dequeue<T: UITableViewCell>(_: T.Type) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self)) as? T ?? T()
    }
}
