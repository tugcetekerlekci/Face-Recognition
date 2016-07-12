//
//  Personcell.swift
//  MissingPersons
//
//  Created by Tugce Tekerlekci on 7/10/16.
//  Copyright © 2016 Tugce Tekerlekci. All rights reserved.
//

import UIKit


class Personcell: UICollectionViewCell {

    @IBOutlet weak var personImage: UIImageView!
    
    var person: Person!
    

    func configureCell(person: Person) {
        
        self.person = person
        
        if let url = NSURL(string: "\(baseurl)\(person.personImageUrl!)")
        {
            downloadImage(url)
        }
    
    }
    
    func downloadImage(url:NSURL) {
        
        getDataFromUrl(url) { (data, response, error) in
         
            dispatch_async(dispatch_get_main_queue())
            {
                ()-> Void in
                guard let data = data where error == nil else {return }
                self.personImage.image = UIImage(data: data)
                //print("Inside of the download image")
                self.person.personImage = self.personImage.image
                //self.person.downloadFaceId()
            
            }
            
            
        }
    
    }
    
    
    func setSelected()
    {
        
        personImage.layer.borderWidth = 2.0
        personImage.layer.borderColor = UIColor.yellowColor().CGColor
        self.person.downloadFaceId()
        
    }
    
    
    
    
    func getDataFromUrl(url: NSURL , completion : ((data: NSData?, response: NSURLResponse? , error: NSError?) -> Void))
    {
        NSURLSession.sharedSession().dataTaskWithURL(url){ (data,response,error) in
            
            completion(data: data, response: response, error: error)
            
            
            }.resume()
        
    
    }
    
    
}
