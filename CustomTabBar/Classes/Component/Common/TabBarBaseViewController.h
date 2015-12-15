
#import <UIKit/UIKit.h>


@protocol CustomViewControllerDelegate;
@interface TabBarBaseViewController : UIViewController
@property (nonatomic, assign) id <CustomViewControllerDelegate>delegate;



-(void)freezeParentByChild:(Boolean)freeze;
@end
@protocol CustomViewControllerDelegate
@required
-(void)freezeParent:(Boolean)freeze;

@end