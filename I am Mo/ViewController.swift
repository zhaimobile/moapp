//
//  ViewController.swift
//  I am Mo
//
//  Created by Mo on 2/28/15.
//
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mainWebView: UIWebView!;
    var segueRequest:NSURLRequest!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainWebView.delegate = self;
    }
    
    
    override func viewWillAppear(animated: Bool) {
        // Do any additional setup after loading the view, typically from a nib.
        let localfilePath = NSBundle.mainBundle().pathForResource("index", ofType: "html", inDirectory:"zhaimobile");
        let myRequest = NSURLRequest(URL: NSURL.fileURLWithPath(localfilePath!)!);
        mainWebView.loadRequest(myRequest);
        
//        let url = NSURL (string: "http://zhaimobile.com");
//        let requestObj = NSURLRequest(URL: url!);
//        mainWebView.loadRequest(requestObj);
//        self.view.addSubview(mainWebView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if ( navigationType == UIWebViewNavigationType.LinkClicked ) {
            
            if request.URL.pathExtension == "pdf"{
                segueRequest=request;
                self.performSegueWithIdentifier("pdf", sender: self);
            }else{
                UIApplication.sharedApplication().openURL(request.URL)
            }
            return false;
        }
        
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "pdf") {
            // pass data to next view
            let viewController:DocViewController = segue.destinationViewController as DocViewController
            viewController.request = segueRequest;
        }
    }

}

