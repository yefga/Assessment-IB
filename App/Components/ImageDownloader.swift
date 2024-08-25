//
//  UserItemViewModel.swift
//  App
//
//  Created by Yefga on 25/08/24.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private init() {}

    private let cache = NSCache<NSURL, UIImage>()

    func getImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }

    func saveImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}

@MainActor
class ImageDownloader {
    static var shared: ImageDownloader? = ImageDownloader()

    func loadProfileImage() async -> UIImage? {
        let url = URL(string: "https://i.pravatar.cc/250")!
        
        // Check if the image is already cached
        if let cachedImage = ImageCache.shared.getImage(for: url) {
            return cachedImage
        }
        
        // Fetch the image from the network
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                // Cache the downloaded image
                ImageCache.shared.saveImage(image, for: url)
                return image
            }
        } catch {
            print("Failed to load image: \(error)")
        }
        
        return nil
    }
}
