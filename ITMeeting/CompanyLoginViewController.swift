//
//  StudentRegisterViewController.swift
//  ITMeeting
//
//  Created by TEJA on 10/06/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class CompanyLoginViewController: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate
{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet var slideMenuView: UIView!
    var  backView : UIView!
    var slectedStr = String()

    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.nameTextField.layer.borderColor = UIColor(red: 19/255, green: 16/255, blue: 130/255, alpha: 1.0).CGColor
        self.nameTextField.layer.borderWidth = 1.0
        self.nameTextField.layer.cornerRadius = 5
      
        self.passwordTextField.layer.borderColor = UIColor(red: 19/255, green: 16/255, blue: 130/255, alpha: 1.0).CGColor
        self.passwordTextField.layer.borderWidth = 1.0
        self.passwordTextField.layer.cornerRadius = 5
        

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickOnProgram(sender: AnyObject) {
        
        slectedStr="program"
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue("Program", forKey: "userName")
        prefs.synchronize()
    }
    
    @IBAction func clickOnCompanies(sender: AnyObject) {
        
        slectedStr="companies"
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue("Aziende Partecipanti", forKey: "userName")
        prefs.synchronize()
        
    }

    
    @IBAction func menuClick(sender: AnyObject)
    {
        
        
        self.backView = UIView(frame: CGRect(x: self.view.frame.origin.x, y:  self.view.frame.origin.y, width:  self.view.frame.size.width, height: self.view.frame.size.height))
        
        backView.backgroundColor = UIColor.clearColor()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(StudentViewController.handleTap(_:)))
        backView.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.delegate = self
        
        self.slideMenuView.frame =  CGRectMake(self.view.frame.size.width-250, 66,  slideMenuView.frame.size.width, slideMenuView.frame.size.height)
        
        self.slideMenuView.layer.shadowColor = UIColor.blackColor().CGColor
        self.slideMenuView.layer.shadowOpacity = 1
        self.slideMenuView.layer.shadowRadius = 5
        self.slideMenuView.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width:  self.slideMenuView.frame.width, height:  self.slideMenuView.frame.height)).CGPath
        //self.slideMenuView.borderStyle = UITextBorderStyle.Bezel;
        backView.addSubview(self.slideMenuView)
        
        self.view.addSubview(backView)
        
        
    }
    
    func handleTap(gestureRecognizer: UIGestureRecognizer)
    {
        self.backView.removeFromSuperview()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginAction(sender: AnyObject)
    {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        let prefs = NSUserDefaults.standardUserDefaults()
        prefs.setValue(self.nameTextField.text, forKey: "userName")
        prefs.synchronize()
        
        if segue.identifier == "calender"
        {
            if let destinationVC = segue.destinationViewController as? ProgramViewController
            {
                destinationVC.fromStr  = "calender"
                 destinationVC.fromCmpny  = "company"
                 destinationVC.boolVal = true
                

            }
        }
        else
        {
            if let destinationVC = segue.destinationViewController as? ProgramViewController
            {
                destinationVC.fromStr  = self.slectedStr
                destinationVC.boolVal = false

            }
        }
       
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool
    {
        if nameTextField.text!.isEmpty
        {
            
            
            let alertController = UIAlertController(title: "Avvertire.!", message: "Nome utente non deve essere vuoto", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

            
            
            
        return false
        }
        else  if passwordTextField.text!.isEmpty
        {
            
            
            let alertController = UIAlertController(title: "Avvertire.!", message: "Password non deve essere vuoto", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
            
            
            return false
        }

        
        else
        {
            
            return true
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
