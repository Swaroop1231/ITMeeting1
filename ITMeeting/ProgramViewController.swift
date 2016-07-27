//
//  ProgramViewController.swift
//  ITMeeting
//
//  Created by TEJA on 30/05/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate
{

    @IBOutlet weak var programTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var fromStr = String()
    var fromCmpny = String()

    
    @IBOutlet weak var sideBarButton: UIButton!
    var programsArray = [String]()
    var companyArray = [String]()
    var dateArray = [String]()
    var timeArray = [String]()
    
    var boolVal = Bool()
    
    
    @IBOutlet var slideMenuView: UIView!
    var  backView : UIView!
    
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programsArray.append("9:00 Apertura dei lavori & caffe")
        programsArray.append("9:30 Mobile Soft")
        programsArray.append("9:45 PLDA Italia")
        programsArray.append("10:00 Immobiliare")
        programsArray.append("10:30 SQS Italia Spa")
        programsArray.append("10:45 Alten France")
        programsArray.append("11:15 Aditinet Consulting Spa")


        companyArray.append("NTT data")
        companyArray.append("Accenture")
        companyArray.append("Axcel Tech")
        companyArray.append("Infosys")
        companyArray.append("Honeywell")
        companyArray.append("CapGemini")
        companyArray.append("Apple Inc")
        companyArray.append("Wipro")

        

        
        
        dateArray.append("20-06-2016")
        dateArray.append("26-06-2016")
        dateArray.append("09-07-2016")
        dateArray.append("19-07-2016")
        dateArray.append("25-07-2016")
        dateArray.append("12-08-2016")
        dateArray.append("17-08-2016")
        dateArray.append("19-08-2016")

        
        timeArray.append("9:30")
        timeArray.append("10:30")
        timeArray.append("11:45")
        timeArray.append("7:15")
        timeArray.append("10:00")
        timeArray.append("8:40")
        timeArray.append("9:00")
        timeArray.append("12:00")


        
        if fromCmpny == "company"
        {
            self.backButton.hidden = true
        }
        else
        {
            self.backButton.hidden = false
 
        }
        
        
        if boolVal == false
        {
            self.sideBarButton.hidden = true
        }
        else
        {
            self.sideBarButton.hidden = false
            
        }
//        else if fromStr == "companies"
//        {
//            self.titleLabel.text = ""
//
//        }
//        else
//        {
//            self.titleLabel.text = "CALENDARIO"
//
//        }
        
        
        let prefs = NSUserDefaults.standardUserDefaults()
        self.titleLabel.text = prefs.valueForKey("userName") as? String

        // Do any additional setup after loading the view.
    }
    
    
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
    return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        if fromStr == "program"
        {

         return programsArray.count
        }
        else  if fromStr == "companies"
        {
            return companyArray.count

        }
        else
        {
            return companyArray.count
 
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if fromStr == "program"
        {
            return 93

        }
        else  if fromStr == "companies"
        {
            return 93

        }
        else
        {
            return 166
        }

        
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell
     {
        
        if fromStr == "program"
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("program", forIndexPath: indexPath) as! ProgramsTableViewCell
           // let entry = data.places[indexPath.row]
           // let image = UIImage(named: entry.filename)
            //cell.bkImageView.image = image
            cell.programLabel.text = self.programsArray[indexPath.row]
            return cell

        }
        else if fromStr == "companies"
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("company", forIndexPath: indexPath) as! CompaniesTableViewCell
            
           // let entry = data.places[indexPath.row]
          //  let image = UIImage(named: entry.filename)
            //cell.bkImageView.image = image
            //cell.headingLabel.text = entry.heading
            
            cell.companyLabel.text = self.companyArray[indexPath.row]
            

            return cell

            
        }
        else
        {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("calender", forIndexPath: indexPath) as! CalenderTableViewCell
            
            // let entry = data.places[indexPath.row]
            //  let image = UIImage(named: entry.filename)
            //cell.bkImageView.image = image
            //cell.headingLabel.text = entry.heading
            
            cell.companyLabel.text = self.companyArray[indexPath.row]
            cell.timeLabel.text = self.timeArray[indexPath.row]
            cell.dateLabel.text = self.dateArray[indexPath.row]
            cell.noteButton.tag=indexPath.row
            cell.noteButton.addTarget(self, action: #selector(ProgramViewController.notesbuttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
           // cell.noteButton.addTarget(self, action: #selector(ProgramViewController.notesbuttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)

            return cell

        }
    }
    
    
    

    override func didReceiveMemoryWarning()
    
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func notesbuttonAction(sender1: AnyObject)
    {
       // self.performSegueWithIdentifier("notes", sender: sender1)
    }
    
    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        
        
        self.navigationController?.popViewControllerAnimated(true)
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
    @IBAction func logoutAction(sender: AnyObject)
    {
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if segue.identifier == "webView"
        {
            
        if let indexPath = programTableView.indexPathForSelectedRow
        {
            // do the work here
           
                if let destinationVC = segue.destinationViewController as? WebViewController
                {
                    destinationVC.indexVal  = indexPath.row
                }
                
            
        }
        }
        else
        {
            //if let indexPath = programTableView.indexPathForSelectedRow
           // {
            if let destinationVC = segue.destinationViewController as? NotesListViewController
            {
                destinationVC.fromStr  = self.companyArray[(sender?.tag)!]            }
            //}
            
        }
       
        
        
    }

    @IBAction func notesButtonAction(sender: AnyObject)
    {
        
        
    }
    @IBAction func speedDateButtonAction(sender: AnyObject) {
    }

    @IBAction func calendarButtonAction(sender: AnyObject) {
        fromStr = "companies"
        self.programTableView.reloadData()

    }
    

    @IBAction func programButtonAction(sender: AnyObject) {
        fromStr = "program"
        
        self.programTableView.reloadData()
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
