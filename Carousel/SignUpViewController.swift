//
//  SignUpViewController.swift
//  Carousel
//
//  Created by George Kedenburg on 5/14/15.
//  Copyright (c) 2015 GK3. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var createBtn: UIImageView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var confirmPassField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var checkBox: UIButton!
    
    var fields = []
    
    var formOrigin:CGPoint!
    var introOrigin:CGPoint!
    var submitBtnOrigin:CGPoint!
    var createBtnOrigin:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fields = [emailField, nameField, passField, confirmPassField]
        
        formOrigin = formView.center
        introOrigin = introImage.center
        submitBtnOrigin = submitBtn.center
        createBtnOrigin = createBtn.center
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitForm(sender: AnyObject) {
        var dirtyFields = 0
        for field in fields{
            if (field as! UITextField).text == ""{
                dirtyFields++
            }
        }
        
        if dirtyFields == 0 && checkBox.selected == true{
            //form filled
            if passField.text == confirmPassField.text{
                var alertView = UIAlertView(title: "Creating Account", message: nil, delegate: nil, cancelButtonTitle: nil)
                alertView.show()
                delay(2, { () -> () in
                    self.performSegueWithIdentifier("accountCreated", sender: nil)
                    alertView.dismissWithClickedButtonIndex(0, animated: true)
                })
                
            } else{
               
                var alertView = UIAlertView(title: "Oops!", message: "Your passwords don't match.", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
                
            }
        } else {
            var alertView = UIAlertView(title: "Hmm...", message: "Looks like you forgot something", delegate: nil, cancelButtonTitle: "Oops!")
            alertView.show()
        }
    }

    @IBAction func goBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func dismissKb(sender: AnyObject) {
        self.view.endEditing(true)
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
            var offset:CGFloat = 95
            self.formView.center.y = self.formOrigin.y - offset
            offset = 240
//            self.submitBtn.center.y = self.submitBtnOrigin.y - offset
//            self.createBtn.center.y = self.createBtnOrigin.y - offset
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
            self.formView.center = self.formOrigin
//            self.submitBtn.center = self.submitBtnOrigin
//            self.createBtn.center = self.createBtnOrigin
            }, completion: nil)
    }

    @IBAction func checkedBox(sender: AnyObject) {
        if checkBox.selected == false{
            self.checkBox.selected = true
            
        } else {
            self.checkBox.selected = false
        }
    }
}
