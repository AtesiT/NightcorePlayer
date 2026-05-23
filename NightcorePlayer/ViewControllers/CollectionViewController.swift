import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Настройка ячейки (её размеры)
        //  Создание конфигурации списка
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        //  Создание layout, основываясь на нашей конфигурации
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        //  Присваиваем layout со стилем .plain для нашего класса в viewLayout
        self.collectionView.collectionViewLayout = layout
        
        // Заменяем на название нашего класса. Регистрация нашей ячейки.
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
        let music = musicArray[indexPath.item]
        
        let title = music.title
        let image = UIImage(systemName: music.image)
        let artist = music.artist
        let duration = music.duration
        
        //  Настраиваем ячейку
        let config = cell.configure(track: title, image: image, artist: artist, duration: duration)
        cell.contentConfiguration = config
        
        //  Создаём правую часть для ячейки, в котором будет указана длительность трека
        let durationOnRightSideLine = UICellAccessory.label(
            text: duration,
            //  reversedLayout 0 автоматически расчитывает ширину для текста
            options: .init(isHidden: false, reservedLayoutWidth: .custom(0), tintColor: .secondaryLabel, font: UIFont.systemFont(ofSize: 14), adjustsFontForContentSizeCategory: true)
        )
        cell.accessories = [durationOnRightSideLine]
        
        //  Возвращаем ячейку
        return cell
    }
}
