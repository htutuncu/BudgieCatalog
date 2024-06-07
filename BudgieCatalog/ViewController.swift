//
//  ViewController.swift
//  BudgieCatalog
//
//  Created by Hikmet Tütüncü on 7.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var budgies = [Budgie]()
    
    var selectedBudgie = Budgie(name: "", img: UIImage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        budgies.append(Budgie(name: "Show Jumbo", img: UIImage(named: "showJumbo.jpg")!))
        budgies.append(Budgie(name: "Jumbo", img: UIImage(named: "jumbo.jpg")!))
        budgies.append(Budgie(name: "Holland", img: UIImage(named: "holland.jpg")!))
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = budgies[indexPath.row].name
        content.secondaryText = budgies[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBudgie = budgies[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            budgies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! BudgieViewController
            destinationVC.selectedBudgie = selectedBudgie
        }
    }
    
}

struct Budgie {
    let name: String
    let img: UIImage
}

