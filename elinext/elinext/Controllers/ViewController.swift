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
    var maxItemInPerPage = 50
    private let numberItemInRow = 7
    private var numberSlide = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SlideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideCollectionViewCell")

        pageControl.layer.cornerRadius = 5
        pageControl.hidesForSinglePage = true
        let heightOfItem = (Int(collectionView.bounds.width) - 2*6)/numberItemInRow // 2pt, 6 item, 7 item in row
        let itemsInColumn = (Int(collectionView.bounds.height) + 2) / ( 2 + heightOfItem)
        maxItemInPerPage = Int(numberItemInRow*itemsInColumn)
        numberSlide = totalItems/maxItemInPerPage + 1
        pageControl.numberOfPages = numberSlide
        collectionView.reloadData()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberSlide
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCollectionViewCell", for: indexPath) as! SlideCollectionViewCell
        if indexPath.row == 0 {
            cell.numberItems = maxItemInPerPage
        } else if indexPath.row == 1 {
            cell.numberItems = totalItems > 2*maxItemInPerPage ? maxItemInPerPage : totalItems - maxItemInPerPage
        } else {
            cell.numberItems = totalItems > 2*maxItemInPerPage ? totalItems - 2*maxItemInPerPage : 0
        }
        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    @IBAction func addNewImageButtonTapped(_ sender: Any) {
        totalItems = totalItems + 1
        numberSlide = totalItems/maxItemInPerPage + 1
        pageControl.numberOfPages = numberSlide
        collectionView.reloadData()
        //Trigger
    }
    
    @IBAction func reloadAllImageButtonTapped(_ sender: Any) {
        totalItems = 140
        collectionView.reloadData()
    }
}
