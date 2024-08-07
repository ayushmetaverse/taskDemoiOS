import UIKit

class ImageTableViewCell: UITableViewCell {
    static let identifier = "ImageTableViewCell"
    private let customImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(customImageView)
        customImageView.contentMode = .scaleAspectFill
        customImageView.clipsToBounds = true
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with urlString: String, loader: ImageLoader) {
        loader.loadImage(from: urlString) { [weak self] image in
            DispatchQueue.main.async {
                self?.customImageView.image = image
            }
        }
    }
}
