//
//  ImageViewController.swift
//  Casini
//
//  Created by trevor jordet on 2/10/16.
//  Copyright © 2016 jord3t. All rights reserved.
//

import UIKit

class ImageViewController : UIViewController, UIScrollViewDelegate
{
    var imageURL: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage()
    {
        if let url = imageURL {
            let imageData = NSData(contentsOfURL: url)
            if imageData != nil {
                print("imageData != nil = \(imageURL)")
                image = UIImage(data: imageData!)
                imageView.sizeToFit()
                print("imageView = \(imageView.bounds.size)")
                print("imageURL = \(imageURL)")                
            }else{
                image = nil
                print("image == nil")
            }
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get { return imageView.image}
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        if image == nil {
            imageURL = DemoURL.Stanford
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
}
