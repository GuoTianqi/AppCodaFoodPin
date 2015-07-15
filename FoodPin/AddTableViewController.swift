//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by GuoTianqi on 15/7/10.
//  Copyright (c) 2015年 GuoTianqi. All rights reserved.
//

import UIKit
import CoreData

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var typeTextField:UITextField!
    @IBOutlet weak var locationTextField:UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var imageViewSetted = false
    var beenHere: Bool = false {
        willSet {
            if newValue {
                yesButton.backgroundColor = UIColor.redColor()
                noButton.backgroundColor = UIColor.grayColor()
            } else {
                yesButton.backgroundColor = UIColor.grayColor()
                noButton.backgroundColor = UIColor.redColor()
            }
        }
    }
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        beenHere = true
    }

    @IBAction func yesOrNoButtonClick(sender: UIButton) {
        if sender == yesButton {
            beenHere = true
        } else {
            beenHere = false
        }
    }
    
    @IBAction func saveButtonClick() {
        let name = nameTextField.text
        let type = typeTextField.text
        let location = locationTextField.text
        
        if !imageViewSetted || name.isEmpty || type.isEmpty || location.isEmpty {
            let alert = UIAlertController(title: "Oops",
                message: "We cant't proceed as you forget to fill in the restaurant name. All fields are mandatory.",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            
            presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        let log: String = "Name: " + name + "\n" +
            "Type: " + type + "\n" +
            "Location: " + location + "\n" +
            "Have you been here: " + (beenHere ? "yes" : "no")
        print(log)
        
        // save to db
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext {
            restaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: managedObjectContext) as! Restaurant
            
            restaurant.name = name
            restaurant.type = type
            restaurant.location = location
            restaurant.image = UIImagePNGRepresentation(imageView.image)
            restaurant.isVisited = beenHere
            
            var e: NSError?
            if managedObjectContext.save(&e) != true {
                println("insert error: \(e!.localizedDescription)")
                
                return
            }
        }
        
        performSegueWithIdentifier("unwindToHomeScreen", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            imageView.clipsToBounds = true
            
            imageViewSetted = true
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
