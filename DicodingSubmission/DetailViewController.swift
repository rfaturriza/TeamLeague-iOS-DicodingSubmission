import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var badgeImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var formYearLabel: UILabel!
    @IBOutlet weak var stadiumNameLabel: UILabel!
    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    var teamLeague: TeamLeagueModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let result = teamLeague{
            badgeImage.imageFrom(url: result.badgeImage)
            teamNameLabel.text = result.TeamName
            formYearLabel.text = String(result.formYear)
            stadiumNameLabel.text = result.stadiumName
            stadiumImage.imageFrom(url: result.stadiumImage)
            descLabel.text = result.description
        }
    }
}
