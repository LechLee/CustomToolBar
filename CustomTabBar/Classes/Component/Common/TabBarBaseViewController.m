

#import "TabBarBaseViewController.h"

@interface TabBarBaseViewController ()

@end

@implementation TabBarBaseViewController
@synthesize delegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
-(void)viewWillAppear:(BOOL)animated{
    [[self delegate]freezeParent:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)freezeParentByChild:(Boolean)freeze;{
    [[self delegate]freezeParent:freeze];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
