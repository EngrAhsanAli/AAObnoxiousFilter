//
//  CoreML+Helper.swift
//  CoreML+Helper
//
//  Created by M. Ahsan Ali on 03/03/2019.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class nsfwInput : MLFeatureProvider {
    
    /// data as color (kCVPixelFormatType_32BGRA) image buffer, 224 pixels wide by 224 pixels high
    var data: CVPixelBuffer
    
    var featureNames: Set<String> {
        get {
            return ["data"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "data") {
            return MLFeatureValue(pixelBuffer: data)
        }
        return nil
    }
    
    init(data: CVPixelBuffer) {
        self.data = data
    }
}

/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class nsfwOutput : MLFeatureProvider {
    
    /// Source provided by CoreML
    
    private let provider : MLFeatureProvider
    
    /// prob as multidimensional array of doubles
    lazy var prob: MLMultiArray = {
        [unowned self] in return self.provider.featureValue(for: "prob")!.multiArrayValue
        }()!
    
    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }
    
    init(prob: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["prob" : MLFeatureValue(multiArray: prob)])
    }
    
    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class nsfw {
    var model: MLModel
    
    init(model: MLModel) {
        self.model = model
    }
    
    /**
     Make a prediction using the structured interface
     - parameters:
     - input: the input to the prediction as nsfwInput
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as nsfwOutput
     */
    func prediction(input: nsfwInput) throws -> nsfwOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }
    
    /**
     Make a prediction using the structured interface
     - parameters:
     - input: the input to the prediction as nsfwInput
     - options: prediction options
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as nsfwOutput
     */
    func prediction(input: nsfwInput, options: MLPredictionOptions) throws -> nsfwOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return nsfwOutput(features: outFeatures)
    }
    
    /**
     Make a prediction using the convenience interface
     - parameters:
     - data as color (kCVPixelFormatType_32BGRA) image buffer, 224 pixels wide by 224 pixels high
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as nsfwOutput
     */
    func prediction(data: CVPixelBuffer) throws -> nsfwOutput {
        let input_ = nsfwInput(data: data)
        return try self.prediction(input: input_)
    }
    
    /**
     Make a batch prediction using the structured interface
     - parameters:
     - inputs: the inputs to the prediction as [nsfwInput]
     - options: prediction options
     - throws: an NSError object that describes the problem
     - returns: the result of the prediction as [nsfwOutput]
     */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [nsfwInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [nsfwOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [nsfwOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  nsfwOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}

