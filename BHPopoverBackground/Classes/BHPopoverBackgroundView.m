//
//  BHPopoverBackgroundView.m
//  BHPopoverBackground
//
//  Created by 詹学宝 on 2019/4/24.
//  Copyright © 2019 仰望星空，让泪水倒流. All rights reserved.
//

#import "BHPopoverBackgroundView.h"


@interface BHPopoverBackgroundConfig ()
@property (nonatomic, assign) CGFloat arrow_width;
@property (nonatomic, assign) CGFloat arrow_height;
@property (nonatomic, assign) UIEdgeInsets contentView_insets;
@property (nonatomic, strong) UIColor *arrow_color;

@property (nonatomic, assign) CGFloat arrow_width_default;
@property (nonatomic, assign) CGFloat arrow_height_default;
@property (nonatomic, assign) UIEdgeInsets contentView_insets_default;
@property (nonatomic, strong) UIColor *arrow_color_default;

+ (instancetype)shareInstance;
@end


@interface BHPopoverArrowView : UIView

@property (nonatomic, strong) UIColor *arrowColor;

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection;

@end


@implementation BHPopoverBackgroundView{
    BHPopoverArrowView *_arrowView;
    UIPopoverArrowDirection _sa_arrowDirection;
    CGFloat _bh_arrowOffset;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _arrowView = [[BHPopoverArrowView alloc] init];
        _arrowView.arrowColor = [BHPopoverBackgroundConfig shareInstance].arrow_color;
    }
    return self;
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

/* Represents the the length of the base of the arrow's triangle in points.
 */
+ (CGFloat)arrowBase {
    return [BHPopoverBackgroundConfig shareInstance].arrow_width;
}

/* Describes the distance between each edge of the background view and the corresponding edge of its content view (i.e. if it were strictly a rectangle).
 */
+ (UIEdgeInsets)contentViewInsets {
    return [BHPopoverBackgroundConfig shareInstance].contentView_insets;
}

+ (CGFloat)arrowHeight {
    return [BHPopoverBackgroundConfig shareInstance].arrow_height;
}

- (UIPopoverArrowDirection)arrowDirection {
    return UIPopoverArrowDirectionAny;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection {
    _sa_arrowDirection = arrowDirection;
    [_arrowView setArrowDirection:arrowDirection];
}

- (void)setArrowOffset:(CGFloat)arrowOffset {
    _bh_arrowOffset = arrowOffset;
}

//+ (BOOL)wantsDefaultContentAppearance {
//    return NO;
//}

- (void)layoutSubviews {
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat arrowWidth = [[self class] arrowBase];
    CGFloat arrowHeight = [[self class] arrowHeight];
    
    UIEdgeInsets edgeInset = [[self class] contentViewInsets];
    CGFloat arrowSpace;
    switch (_sa_arrowDirection) {
        case UIPopoverArrowDirectionUp:
            arrowSpace = edgeInset.top - arrowHeight;
            if (arrowSpace < 0) {
                arrowSpace = 0;
            }
            _arrowView.frame = CGRectMake((width - arrowWidth)/2 + _bh_arrowOffset, arrowSpace, arrowWidth, arrowHeight);
            break;
        case UIPopoverArrowDirectionLeft:
            arrowSpace = edgeInset.left - arrowHeight;
            if (arrowSpace < 0) {
                arrowSpace = 0;
            }
            _arrowView.frame = CGRectMake(arrowSpace, (height - arrowWidth)/2 + _bh_arrowOffset, arrowHeight, arrowWidth);
            break;
        case UIPopoverArrowDirectionDown:
            _arrowView.frame = CGRectMake((width - arrowWidth)/2 + _bh_arrowOffset, height-edgeInset.bottom, arrowWidth, arrowHeight);
            
            break;
        case UIPopoverArrowDirectionRight:
            _arrowView.frame = CGRectMake(width - edgeInset.right, (height - arrowWidth)/2 + _bh_arrowOffset, arrowHeight, arrowWidth);
            break;
        default:
            break;
    }
    
    [self addSubview:_arrowView];
}

- (void)dealloc {
    [BHPopoverBackgroundConfig setupDefaultByArrowWidth:[BHPopoverBackgroundConfig shareInstance].arrow_width_default
                                            arrowHeight:[BHPopoverBackgroundConfig shareInstance].arrow_height_default
                                             arrowColor:[BHPopoverBackgroundConfig shareInstance].arrow_color_default
                                      contentViewInsets:[BHPopoverBackgroundConfig shareInstance].contentView_insets_default];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation BHPopoverBackgroundConfig

+ (instancetype)shareInstance {
    static BHPopoverBackgroundConfig *configInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configInstance = [[BHPopoverBackgroundConfig alloc] init];
        configInstance.arrow_width = 12.0f;
        configInstance.arrow_height = 10.0f;
        configInstance.contentView_insets = UIEdgeInsetsMake(10, 10, 10, 10);
        configInstance.arrow_color = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:78/255.0 alpha:1];
        
        configInstance.arrow_width_default = 12.0f;
        configInstance.arrow_height_default = 10.0f;
        configInstance.contentView_insets_default = UIEdgeInsetsMake(10, 10, 10, 10);
        configInstance.arrow_color_default = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:78/255.0 alpha:1];
    });
    return configInstance;
}

