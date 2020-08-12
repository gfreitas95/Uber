//
//  AddressesViewController.swift
//  Uber
//
//  Created by Gustavo on 11/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class AddressesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var address: Array<Addresses> = []
    
    @IBOutlet var tbAddresses: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address = get()
        tbAddresses?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    // MARK: - UITableView Delegate / Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return address.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let addresses: Addresses = address[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! AddressCell
        cell.loadUI(item: addresses)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            
            address.remove(at: indexPath.row)
            
            var urlDictionary = UserDefaults.standard.value(forKey: "addresses") as? Array<Dictionary<String,String>>
            urlDictionary?.remove(at: indexPath.row)
            UserDefaults.standard.set(urlDictionary, forKey: "addresses")
        }
        tbAddresses?.reloadData()
    }
    
    
    @IBAction func backToMap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func get() -> Array<Addresses> {
        
        var list: Array<Addresses> = []
         
        if let addresses = UserDefaults.standard.array(forKey: "addresses") as? Array<Dictionary<String,String>> {
            
            for item in addresses {
                
                let object = Addresses(date: item["date"] ?? "", address: item["address"] ?? "")
                list.append(object)
            }
        }
        return list
    }
}
