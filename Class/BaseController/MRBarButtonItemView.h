//
//  MRBarButtonItemView.h
//  CarFile
//
//  Created by MR on 2017/2/7.
//
//

#import <UIKit/UIKit.h>

@interface MRBarButtonItemView : UIView

@property (nonatomic, weak) IBOutlet UIButton *gobackButton;

@property (nonatomic, weak) IBOutlet UIButton *popButton;

@property (nonatomic, weak) IBOutlet UIButton *textButton;

@property (nonatomic, weak) IBOutlet UIButton *dismissButton;

/**
 一个 pop button 的 view

 @return view
 */
+ (MRBarButtonItemView *)viewWithPopView;


/**
 一个 pop button 和 goback button 的 view

 @return view
 */
+ (MRBarButtonItemView *)viewWithGobackAndPopView;

/**
 一个 text button 的 view

 @return view
 */
+ (MRBarButtonItemView *)viewWithTextView:(NSString *)text;

/**
 一个 dismiss button 的 view

 @return view
 */
+ (MRBarButtonItemView *)viewWithDismissView;

@end
