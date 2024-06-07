//
//  BudgieViewController.swift
//  BudgieCatalog
//
//  Created by Hikmet Tütüncü on 7.06.2024.
//

import UIKit

class BudgieViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var budgieName: UILabel!
    
    var selectedBudgie = Budgie(name: "", img: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        budgieName.text = selectedBudgie.name
        imageView.image = selectedBudgie.img
    }

}
