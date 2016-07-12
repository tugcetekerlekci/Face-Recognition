//
//  Person.swift
//  MissingPersons
//
//  Created by Tugce Tekerlekci on 7/10/16.
//  Copyright © 2016 Tugce Tekerlekci. All rights reserved.
//

import Foundation
import UIKit
import ProjectOxfordFace

class Person{
    
    var faceId: String?
    var  personImage : UIImage?
    var personImageUrl: String?
    
    init(personImageUrl: String)
    {
        self.personImageUrl  = personImageUrl
    
    }
    func downloadFaceId(){
        
        if let img =  personImage , let imgData = UIImageJPEGRepresentation(img,0.8)
        {
            FaceService.instance.client.detectWithData(imgData,returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil , completionBlock: { (faces: [MPOFace]! , err:  NSError!) in
                
                //print("faceid -1")
                
                if err == nil{
                
                  //  print("faceid 1")
                    
                    var faceId: String?
                    
                    for face in faces
                    {
                         // print("faceid 2")
                        faceId = face.faceId
                        print("Face id: \(faceId)")
                        break
                    }
                
                    self.faceId = faceId
                }
                
                
                
            })
        
        }
        
    
    }

}
