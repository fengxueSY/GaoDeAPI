//
//  AMEntrySelect2Controller.m
//  MAMapKit_3D_Demo
//
//  Created by shaobin on 16/8/16.
//  Copyright © 2016年 Autonavi. All rights reserved.
//

#import "AMEntrySelect2Controller.h"

@implementation AMEntrySelect2Controller

- (void)initEntries {
    self.entryTitles = @[@"缩放控件、定位按钮、指南针、比例尺等的添加",
                         @"地图logo位置改变",
                         @"缩放、旋转、拖拽、改变地图视角操作地图",
                         @"监听点击、长按、拖拽地图等事件",
                         @"地图Poi点击功能",
                         @"改变地图中心点",
                         @"改变缩放级别",
                         @"地图动画效果",
                         @"地图截屏功能",
                         @"给地图设定一个边界，超出边界部分不显示",
                         @"设置地图以某个点进行缩放"
                         ];
    
    self.entryClasses = @[@"AddControlsViewController",
                          @"ChangeLogoPositionViewController",
                          @"OperateMapViewController",
                          @"MapEventCallbackViewController",
                          @"TouchPoiViewController",
                          @"ChangeCenterViewController",
                          @"ChangeZoomViewController",
                          @"CoreAnimationViewController",
                          @"ScreenshotViewController",
                          @"MapBoundaryViewController",
                          @"MapZoomByScreenAnchor"];
    
    self.entryDetails = self.entryClasses;
}

@end
