//
//  ViewController.swift
//  elinext
//
//  Created by Tai Nguyen on 27/11/2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides:[CustomView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }
    
    func createSlides() -> [CustomView] {
        let slide1:CustomView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        slide1.lbl.text = "asd"
        
        let slide2:CustomView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        slide2.lbl.text = "sss"
        
        let slide3:CustomView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! CustomView
        slide3.lbl.text = "vvv"
        
        return [slide1, slide2, slide3]
    }
    func setupSlideScrollView(slides : [CustomView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView(slides: slides)
    }

}

