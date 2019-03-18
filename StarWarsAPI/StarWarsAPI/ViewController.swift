//
//  ViewController.swift
//  StarWarsAPI
//
//  Created by Gustavo Aryel de Amo on 18/03/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    
    @IBAction func onGetTapped() {
        print("GET")
        NetworkingService.shared.getPeople { response in
            self.people = response.people
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PeopleToDetails",
            let detailsVC = segue.destination as? DetailsVC,
            let person = sender as AnyObject as? Person
            else {return}
        detailsVC.person = person
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PeopleToDetails", sender: people[indexPath.row])
    }
}

