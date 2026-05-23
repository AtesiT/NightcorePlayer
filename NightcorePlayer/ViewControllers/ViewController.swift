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
    
    private lazy var nameTrack: UILabel = {
        let label = UILabel()
        label.text = "Name of a track"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var artistTrack: UILabel = {
        let label = UILabel()
        label.text = "Name of an artist"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(trackImageView)
        view.addSubview(nameTrack)
        view.addSubview(artistTrack)
        setConstraints()
    }
}

extension ViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            trackImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            trackImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            trackImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            //  Сделать высоту равную ширине картинки (квадратную картину делаем)
            trackImageView.heightAnchor.constraint(equalTo: trackImageView.widthAnchor),
            
            nameTrack.topAnchor.constraint(equalTo: trackImageView.bottomAnchor, constant: 20),
            nameTrack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            nameTrack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            
            artistTrack.topAnchor.constraint(equalTo: nameTrack.bottomAnchor, constant: 20),
            artistTrack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            artistTrack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
        ])
    }
}

