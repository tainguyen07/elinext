//
//  ImageCollectionViewCell.swift
//  elinext
//
//  Created by Tai Nguyen on 28/11/2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = 7
        setData()
    }
    func setData() {
        if let url = URL(string: "https://loremflickr.com/200/200") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.img.image = UIImage(data: data)
                    self.activityIndicator.stopAnimating()
                }
            }
            
            task.resume()
        }
    }
}
