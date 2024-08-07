import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    private var images = [String]()
    private let imageLoader = ImageLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchRandomImages()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    private func fetchRandomImages() {
        for _ in 0..<20 {
            let randomImageUrl = "https://picsum.photos/seed/\(UUID().uuidString)/1920/1080"
            images.append(randomImageUrl)
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell else {
            return UITableViewCell()
        }
        let imageUrl = images[indexPath.row]
        cell.configure(with: imageUrl, loader: imageLoader)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == images.count - 1 {
            fetchRandomImages()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 9 / 16 // 16:9 aspect ratio
    }
}
