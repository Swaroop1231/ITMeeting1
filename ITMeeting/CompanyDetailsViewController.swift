//
//  CompanyDetailsViewController.swift
//  ITMeeting
//
//  Created by test on 28/07/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class CompanyDetailsViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate
{

    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var internSwitch: UISwitch!
    @IBOutlet weak var dateTimeTextField: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var titleStr = String()
    var intrnStr = String()


    @IBOutlet weak var titleLbl: UILabel!
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        self.descTextView.layer.borderColor = UIColor(red: 19/255, green: 16/255, blue: 130/255, alpha: 1.0).CGColor
        self.descTextView.layer.borderWidth = 1.0
        self.descTextView.layer.cornerRadius = 5
        
        
        self.dateTimeTextField.layer.borderColor = UIColor(red: 19/255, green: 16/255, blue: 130/255, alpha: 1.0).CGColor
        self.dateTimeTextField.layer.borderWidth = 1.0
        self.dateTimeTextField.layer.cornerRadius = 5
        
        titleLbl.text = titleStr
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    

func textFieldDidBeginEditing(textField: UITextField)
{

    let toolBar = UIToolbar(frame: CGRectMake(0, 0, textField.frame.size.width, textField.frame.size.height))
    let datePicker = UIDatePicker()
    let formatter = NSDateFormatter()
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(CompanyDetailsViewController.showSelectedDate(_:)))
    datePicker.addTarget(self, action: #selector(CompanyDetailsViewController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)

    let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    toolBar.setItems([doneButton, space], animated: true)
    //myDatePicker=datePicker
    //Setup inputView and placeholders
    textField.placeholder = "Select Date"
    textField.inputView = datePicker
    textField.inputAccessoryView = toolBar
    textField.text = formatter.stringFromDate(datePicker.date)
    //textField.allowsEditingTextAttributes=false
}
 
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }

    @IBAction func showSelectedDate(sender: AnyObject)
    {
        dateTimeTextField.resignFirstResponder()
    }
    @IBAction func handleDatePicker(sender: AnyObject)
    {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy, hh:mm a"
        dateTimeTextField.text = dateFormatter.stringFromDate(sender.date)
    }
    @IBAction func submitAction(sender: AnyObject)
    {
        
        
        let coredataObj = CoreDataHelper()
        
        let boolVal = coredataObj.saveCompanyDetails(titleStr, description: descTextView.text, date: dateTimeTextField.text!, intern:intrnStr )
        
        if  boolVal==true
        {
         
            let alertController = UIAlertController(title: "Alert.!", message: "Data saved successfully.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

            
            
        }
        
        

    }
    @IBAction func intershipAction(sender: AnyObject)
    {
        
        if internSwitch.on
        {
            intrnStr="no"
        }
        else
        {
            intrnStr="yes"

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
