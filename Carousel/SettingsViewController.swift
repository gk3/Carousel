//
//  SettingsViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/13/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScroll: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScroll.contentSize = settingsImage.image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismissModal(sender: AnyObject) {
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
