//
//  AddressClass.swift
//  Uber
//
//  Created by Gustavo on 11/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {
    
    @IBOutlet var lblDate: UILabel?
    @IBOutlet var lblAddress: UILabel?
    
    func loadUI(item: Addresses) {
        lblDate?.text = item.date
        lblAddress?.text = item.address
    }
}
