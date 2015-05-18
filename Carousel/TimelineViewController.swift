//
//  TimelineViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/13/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var timelineScroll: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var nuxBanner: UIView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    var nux:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewloaded")
        timelineScroll.contentSize = feedImage.image!.size
        timelineScroll.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        println("viewwillappear")
        nux = defaults.integerForKey("doNux")
        if nux == 0{
            nuxBanner.hidden = true
            feedImage.frame.origin.y = 0
        } else {
            timelineScroll.contentSize.height = feedImage.image!.size.height + CGFloat(44)
        }

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("viewdidappear")
        var completed = defaults.integerForKey("nuxComplete")
        if completed == 1{
            UIView.animateWithDuration(0.35, animations: {
                self.nuxBanner.frame.origin.y = -44
                self.nuxBanner.alpha = 0
                self.feedImage.frame.origin.y = 0
            })
            defaults.setInteger(2, forKey: "doNux")
            defaults.setInteger(2, forKey: "nuxComplete")
            defaults.synchronize()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissNux(sender: AnyObject) {
        defaults.setInteger(0, forKey: "doNux")
        defaults.synchronize()
        UIView.animateWithDuration(0.35, animations: {
            self.nuxBanner.center.y -= 44
            self.nuxBanner.alpha = 0
            self.feedImage.center.y -= 44
        })
        timelineScroll.contentSize = feedImage.image!.size
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        defaults.setInteger(1, forKey: "didScroll")
        defaults.synchronize()
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
