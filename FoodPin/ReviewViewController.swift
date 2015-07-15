//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by GuoTianqi on 15/7/2.
//  Copyright (c) 2015年 GuoTianqi. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dialogView: UIView!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.image = UIImage(data: restaurant.image)
        
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, view.bounds.height - dialogView.frame.origin.y)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
    }
    
    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.5, options: nil, animations: {
                let scale = CGAffineTransformMakeScale(1.0, 1.0)
                let translate = CGAffineTransformMakeTranslation(0, 0)
                self.dialogView.transform = CGAffineTransformConcat(scale, translate)
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
