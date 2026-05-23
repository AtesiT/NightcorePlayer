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

    /*
            BUTTONS
     */
    
    private lazy var listenAgainMusic = createButton(systemName: "arrow.trianglehead.counterclockwise") {
        print("Listen again music")
    }
    
    private lazy var back15seconds = createButton(systemName: "15.arrow.trianglehead.counterclockwise") {
        print("Back 15 seconds")
    }
    
    private lazy var pauseMusic = createButton(systemName: "playpause.fill") {
        print("Play or pause music")
    }
    
    private lazy var next15seconds = createButton(systemName: "15.arrow.trianglehead.clockwise") {
        print("Next 15 seconds")
    }
    
    private lazy var mixMusic = createButton(systemName: "waveform.path") {
        print("Mix Music")
    }
    
    private lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "0:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var musicTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "0:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var sliderValueTime = Float(0)
    
    private lazy var sliderTime: UISlider = {
        let slider = UISlider()
        slider.value = sliderValueTime
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(trackImageView)
        view.addSubview(nameTrack)
        view.addSubview(artistTrack)
        view.addSubview(listenAgainMusic)
        view.addSubview(back15seconds)
        view.addSubview(pauseMusic)
        view.addSubview(next15seconds)
        view.addSubview(mixMusic)
        view.addSubview(currentTimeLabel)
        view.addSubview(sliderTime)
        view.addSubview(musicTimeLabel)
        setConstraints()
    }
    
    private func createButton(systemName: String, action: @escaping () -> Void) -> UIButton {
        //  Создаём стандартную конфигурацию у кнопки
        var config = UIButton.Configuration.plain()
        //  Присваиваем кнопке изображение
        config.image = UIImage(systemName: systemName)
        //  Присваиваем действие
        let action = UIAction { _ in action() }
        //  Создаём саму кнопку
        let button = UIButton(configuration: config, primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    @objc private func sliderChanged(_ sender: UISlider) {
        self.sliderValueTime = sender.value
        print("Slider is:", sliderValueTime)
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
            
            //  Buttons
            
            listenAgainMusic.topAnchor.constraint(equalTo: artistTrack.bottomAnchor, constant: 20),
            listenAgainMusic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            back15seconds.topAnchor.constraint(equalTo: artistTrack.bottomAnchor, constant: 20),
            back15seconds.leadingAnchor.constraint(equalTo: listenAgainMusic.leadingAnchor, constant: 60),

            pauseMusic.topAnchor.constraint(equalTo: artistTrack.bottomAnchor, constant: 20),
            pauseMusic.leadingAnchor.constraint(equalTo: back15seconds.leadingAnchor, constant: 60),
            
            next15seconds.topAnchor.constraint(equalTo: artistTrack.bottomAnchor, constant: 20),
            next15seconds.leadingAnchor.constraint(equalTo: pauseMusic.leadingAnchor, constant: 60),
            
            mixMusic.topAnchor.constraint(equalTo: artistTrack.bottomAnchor, constant: 20),
            mixMusic.leadingAnchor.constraint(equalTo: next15seconds.leadingAnchor, constant: 60),
            
            //  Other
            
            currentTimeLabel.topAnchor.constraint(equalTo: listenAgainMusic.bottomAnchor, constant: 20),
            currentTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            sliderTime.topAnchor.constraint(equalTo: listenAgainMusic.bottomAnchor, constant: 20),
            sliderTime.leadingAnchor.constraint(equalTo: currentTimeLabel.trailingAnchor, constant: 20),
            sliderTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            musicTimeLabel.topAnchor.constraint(equalTo: listenAgainMusic.bottomAnchor, constant: 20),
            musicTimeLabel.leadingAnchor.constraint(equalTo: sliderTime.trailingAnchor, constant: 20),
            
        ])
    }
}

