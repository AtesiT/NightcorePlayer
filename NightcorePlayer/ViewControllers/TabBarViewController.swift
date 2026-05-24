import UIKit

final class TabBarViewController: UITabBarController {
    
    private lazy var addMusicButton = UIBarButtonItem(
        barButtonSystemItem: .add, target: self, action: #selector(addMusicButtonAction)
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setToolBar()
    }
    
    @objc private func addMusicButtonAction() {
        print("Check")
        
        let alert = UIAlertController(title: "Новый трек", message: "Введите название трека", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Название"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Исполнитель"
        }
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
 
extension TabBarViewController {
    private func setToolBar() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let theFirstCollectionVC = CollectionViewController(collectionViewLayout: layout)
        theFirstCollectionVC.title = "Music List"
        theFirstCollectionVC.navigationItem.rightBarButtonItem = addMusicButton
        
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
