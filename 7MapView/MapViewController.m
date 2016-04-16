//
//  MapViewController.m
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import "MapViewController.h"

#import "MyLocation.h"

#import "MapOverlay.h"
#import "MapOverlayView.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;


#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setMapViewCenter];
    [self removeAnnotations];
    [self leerCiudades];
    [self removeOverlays];
    [self addOverlay];
}

- (void)setMapViewCenter
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 4.699731;
    zoomLocation.longitude= -74.171039;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(zoomLocation, 1500000, 1500000);
    [mapView setRegion:region];
}

- (void)removeAnnotations
{
    for (id<MKAnnotation> annotation in mapView.annotations)
        [self.mapView removeAnnotation:annotation];
}

- (void)leerCiudades
{
    NSString *string = [NSString stringWithContentsOfFile:[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"ciudades.txt"] encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [string componentsSeparatedByString:@"\r"];
    for (int i=0; i<[array count];i++)
    {
        NSString *ciudad = [array objectAtIndex:i];
        NSArray *array1 = [ciudad componentsSeparatedByString:@"|"];
        NSString *descripcion = [array1 objectAtIndex:0];
        NSString *nombre = [array1 objectAtIndex:1];
        NSString *coordenadas = [array1 objectAtIndex:2];
        NSString *latitud = [[coordenadas componentsSeparatedByString:@";"]objectAtIndex:0];
        NSString *longitud = [[coordenadas componentsSeparatedByString:@";"]objectAtIndex:1];
        [self agregarCiudad:descripcion nombre:nombre latitud:latitud longitud:longitud];
    }
}

- (void)agregarCiudad:(NSString *)descripcion nombre:(NSString *)nombre latitud:(NSString *)latitud longitud:(NSString *)longitud
{
    NSNumber * latitude = [NSNumber numberWithFloat:[latitud floatValue]];
    NSNumber * longitude = [NSNumber numberWithFloat:[longitud floatValue]];
    NSString * description = descripcion;
    NSString * address = nombre;
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = latitude.doubleValue;
    coordinate.longitude = longitude.doubleValue;
    
    MyLocation *location = [[MyLocation alloc] initWithName:description address:address coordinates:coordinate];
    [self.mapView addAnnotation:location];
}

- (void)removeOverlays
{
    for (id<MKOverlay> overlay in mapView.overlays)
    {
        [self.mapView removeOverlay:overlay];
    }
}

- (void)addOverlay
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 4.699731;
    zoomLocation.longitude= -74.171039;
    MKMapRect mapRect = MKMapRectMake(zoomLocation.latitude, zoomLocation.longitude, 1500000, 1500000);
    MapOverlay *overlay = [[MapOverlay alloc] initWithCoordinate:zoomLocation mapRect:mapRect];
    [self.mapView addOverlay:overlay];
}


#pragma mark - MKMapView

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MyLocation class]])
    {
        static NSString *identifier = @"MyLocation";
        MKAnnotationView *annotationView = (MKAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil)
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        else
            annotationView.annotation = annotation;
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"pin.png"];
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return annotationView;
    }
    return nil;
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MapOverlay class]])
    {
        UIImage *image = [UIImage imageNamed:@"overlay_park.png"];
        MapOverlayView *overlayView = [[MapOverlayView alloc] initWithOverlay:overlay overlayImage:image];
        return overlayView;
    }
    return nil;
}


#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
