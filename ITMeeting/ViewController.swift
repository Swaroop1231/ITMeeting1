//
//  ViewController.swift
//  ITMeeting
//
//  Created by TEJA on 30/05/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet var slideMenuView: UIView!
    var  backView : UIView!
    
    var slectedStr = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewWillAppear(animated: Bool) {
        
   //     super.viewWillAppear()
        
        self.navigationController?.navigationBarHidden=true

     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clickOnStudent(sender: AnyObject)
    {
        
    }
    @IBAction func clickOnCredits(sender: AnyObject) {
    }
    @IBAction func clickOnCompany(sender: AnyObject)
    {
        
        
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
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(ViewController.handleTap(_:)))
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let destinationVC = segue.destinationViewController as? ProgramViewController
        {
            destinationVC.fromStr  = self.slectedStr
            destinationVC.boolVal = false

        }
        
    }
   
    
    
}

