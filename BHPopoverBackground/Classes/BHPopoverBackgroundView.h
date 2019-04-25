//
//  BHPopoverBackgroundView.h
//  BHPopoverBackground
//
//  Created by 詹学宝 on 2019/4/24.
//  Copyright © 2019 仰望星空，让泪水倒流. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 * 针对BHPopoverBackgroundView的配置，体现在内容区域和箭头
 */
@interface BHPopoverBackgroundConfig : NSObject


/**
 配置默认值

 @param arrowWidth 箭头宽度
 @param arrowHeight 箭头高度
 @param arrowColor 箭头颜色
 @param contentInsets 内容区域
 */
+ (void)setupDefaultByArrowWidth:(CGFloat)arrowWidth arrowHeight:(CGFloat)arrowHeight arrowColor:(UIColor *)arrowColor contentViewInsets:(UIEdgeInsets)contentInsets;


/**
 * 临时配置箭头宽度
 @warning 仅作用于下次BHPopoverBackgroundView被使用时
 
 @param arrowWidth 箭头宽度
 */
+ (void)setTempArrowWidth:(CGFloat)arrowWidth;


/**
 * 临时配置箭头高度
 @warning 仅作用于下次BHPopoverBackgroundView被使用时
 
 @param arrowHeight 箭头高度
 */
+ (void)setTempArrowHeight:(CGFloat)arrowHeight;


/**
 * 临时配置箭头颜色
 @warning 仅作用于下次BHPopoverBackgroundView被使用时
 
 @param arrowColor 箭头颜色
 */
+ (void)setTempArrowColor:(UIColor *)arrowColor;


/**
 * 临时设置内容区域
 @warning 仅作用于下次BHPopoverBackgroundView被使用时

 @param contentInsets 内容区域
 */
+ (void)setTempContentViewInsets:(UIEdgeInsets)contentInsets;
@end


/**
 * 用于UIPopoverPresentationController的属性：popoverBackgroundViewClasss
 * 通过BHPopoverBackgroundConfig配置内容区域、箭头
 * 若不通过BHPopoverBackgroundConfig进行配置，此库提供了默认值：
    arrow_width_default = 12.0f;
    arrow_height_default = 10.0f;
    arrow_color_default = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:78/255.0 alpha:1];
    contentView_insets_default = UIEdgeInsetsMake(10, 10, 10, 10);
 * ps：系统Popover提供的箭头不可定制
 
 */
@interface BHPopoverBackgroundView : UIPopoverBackgroundView<UIPopoverBackgroundViewMethods>



@end

NS_ASSUME_NONNULL_END
