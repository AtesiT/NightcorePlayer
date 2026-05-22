import UIKit

final class CollectionViewListCell: UICollectionViewListCell {
    func configure(track: String, image: UIImage?) -> UIListContentConfiguration {
        var content = defaultContentConfiguration()
        
        content.text = track
        content.image = image
        
        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        content.imageProperties.cornerRadius = 4
        
        return content
    }
}
