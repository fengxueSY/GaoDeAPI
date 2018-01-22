//
//  ViewController.swift
//  MAMapKit_2D_Swift
//
//  Created by xiaoming han on 16/9/23.
//  Copyright © 2016 Autonavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var sectionHeaders:Array<String>!
    var sectionTitles:Array<Array<String>>!
    var sectionSampleClasses: Array<Array<UIViewController.Type>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "高德地图API-3D-Swift"
        
        initTableData()
        initTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initTableData() {
        sectionHeaders = ["地图创建、展示",
                          "与地图交互(控件、手势交互、截屏等)",
                          "绘制(点、线、面、动画等)",
                          "地图数据(POI、逆地理、行政区、天气、公交、云图)",
                          "路线规划(驾车、步行、公交)",
                          "工具类(坐标转换、距离计算)",
                          "分享",
                          "离线地图",
                          "其他"]
        
        ////
        let section1 = ["地图显示、实时路况",
                        "多实例"
                       ]
        let section1_class:Array<UIViewController.Type> = [ShowMapViewController.self,
                                                           MultiMapViewController.self]
        
        ////
        let section2 = ["缩放控件、定位按钮",
                        "缩放、旋转、拖拽、改变地图视角",
                        "点击、长按、拖拽事件监听",
                        "地图POI点击功能",
                        "改变地图中心点",
                        "地图动画效果",
                        "地图截屏",
                        "边界限制",
                        "设置地图以某个点进行缩放"]
        let section2_class:Array<UIViewController.Type> = [AddControlsViewController.self,
                                                           OperateMapViewController.self,
                                                           MapEventCallbackViewController.self,
                                                           TouchPOIViewController.self,
                                                           ChangeCenterViewController.self,
                                                           CoreAnimationViewController.self,
                                                           ScreenShotViewController.self,
                                                           MapBoundaryViewController.self,
                                                           MapZoomByScreenAnchor.self]
                              
        ////
        let section3 = ["大头针样式的点标注",
                        "自定义样式点标注",
                        "动画效果点标注",
                        "固定屏幕坐标点标注",
                        "点标注平滑移动",
                        
                        "默认样式定位点",
                        "自定义样式定位点",
                        "地图上的信息窗口",
                        
                        "直线、折线、圆、多边形",
                        "多彩线",
                        "大地曲线",
                        "带导航箭头的线",
                        "模拟跑步轨迹",
                        "热力图",
                        "自定义overlay",
                        "OpenGL绘制",
                        "Tile Overlay"]
        let section3_class:Array<UIViewController.Type> = [AnnotationViewController.self,
                                                           CustomAnnotationViewController.self,
                                                           AnimatedAnnotationViewController.self,
                                                           LockedAnnotationViewController.self,
                                                           MovingAnnotationViewController.self,
                                                           
                                                           LocationViewController.self,
                                                           CustomUserLocationViewController.self,
                                                           CustomAnnotationViewController2.self,
                                                           
                                                           OverlayViewController.self,
                                                           ColoredLinesViewController.self,
                                                           GeodesicViewController.self,
                                                           TexturedLineViewController.self,
                                                           RunningLineViewController.self,
                                                           HeatMapViewController.self,
                                                           CustomOverlayViewController.self,
                                                           StereoOverlayViewController.self,
                                                           TileOverlayViewController.self ]
                              
        ////
        let section4 = ["POI搜索",
                        "云图搜索",
                        "逆地理编码(坐标转地址)",
                        "地理编码(地址转坐标)",
                        "输入自动提示",
                        "行政区划查询",
                        "天气查询",
                        "公交线路查询",
                        "公交站点查询"]
        let section4_class:Array<UIViewController.Type> = [POIKeywordSearchViewController.self,
                                                           CloudLocalSearchViewController.self,
                                                           ReGeocodeViewController.self,
                                                           GeocodeViewController.self,
                                                           TipViewController.self,
                                                           DistrictViewController.self,
                                                           WeatherViewController.self,
                                                           BuslineViewController.self,
                                                           BusstopViewController.self]
        
        ////
        let section5 = ["路线规划"]
        let section5_class:Array<UIViewController.Type> = [DriveRoutePlanningViewController.self]
        
        ////
        let section6 = ["其他坐标系转高德坐标系",
                        "地理坐标与屏幕坐标互转",
                        "两点距离计算",
                        "点与线距离计算",
                        "判断点是否在多边形内"]
        let section6_class:Array<UIViewController.Type> = [CoordinateSystemConvertViewController.self,
                                                           CoordinateConvertViewController.self,
                                                           DistanceCalculateViewController.self,
                                                           DistanceCalculateViewController2.self,
                                                           InsideTestViewController.self]
                              
        ////
        let section7 = ["短串分享"]
        let section7_class:Array<UIViewController.Type> = [NaviShareViewController.self]
        
        ////
        let section8 = ["离线地图"]
        let section8_class:Array<UIViewController.Type> = [OfflineViewController.self]
        
        ////
        let section9 = ["轨迹纠偏"]
        let section9_class:Array<UIViewController.Type> = [CorrectTraceViewController.self]
        
        
        sectionTitles = [section1, section2, section3, section4, section5, section6, section7, section8, section9]
        sectionSampleClasses = [section1_class, section2_class, section3_class, section4_class,
                                section5_class, section6_class, section7_class, section8_class, section9_class]
    }
    
    func initTableView() {
        
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.grouped)
        tableView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }

    //MARK:- TableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let section = self.sectionTitles[indexPath.section]
        let rowTitle = section[indexPath.row]
        
        let section_Class = self.sectionSampleClasses[indexPath.section]
        let vcClass = section_Class[indexPath.row]
        
        let vcInstance = vcClass.init()
        vcInstance.title = rowTitle
        
        self.navigationController?.pushViewController(vcInstance, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionDef = self.sectionTitles[section]
        return sectionDef.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    //MARK:- TableViewDataSource
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "demoCellIdentifier"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier)
        }
        
        let section = self.sectionTitles[indexPath.section]
        let rowTitle = section[indexPath.row]
        
        let section_Class = self.sectionSampleClasses[indexPath.section]
        let className = section_Class[indexPath.row]
        
        cell!.textLabel?.text = rowTitle
        cell!.detailTextLabel?.text = String(describing: className)
        
        return cell!
    }


}

