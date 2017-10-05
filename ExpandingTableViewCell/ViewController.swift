//
//  ViewController.swift
//  ExpandingTableViewCell
//
//  Created by Aurimas Bavarskis on 04/10/2017.
//  Copyright © 2017 Aurimas Bavarskis. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ExpandingTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ExpandingTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandingTableViewCellIdentifier")
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandingTableViewCellIdentifier", for: indexPath) as! ExpandingTableViewCell
        cell.delegate = self
        return cell
    }

    // Expanding teable view cell delegate
    func didChangeText(text: String?, cell: ExpandingTableViewCell) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

