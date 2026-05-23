import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setToolBar()
    }
    
    private func setToolBar() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let theFirstCollectionVC = CollectionViewController(collectionViewLayout: layout)
        theFirstCollectionVC.title = "Music List"
        
        let theFirstVC = ViewController()
        theFirstVC.view.backgroundColor = .systemBackground
        theFirstVC.title = "Music"
        
        let theNavigationCollectionController = UINavigationController(rootViewController: theFirstCollectionVC)
        let theNavigationViewController = UINavigationController(rootViewController: theFirstVC)
        theNavigationCollectionController.tabBarItem = UITabBarItem(title: "Music list", image: UIImage(systemName: "music.note.list"), tag: 0)
        theNavigationViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note"), tag: 1)
        
        viewControllers = [theNavigationCollectionController, theNavigationViewController]
    }
}
