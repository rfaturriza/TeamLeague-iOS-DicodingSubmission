import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = UIImage(named: "fullbody")
        nameLabel.text = "Rizky Faturriza"
    }
    @IBAction func goToGithub(_ sender: UIButton) {
        let urlGithub = "https://github.com/rfaturriza"
        if let url = URL(string: urlGithub), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
}
