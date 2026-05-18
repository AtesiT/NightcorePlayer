import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setToolBar()
    }
    
    private func setToolBar() {
        let theFirstViewController = UIViewController()
        theFirstViewController.view.backgroundColor = .systemBackground
        theFirstViewController.title = "Music"
        
        let theFirstNavigationController = UINavigationController(rootViewController: theFirstViewController)
        theFirstNavigationController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note"), tag: 0)
        
        viewControllers = [theFirstNavigationController]
    }
}
