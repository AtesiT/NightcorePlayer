import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Заменяем на название нашего класса, в котором будет ячейка (делаем шаблон)
        self.collectionView!.register(CollectionViewListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //  У нас один список
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewListCell else {
            return UICollectionViewCell()
        }
        
        //  Присваиваем информацию из наших mock-данных данным константам
        let music = musicArray[indexPath.row]
        let image = UIImage(systemName: music.image)
        
        //  Настраиваем ячейку
        let config = cell.configure(track: music.title, image: image)
        cell.contentConfiguration = config
        
        //  Возвращаем ячейку
        return cell
    }
}
