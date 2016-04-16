//
//  MapOverlayView.h
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapOverlayView : MKOverlayView

- (id)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)aImage;

@end
