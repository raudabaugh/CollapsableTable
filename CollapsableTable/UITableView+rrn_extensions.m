/**
 *  CollapsableTable - Collapsable table view sections with custom section header views.
 *
 *  UITableView+rrn_extensions.h
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

#import "UITableView+rrn_extensions.h"

@implementation UITableView (rrn_extensions)

-(BOOL)rrn_isFloatingHeaderInSection:(NSInteger)section {
    CGRect frame = [self rectForHeaderInSection:section];
    CGFloat y = self.contentInset.top + self.contentOffset.y;
    return y > frame.origin.y;
}

-(NSNumber *)rrn_sectionForHeaderFooterView:(UITableViewHeaderFooterView *)view {
    for (NSInteger i = 0; i < [self numberOfSections]; i++) {
        CGPoint a = [self convertPoint:CGPointZero fromView:[self headerViewForSection:i]];
        CGPoint b = [self convertPoint:CGPointZero fromView:view];
        if (a.y == b.y) {
            return @(i);
        }
    }
    return nil;
}

@end
