//
//  MapViewController.swift
//  Kyukaru
//
//  Created by 平山秀昭 on 2018/09/03.
//  Copyright © 2018年 平山秀昭. All rights reserved.
//

import UIKit
import MapKit

class Spots {
    let spots = [
        "ミカド珈琲", "http://mikado-coffee.com/kyudo.html", 36.357972, 138.635025,
        "フランスベーカリー", "http://www.french-bakery.jp", 36.359240, 138.636026,
        "ブランジェ浅野屋", "http://www.b-asanoya.com/#page5", 36.359121, 138.636452,
        "土屋写真店", "http://karuizawa-ginza.org/shop/shop-tsuchiya_shashinkan/", 36.359380, 138.636060,
        "軽井沢写真館", "http://www.photo-karuizawa.com/", 36.359777, 138.636618,
        "茜谷珈琲店", "http://karuizawa-kankokyokai.jp/spot_detail/?id=1594", 36.360377, 138.637186,
        "御宿つるや", "http://www.tsuruyaryokan.jp/", 36.360941, 138.637932
        ] as [Any]
}

class MapViewController : UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //中心座標
        let center = CLLocationCoordinate2DMake(36.359240, 138.636026)
        //表示範囲
        let span = MKCoordinateSpanMake(0.005, 0.005)
        //中心座標と表示範囲のマップ登録
        let region = MKCoordinateRegionMake(center, span)
        mapView.setRegion(region, animated:true)
        //マーキング
        let sp = Spots()
        for i in 0...sp.spots.count/4-1 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(sp.spots[i * 4 + 2] as! CLLocationDegrees,
                                                               sp.spots[i * 4 + 3] as! CLLocationDegrees)
            annotation.title = sp.spots[i * 4] as! String
            mapView.addAnnotation(annotation)
        }
    }
    
}
