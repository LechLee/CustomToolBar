
#import <UIKit/UIKit.h>
#import <AddressBook/ABAddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "TabBarBaseViewController.h"

@interface CustomTabBarUIViewController : UIViewController <CustomViewControllerDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UIViewController *currentViewController;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;

- (IBAction)btnClick:(id)sender;


@property(strong, nonatomic) NSMutableArray *segueIdentifier;
@property(retain, nonatomic) NSMutableArray *views;
@property(retain, nonatomic) NSMutableArray *contacts;
@property(assign, nonatomic) int previousView;
@property(assign, nonatomic) int currentView;
@property(assign, nonatomic) CGFloat lastContentOffSetX;



@end
