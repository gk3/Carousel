//
//  FullScreenViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/17/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    var defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setInteger(1, forKey: "didFullScreen")
        defaults.synchronize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doShare(sender: AnyObject) {
        defaults.setInteger(1, forKey: "didShare")
        defaults.synchronize()
        
        var alertView = UIAlertView(title: "Shared!", message: nil, delegate: nil, cancelButtonTitle: nil)
        alertView.show()
        defaults.setInteger(1, forKey: "didShare")
        defaults.synchronize()
        delay(2, { () -> () in
            alertView.dismissWithClickedButtonIndex(0, animated: true)
            self.dismissViewControllerAnimated(true, completion: nil)
        })
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
