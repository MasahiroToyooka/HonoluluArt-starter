//
//  ArtworkViews.swift
//  HonoluluArt
//
//  Created by 豊岡正紘 on 2019/05/09.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import MapKit

class ArtworkMarkerView: MKMarkerAnnotationView {

    
    override var annotation: MKAnnotation? {
        
        willSet {
            guard let artwork = newValue as? Artwork else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: 0, y: 0)
            
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            markerTintColor = artwork.markerTintColor
//            glyphText = String(artwork.discipline.first!)
            
            if let imageName = artwork.imageName {
                glyphImage = UIImage(named: imageName)
            } else {
                glyphImage = nil
            }
        }
    }
}


class ArtworkView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let artwork = newValue as? Artwork else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            let mapsButton = UIButton(frame: CGRect(origin: .zero, size: .init(width: 30, height: 30)))
            mapsButton.setBackgroundImage(#imageLiteral(resourceName: "Maps-icon"), for: UIControl.State())
            rightCalloutAccessoryView = mapsButton
            
            if let imageName = artwork.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = artwork.subtitle
            detailCalloutAccessoryView = detailLabel
        }
    }
    
    
}
