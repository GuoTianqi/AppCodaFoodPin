//
//  ShareViewController.swift
//  FoodPin
//
//  Created by GuoTianqi on 15/7/3.
//  Copyright (c) 2015年 GuoTianqi. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.image = UIImage(data: restaurant.image)
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        facebookButton.transform = CGAffineTransformMakeTranslation(0, view.bounds.height - facebookButton.frame.origin.y)
        emailButton.transform = CGAffineTransformMakeTranslation(0, -(facebookButton.frame.origin.y + facebookButton.bounds.height))
        emailButton.hidden = true
        
        messageButton.transform = CGAffineTransformMakeTranslation(0, view.bounds.height - messageButton.frame.origin.y)
        twitterButton.transform = CGAffineTransformMakeTranslation(0, -(twitterButton.frame.origin.y + twitterButton.bounds.height))
        twitterButton.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        emailButton.hidden = false
        UIView.animateWithDuration(0.8, delay: 0.0, usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5, options: nil, animations: {
            self.facebookButton.transform = CGAffineTransformMakeTranslation(0, 0)
            self.emailButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        
        twitterButton.hidden = false
        UIView.animateWithDuration(0.8, delay: 0.4, usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5, options: nil, animations: {
            self.messageButton.transform = CGAffineTransformMakeTranslation(0, 0)
            self.twitterButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
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