+ (void)setupDefaultByArrowWidth:(CGFloat)arrowWidth arrowHeight:(CGFloat)arrowHeight arrowColor:(UIColor *)arrowColor contentViewInsets:(UIEdgeInsets)contentInsets {
    [BHPopoverBackgroundConfig shareInstance].arrow_width_default = arrowWidth;
    [BHPopoverBackgroundConfig shareInstance].arrow_height_default = arrowHeight;
    [BHPopoverBackgroundConfig shareInstance].contentView_insets_default = contentInsets;
    [BHPopoverBackgroundConfig shareInstance].arrow_color_default = arrowColor;
    
    [BHPopoverBackgroundConfig shareInstance].arrow_width = arrowWidth;
    [BHPopoverBackgroundConfig shareInstance].arrow_height = arrowHeight;
    [BHPopoverBackgroundConfig shareInstance].contentView_insets = contentInsets;
    [BHPopoverBackgroundConfig shareInstance].arrow_color = arrowColor;
}

+ (void)setTempArrowWidth:(CGFloat)arrowWidth {
    [BHPopoverBackgroundConfig shareInstance].arrow_width = arrowWidth;
}

+ (void)setTempArrowHeight:(CGFloat)arrowHeight {
    [BHPopoverBackgroundConfig shareInstance].arrow_height = arrowHeight;
}

+ (void)setTempContentViewInsets:(UIEdgeInsets)contentInsets {
    [BHPopoverBackgroundConfig shareInstance].contentView_insets = contentInsets;
}

+ (void)setTempArrowColor:(UIColor *)arrowColor {
    [BHPopoverBackgroundConfig shareInstance].arrow_color = arrowColor;
}

@end

@implementation BHPopoverArrowView {
    UIPopoverArrowDirection _arrowDirection;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection {
    _arrowDirection = arrowDirection;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGFloat height = CGRectGetHeight(rect);
    CGFloat width = CGRectGetWidth(rect);
    
    if (self.arrowColor == nil) {
        self.arrowColor = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:78/255.0 alpha:1];
    }
    [self.arrowColor set];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    switch (_arrowDirection) {
        case UIPopoverArrowDirectionUp:
            [path moveToPoint:CGPointMake(0, height)];
            [path addLineToPoint:CGPointMake(width, height)];
            [path addLineToPoint:CGPointMake(width/2, 0)];
            
            break;
        case UIPopoverArrowDirectionLeft:
            [path moveToPoint:CGPointMake(0, height/2)];
            [path addLineToPoint:CGPointMake(width, 0)];
            [path addLineToPoint:CGPointMake(width, height)];
            break;
        case UIPopoverArrowDirectionDown:
            [path moveToPoint:CGPointMake(0, 0)];
            [path addLineToPoint:CGPointMake(width/2, height)];
            [path addLineToPoint:CGPointMake(width, 0)];
            break;
        case UIPopoverArrowDirectionRight:
            [path moveToPoint:CGPointMake(0, 0)];
            [path addLineToPoint:CGPointMake(0, height)];
            [path addLineToPoint:CGPointMake(width, height/2)];
            break;
        default:
            break;
    }
    
    
    //关闭路径
    [path closePath];
    
    //填充
    [path fill];
}

@end


