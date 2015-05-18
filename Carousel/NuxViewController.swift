//
//  NuxViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/17/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class NuxViewController: UIViewController {

    @IBOutlet weak var fullScreen: UIImageView!
    @IBOutlet weak var scroll: UIImageView!
    @IBOutlet weak var share: UIImageView!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        var didFullScreen = defaults.integerForKey("didFullScreen")
        var didShare = defaults.integerForKey("didShare")
        var didScroll = defaults.integerForKey("didScroll")
        var completedCount = 0
        if (didFullScreen != 1){
            fullScreen.hidden = true
        } else {
            completedCount++
        }
        if (didShare != 1){
            share.hidden = true
        } else {
            completedCount++
        }
        if (didScroll != 1){
            scroll.hidden = true
        } else {
            completedCount++
        }
        if completedCount == 3{
            defaults.setInteger(1, forKey: "nuxComplete")
            defaults.synchronize()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
