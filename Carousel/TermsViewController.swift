//
//  TermsViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/14/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet var termsWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var termsLink = NSURL(string: "https://www.dropbox.com/terms?mobile=1")
        termsWebView.loadRequest(NSURLRequest(URL: termsLink!))
        // Do any additional setup after loading the view.
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
