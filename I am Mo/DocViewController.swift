//
//  DocViewController.swift
//  I am Mo
//
//  Created by Mo on 2/28/15.
//
//

import UIKit

class DocViewController: UIViewController, UIWebViewDelegate{
    
    @IBOutlet weak var contentWebView: UIWebView!
    var request:NSURLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contentWebView.delegate=self;
        
        contentWebView.loadRequest(request);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        clearPDFBackground(self.contentWebView)
    }
    
    func clearPDFBackground(webView: UIWebView) {
        var view :UIView?
        view = webView as UIView
        
        while view? != nil {
            if NSStringFromClass(view?.dynamicType) == "UIWebPDFView" {
                view?.backgroundColor = UIColor.clearColor()
            }
            
            view = view?.subviews.first as UIView?
        }
    }
    
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
