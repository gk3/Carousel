//
//  IntroViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/12/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var tile1Image: UIImageView!
    @IBOutlet weak var tile2Image: UIImageView!
    @IBOutlet weak var tile3Image: UIImageView!
    @IBOutlet weak var tile4Image: UIImageView!
    @IBOutlet weak var tile5Image: UIImageView!
    @IBOutlet weak var tile6Image: UIImageView!
    
    var tile1Dest:CGPoint!
    var tile2Dest:CGPoint!
    var tile3Dest:CGPoint!
    var tile4Dest:CGPoint!
    var tile5Dest:CGPoint!
    var tile6Dest:CGPoint!
    var tiles = []
    var tileDest = [CGPoint]()
    var tileStart = [CGPoint]()
    var tileRotation = [Int]()
    
    var defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        // set up scroll
        introScrollView.contentSize = bgImage.image!.size
        introScrollView.delegate = self
        tiles = [tile1Image, tile2Image, tile3Image, tile4Image, tile5Image, tile6Image]
        
        for tile in tiles{
            tileDest.append(tile.center)
        }
        defaults.setInteger(1, forKey: "doNux")
        defaults.setInteger(0, forKey: "didFullScreen")
        defaults.setInteger(0, forKey: "didShare")
        defaults.setInteger(0, forKey: "didScroll")
        defaults.setInteger(0, forKey: "nuxComplete")
        defaults.synchronize()
        
        tile1Image.center = CGPoint(x: 45.5, y: 545.0)
        tile1Image.transform = CGAffineTransformMakeDegreeRotation(-10.0)
        tileRotation.append(-10)
        tile1Image.transform = CGAffineTransformScale(tile1Image.transform, 0.95, 0.95)
        
        tile2Image.center = CGPoint(x: 270.0, y: 530.5)
        tile2Image.transform = CGAffineTransformMakeDegreeRotation(-13.0)
        tileRotation.append(-13)
        tile2Image.transform = CGAffineTransformScale(tile2Image.transform, 1.6, 1.6)
        
        tile3Image.center = CGPoint(x: 250.0, y: 443.0)
        tile3Image.transform = CGAffineTransformMakeDegreeRotation(14.0)
        tileRotation.append(14)
        tile3Image.transform = CGAffineTransformScale(tile3Image.transform, 1.6, 1.6)
        
        tile4Image.center = CGPoint(x: 163.0, y: 540.0)
        tile4Image.transform = CGAffineTransformMakeDegreeRotation(8.0)
        tileRotation.append(8)
        tile4Image.transform = CGAffineTransformScale(tile4Image.transform, 1.6, 1.6)
        
        tile5Image.center = CGPoint(x: 38.0, y: 434.5)
        tile5Image.transform = CGAffineTransformMakeDegreeRotation(6.0)
        tileRotation.append(6)
        tile5Image.transform = CGAffineTransformScale(tile5Image.transform, 1.6, 1.6)
        
        tile6Image.center = CGPoint(x: 140.0, y: 448.5)
        tile6Image.transform = CGAffineTransformMakeDegreeRotation(-10.0)
        tileRotation.append(-10)
        tile6Image.transform = CGAffineTransformScale(tile6Image.transform, 1.6, 1.6)
        
        for tile in tiles{
            tileStart.append(tile.center)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        var percentDone = Float(convertValue(Float(introScrollView.contentOffset.y), 0, 568, 0, 100))
        
        for (index, tile) in enumerate(tiles){
            var newX = convertValue(percentDone, Float(0), Float(100), Float(tileStart[index].x), Float(tileDest[index].x))
            var newY = convertValue(percentDone, Float(0), Float(100), Float(tileStart[index].y), Float(tileDest[index].y))
            var newR = convertValue(percentDone, Float(0), Float(100), Float(tileRotation[index]), Float(0))
            var newScale:Float?
            if index == 0{
                newScale = convertValue(percentDone, Float(0), Float(100), Float(0.95), Float(1))
            } else{
                newScale = convertValue(percentDone, Float(0), Float(100), Float(1.6), Float(1))
            }
            
            var rotation = CGAffineTransformMakeDegreeRotation(CGFloat(newR))
            var scale = CGAffineTransformMakeScale(CGFloat(newScale!), CGFloat(newScale!))
            (tile as! UIImageView).transform = CGAffineTransformConcat(rotation, scale)
            (tile as! UIImageView).center = CGPointMake(CGFloat(newX), CGFloat(newY))
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
