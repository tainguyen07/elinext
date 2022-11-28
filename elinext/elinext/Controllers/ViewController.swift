//
//  ViewController.swift
//  elinext
//
//  Created by Tai Nguyen on 27/11/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var totalItems = 140
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SlideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideCollectionViewCell")

        pageControl.hidesForSinglePage = true
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let temp = collectionView.bounds.height/(collectionView.bounds.width/6 - 12) - 2
        let temp2 = Int(temp)*7
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCollectionViewCell", for: indexPath) as! SlideCollectionViewCell
        if indexPath.row == 0 {
            cell.numberItems = temp2
        } else if indexPath.row == 1 {
            cell.numberItems = totalItems - temp2
        }
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}
