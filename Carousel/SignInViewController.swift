//
//  SignInViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/13/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var formImage: UIImageView!
    @IBOutlet weak var signInButtons: UIImageView!
    
    var correctEmail = "g@gk3.co"
    var correctPass = "pass"
    
    var formOrigin:CGPoint!
    var emailOrigin:CGPoint!
    var passOrigin:CGPoint!
    var signInOrigin:CGPoint!
    
    var signInDelay:Double = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formOrigin = formImage.center
        emailOrigin = emailField.center
        passOrigin = passField.center
        signInOrigin = signInButtons.center

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func doSignIn(sender: AnyObject) {
        var emailInput = emailField.text
        var passInput = passField.text
        var formClean = true

        if (passInput != "") && (emailInput != ""){
            var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            delay(signInDelay, { () -> () in
                //validate
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                if(emailInput != self.correctEmail){
                    //email is wrong
                    formClean = false
                    alertView = UIAlertView(title: "Login Failed", message: "Your email address looks wrong.", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                }
                if(passInput != self.correctPass && formClean == true){
                    //pass is wrong
                    formClean = false
                    alertView = UIAlertView(title: "Login Failed", message: "Your password is invalid.", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                }
                if formClean{
                    self.performSegueWithIdentifier("loggedIn", sender: nil)
                }
            })

            
        } else{
            var alertView = UIAlertView(title: "Um...", message: "You didn't enter anything.", delegate: self, cancelButtonTitle: "Oh, right.")
            alertView.show()
        }
    }
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey]as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(0.05, animations: {
            self.introImage.alpha = 0
        })
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            var offset:CGFloat = 110
            self.formImage.center.y = self.formOrigin.y - offset
            self.emailField.center.y = self.emailOrigin.y - offset
            self.passField.center.y = self.passOrigin.y - offset
            offset = 240
            self.signInButtons.center.y = self.signInOrigin.y - offset
            self.signInBtn.center.y = self.signInOrigin.y - offset
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey]as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            self.introImage.alpha = 1
            self.formImage.center = self.formOrigin
             self.emailField.center = self.emailOrigin
             self.passField.center = self.passOrigin
             self.signInButtons.center = self.signInOrigin
            self.signInBtn.center = self.signInOrigin
            }, completion: nil)
    }
    @IBAction func viewTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    @IBAction func didPan(sender: AnyObject) {
        self.view.endEditing(true)
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
