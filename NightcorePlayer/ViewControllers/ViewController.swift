import UIKit

final class ViewController: UIViewController {
    
    private lazy var trackImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "music.note")
        imageView.tintColor = .black
        imageView.backgroundColor = .systemGray
        //  Для сжатия картинки пропорционально
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        //  Для того, чтобы обрезать бока у картинки (если картинка бы выходила за края)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(trackImageView)
        setConstraints()
    }
}

extension ViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            trackImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            trackImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            trackImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            
            trackImageView.heightAnchor.constraint(equalTo: trackImageView.widthAnchor)
        ])
    }
}

