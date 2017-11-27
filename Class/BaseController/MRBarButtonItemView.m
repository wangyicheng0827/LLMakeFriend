//
//  MRBarButtonItemView.m
//  CarFile
//
//  Created by MR on 2017/2/7.
//
//

#import "MRBarButtonItemView.h"

@implementation MRBarButtonItemView

+ (MRBarButtonItemView *)viewWithPopView
{
    return [[NSBundle mainBundle] instanceViewWithNibName:@"MRBarButtonItemView"
                                               identifier:@"Pop"];
}

+ (MRBarButtonItemView *)viewWithGobackAndPopView
{
    return [[NSBundle mainBundle] instanceViewWithNibName:@"MRBarButtonItemView"
                                               identifier:@"GobackAndPop"];
}

+ (MRBarButtonItemView *)viewWithTextView:(NSString *)text
{
    MRBarButtonItemView *view = [[NSBundle mainBundle] instanceViewWithNibName:@"MRBarButtonItemView"
                                                                    identifier:@"Text"];
    [view.textButton setTitle:text forState:UIControlStateNormal];
    return view;
}


+ (MRBarButtonItemView *)viewWithDismissView
{
    return [[NSBundle mainBundle] instanceViewWithNibName:@"MRBarButtonItemView"
                                               identifier:@"Dismiss"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
