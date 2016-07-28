//
//  WebViewController.swift
//  ITMeeting
//
//  Created by TEJA on 13/06/16.
//  Copyright © 2016 Satya Swaroop. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIGestureRecognizerDelegate,UIWebViewDelegate
{

    @IBOutlet var slideMenuView: UIView!
    var  backView : UIView!
    var companyArray = [String]()
    var indexVal = Int()
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var companyWebView: UIWebView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        companyArray.append("http://www.nttdata.com/global/en/")
        companyArray.append("https://www.accenture.com/in-en")
        companyArray.append("http://www.axceltechnologies.com/")
        companyArray.append("https://www.infosys.com/")
        companyArray.append("http://www.honeywell.com/")
        companyArray.append("https://www.capgemini.com/")
        companyArray.append("http://www.apple.com/")
        

        
        let url = NSURL (string: companyArray[indexVal])
        let requestObj = NSURLRequest(URL: url!);
        companyWebView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }
    
    func webViewDidStartLoad(webView: UIWebView)
    {
        self.spinner.startAnimating()

    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.spinner.stopAnimating()

        
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
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
