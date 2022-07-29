//
//  ViewController.swift
//  DicodingSubmission
//
//  Created by Rizky Faturriza on 20/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var teamLeagueTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Untuk menyediakan data ke TableView.
        teamLeagueTable.dataSource = self
        teamLeagueTable.delegate = self
     
        // MARK: Mendaftarkan XIB ke ViewController.
        teamLeagueTable.register(
          UINib(nibName: "TeamLeagueTableViewCell", bundle: nil),
          forCellReuseIdentifier: "TeamLeagueCell"
        )
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTeamLeagueModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(
              withIdentifier: "TeamLeagueCell",
              for: indexPath
            ) as?  TeamLeagueTableViewCell{
         
              let league = dummyTeamLeagueModel[indexPath.row]
                cell.teamNameLabel.text = league.TeamName
                cell.formYearLabel.text = String(league.formYear)
                cell.badgeImage.imageFrom(url: league.badgeImage)
         
              return cell
            } else {
         
              return UITableViewCell()
            }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: dummyTeamLeagueModel[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail"{
            if let detailViewController = segue.destination as? DetailViewController{
                detailViewController.teamLeague = sender as? TeamLeagueModel
            }
        }
    }
}

