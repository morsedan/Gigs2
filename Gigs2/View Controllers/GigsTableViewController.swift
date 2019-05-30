//
//  GigsTableViewController.swift
//  Gigs2
//
//  Created by morse on 5/30/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class GigsTableViewController: UITableViewController {
    
    private var gigs: [Gig] = []
    
    let gigController = GigController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if gigController.bearer == nil {
            performSegue(withIdentifier: "LogInSegue", sender: self)
        } else {
            getGigs()
        }
    }
    
    func getGigs() {
        gigController.fetchGigs { result in
            if let gigs = try? result.get() {
                DispatchQueue.main.async {
                    self.gigs = gigs
                    self.tableView.reloadData()
                }
            }
            print(self.gigs)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gigs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigCell", for: indexPath)

        cell.textLabel?.text = gigs[indexPath.row].title

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewGigSegue",
            let gigDetailVC = segue.destination as? GigDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                gigDetailVC.gig = gigs[indexPath.row]
            }
            gigDetailVC.gigController = gigController
        } else if segue.identifier == "LogInSegue" {
            if let loginVC = segue.destination as? LoginViewController {
                loginVC.gigController = gigController
            }
        }
    }
}
