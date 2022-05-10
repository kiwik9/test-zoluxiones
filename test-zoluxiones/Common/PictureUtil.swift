//
//  PictureUtil.swift
//  test-zoluxiones
//
//  Created by Julio Perez on 10/05/22.
//

import Foundation

class PictureUtil {
    
    public func getPhotoUrl(_ photoId : String) -> String {
        return "https://image.tmdb.org/t/p/w500/" + photoId
    }
    
}
