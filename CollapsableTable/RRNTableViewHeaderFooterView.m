/**
 *  CollapsableTable - Collapsable table view sections with custom section header views.
 *
 *  RRNTableViewHeaderFooterView.m
 *
 *  For usage, see documentation of the classes/symbols listed in this file.
 *
 *  Copyright (c) 2016 Rob Nash. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

#import "RRNTableViewHeaderFooterView.h"
#import "RRNConstants.h"

#define USER_TAPPED @"TAP"

@implementation RRNTableViewHeaderFooterView

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RRN_CONSTANT_NOTIFICATION_USER_TAPPED_TABLE_VIEW_HEADER_VIEW object:self userInfo:@{RRN_CONSTANT_USER_TAPPED_TABLE_VIEW_HEADER_VIEW_AT_POINT_KEY: [NSValue valueWithCGPoint:point]}];
}

-(void)updateTitle:(NSString *)title {
    
}

-(void)openAnimated:(BOOL)animated {
    
}

-(void)closeAnimated:(BOOL)animated {
    
}

@end
