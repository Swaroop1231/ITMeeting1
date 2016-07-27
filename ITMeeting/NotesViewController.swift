//
//  NotesViewController.swift
//  ITMeeting
//
//  Created by TEJA on 10/06/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController,UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate
{

   
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
  
    var fromStr = String()
    @IBOutlet weak var titLabel: UILabel!

    
    @IBOutlet var slideMenuView: UIView!
    var  backView : UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    
    
    @IBAction func cancelButtonAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    @IBAction func saveButtonAction(sender: AnyObject)
    {
        
        
        
        var dict = [String: String]()
        dict["notes"] = notesTextView.text
        dict["title"] = titleTextField.text
        

        appdelegate.notesArray.append(dict)
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
        //

        
       // appdelegate.notesArray .append(notesTextView.text)
//        
//        
//        
//            let alertController = UIAlertController(title: "Avvertire.!", message: "Nota Salvata", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)

    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.titleTextField.layer.borderColor = UIColor(red: 19/255, green: 16/255, blue: 130/255, alpha: 1.0).CGColor
        self.titleTextField.layer.borderWidth = 1.0
        self.titleTextField.layer.cornerRadius = 5
        
        self.notesTextView.layer.borderColor = UIColor(red: 19/255, green: 16/255, blue: 130/255, alpha: 1.0).CGColor
        self.notesTextView.layer.borderWidth = 1.0
        self.notesTextView.layer.cornerRadius = 5


        titleLabel.text = fromStr

        
       // let prefs = NSUserDefaults.standardUserDefaults()
        //self.titleLabel.text = prefs.valueForKey("userName") as? String

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func menuClick(sender: AnyObject)
    {
        
        
        self.backView = UIView(frame: CGRect(x: self.view.frame.origin.x, y:  self.view.frame.origin.y, width:  self.view.frame.size.width, height: self.view.frame.size.height))
        
        backView.backgroundColor = UIColor.clearColor()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(NotesViewController.handleTap(_:)))
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
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        
        
        self.backView.removeFromSuperview()
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"  // Recognizes enter key in keyboard
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func logoutAction(sender: AnyObject)
    {
        self.navigationController?.popToRootViewControllerAnimated(true)

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
