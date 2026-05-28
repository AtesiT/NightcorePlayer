import UIKit
import CoreData
import UniformTypeIdentifiers

final class TabBarViewController: UITabBarController {
    
    private lazy var addMusicButton = UIBarButtonItem(
        barButtonSystemItem: .add, target: self, action: #selector(openFilePickerMusic)
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setToolBar()
    }
    
    @objc private func openFilePickerMusic() {
        openFilePicker()
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
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { [weak self] _ in
            guard let musicTitle = alert.textFields?[0].text, !musicTitle.isEmpty, let artistName = alert.textFields?[1].text, !artistName.isEmpty else {
                return
            }
            self?.saveMusic(title: musicTitle, artist: artistName)
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func saveMusic(title: String, artist: String, duration: String = "?") {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let viewContext = appDelegate.persistentContainer.viewContext
        
        let newMusic = Track(context: viewContext)
        newMusic.title = title
        newMusic.artist = artist
        newMusic.duration = duration
        
        do {
            try viewContext.save()
            print("Музыкальный трек был сохранён")
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
 
extension TabBarViewController: UIDocumentPickerDelegate {
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
    
    private func openFilePicker() {
        let musicPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.mp3, .wav, .audio])
        musicPicker.delegate = self
        present(musicPicker, animated: true)
    }
}
