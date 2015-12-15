
#import "TabBarNavigationSegue.h"
#import "CustomTabBarUIViewController.h"
#import "TabBarBaseViewController.h"

@implementation TabBarNavigationSegue
-(void) perform{
    CustomTabBarUIViewController *tabBarController = (CustomTabBarUIViewController *) self.sourceViewController;
    UIView *previousView = [tabBarController.views objectAtIndex:tabBarController.previousView];
    UIView *targetView = [tabBarController.views objectAtIndex:tabBarController.currentView];
//    for(UIView *view in previousView.subviews){
//        [view removeFromSuperview];
//        
//    }
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    int count = [previousView.subviews count]-1;
    for(int i=1;i<=count;i++){
        UIView *view = [previousView.subviews objectAtIndex:i];
        //[view endEditing:YES];
        [view removeFromSuperview];
    }
    
    UINavigationController *desNavController = (UINavigationController*)self.destinationViewController;
    TabBarBaseViewController *cusDestinationController = (TabBarBaseViewController*)[desNavController viewControllers][0];
    cusDestinationController.delegate = tabBarController;

    
    
    UIViewController *destinationController = (UIViewController *) self.destinationViewController;
    tabBarController.currentViewController = destinationController;
    destinationController.view.frame = CGRectMake(destinationController.view.frame.origin.x, destinationController.view.frame.origin.y, destinationController.view.frame.size.width, tabBarController.scrollView.frame.size.height);
    [targetView addSubview: destinationController.view];
    
    
    
    //[destinationController didMoveToParentViewController: tabBarController];

}



@end
