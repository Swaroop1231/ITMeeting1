//
//  NotesListViewController.swift
//  ITMeeting
//
//  Created by TEJA on 13/06/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController,UIGestureRecognizerDelegate {

    
    var programsArray = [String]()
    @IBOutlet weak var programTableView: UITableView!

    @IBOutlet var slideMenuView: UIView!
    var  backView : UIView!
    var fromStr = String()
    
    let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var titLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        
//        self.programTableView.rowHeight = UITableViewAutomaticDimension
//        self.programTableView.estimatedRowHeight = 300.0
        
        titLabel.text = fromStr
        self.programTableView.estimatedRowHeight = 80
        self.programTableView.rowHeight = UITableViewAutomaticDimension
        
        self.programTableView.setNeedsLayout()
        self.programTableView.layoutIfNeeded()
    }
    
    override func viewWillAppear(animated: Bool)
    {
                
        self.programTableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
            
            return appdelegate.notesArray.count
       
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        
//        
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell
    {
        
//        if fromStr == "program"
//        {
            let cell = tableView.dequeueReusableCellWithIdentifier("program", forIndexPath: indexPath) as! ProgramsTableViewCell
            // let entry = data.places[indexPath.row]
            // let image = UIImage(named: entry.filename)
            //cell.bkImageView.image = image
            cell.programLabel.text = appdelegate.notesArray[indexPath.row]["notes"]
            cell.titlelabel.text = appdelegate.notesArray[indexPath.row]["title"]

            return cell
//            
//        }
//        else if fromStr == "companies"
//        {
//            let cell = tableView.dequeueReusableCellWithIdentifier("company", forIndexPath: indexPath) as! CompaniesTableViewCell
//            
//            // let entry = data.places[indexPath.row]
//            //  let image = UIImage(named: entry.filename)
//            //cell.bkImageView.image = image
//            //cell.headingLabel.text = entry.heading
//            
//            cell.companyLabel.text = self.companyArray[indexPath.row]
//            
//            
//            return cell
//            
//            
//        }
//        else
//        {
//            
//            let cell = tableView.dequeueReusableCellWithIdentifier("calender", forIndexPath: indexPath) as! CalenderTableViewCell
//            
//            // let entry = data.places[indexPath.row]
//            //  let image = UIImage(named: entry.filename)
//            //cell.bkImageView.image = image
//            //cell.headingLabel.text = entry.heading
//            
//            cell.companyLabel.text = self.companyArray[indexPath.row]
//            cell.timeLabel.text = self.timeArray[indexPath.row]
//            cell.dateLabel.text = self.dateArray[indexPath.row]
//            // cell.noteButton.addTarget(self, action: #selector(ProgramViewController.notesbuttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
//            
//            return cell
//            
//        }
    }
    
    
    
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
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
    
    
    @IBAction func cancelButtonAction(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        //        if segue.identifier == "webView"
        //        {
        //
        //            if let indexPath = programTableView.indexPathForSelectedRow
        //            {
        //                // do the work here
        //
        //                if let destinationVC = segue.destinationViewController as? WebViewController
        //                {
        //                    destinationVC.indexVal  = indexPath.row
        //                }
        //
        //
        //            }
        //        }
        //        else
        //        {
        //if let indexPath = programTableView.indexPathForSelectedRow
        // {
        if let destinationVC = segue.destinationViewController as? NotesViewController
        {
            destinationVC.fromStr  = self.fromStr
            
        }
        //}
        
        //  }
        
        
        
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
