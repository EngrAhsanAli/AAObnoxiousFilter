//
//  AAObnoxiousFilter.swift
//  AAObnoxiousFilter
//
//  Created by M. Ahsan Ali on 03/03/2019.
//

import Foundation

open class AAObnoxiousFilter: NSObject {
    
    private override init() { }

    public static let shared = AAObnoxiousFilter()
    
    private let _model = nsfw()
    
    open var getMode: AnyObject {
        return _model
    }
    
    open func predict(_ image: UIImage) -> Double? {
        // Convert UIImage to CVPixelBuffer and predicting
        guard let buffer = image.buffer(), let output = try? _model.prediction(data: buffer) else {
            return nil // Nothing -- as image is not valid
        }
        
        // Grab the result from prediction
        return output.prob[1].doubleValue
    }
    
    
    
}
