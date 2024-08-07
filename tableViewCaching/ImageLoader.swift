import UIKit

class ImageLoader {
    private let cache = NSCache<NSString, UIImage>()

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(cachedImage)
            return
        }

        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                completion(nil)
                return
            }

            self?.cache.setObject(image, forKey: urlString as NSString)
            completion(image)
        }
        task.resume()
    }
}
