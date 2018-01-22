//
//  MapEventCallbackViewController.swift
//  MAMapKit_3D_Demo
//
//  Created by shaobin on 16/10/10.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

import UIKit

class MapEventCallbackViewController: UIViewController , MAMapViewDelegate {
    
    var mapView: MAMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initMapView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func initMapView() {
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        mapView.showsUserLocation = true
        self.view.addSubview(mapView)
    }
    
    //MARK:- MAMapviewDelegate
    func mapView(_ mapView: MAMapView!, didSingleTappedAt coordinate: CLLocationCoordinate2D) {
        self.view.makeToast(String.init(format: "coordinate =  {%f, %f}", coordinate.latitude,
                                        coordinate.longitude), duration: 1.5)
    }
    
    func mapView(_ mapView: MAMapView!, mapDidZoomByUser wasUserAction: Bool) {
        self.view.makeToast(String.init(format: "new zoomLevel = %.2f", self.mapView.zoomLevel), duration: 1.5)
    }
    
    func mapView(_ mapView: MAMapView!, mapDidMoveByUser wasUserAction: Bool) {
        self.view.makeToast(String.init(format: "did moved, newCenter = {%f, %f}", self.mapView.centerCoordinate.latitude,
            self.mapView.centerCoordinate.longitude), duration: 1.5)
    }
    
    func mapView(_ mapView: MAMapView!, didLongPressedAt coordinate: CLLocationCoordinate2D) {
        let msg = String.init(format: "coordinate =  {%f, %f}", coordinate.latitude, coordinate.longitude)
        let alert = UIAlertView.init(title: "", message: msg, delegate: nil, cancelButtonTitle: "Ok", otherButtonTitles:"Cancel")
        alert.show()
    }
}

