//
//  CALayer+UIcolorExtension.m
//  Shipero
//
//  Created by MAC on 6/1/16.
//  Copyright © 2016 www.aapbd.com. All rights reserved.
//

#import "CALayer+UIcolorExtension.h"

@implementation CALayer (UIcolorExtension)
- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}
@end
