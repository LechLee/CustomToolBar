

#import "CustomTabBarUIViewController.h"

@interface CustomTabBarUIViewController ()

@end

@implementation CustomTabBarUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.segueIdentifier = [[NSMutableArray alloc] initWithObjects:@"segueOne",@"segueTwo",@"segueThree", nil];

    self.views = [[NSMutableArray alloc] init];
    self.currentView = 1;
    self.lastContentOffSetX = -1;
}

-(void)viewDidAppear:(BOOL)animated{
    self.scrollView.delegate = self;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*[self.segueIdentifier count], self.scrollView.frame.size.height)];

   
    for(int i=0;i<=[self.segueIdentifier count]-1;i++){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width*i,0,self.scrollView.frame.size.width,self.scrollView.frame.size.height)];
        
        [self.views addObject:view];
        [self.scrollView addSubview:view];
    }


    [self scroll:self.scrollView.frame.size.width*self.currentView animation:NO];
    [self swipeAction:(self.scrollView.frame.size.width*self.currentView) / self.scrollView.frame.size.width];
}





/*Swiping Logic Starts*/
-(void)swipeAction:(int)newView{
    if(newView >= 0 && newView <[self.segueIdentifier count]){
        self.previousView = self.currentView;
        self.currentView = newView;
     
        [self performSegueWithIdentifier:[self.segueIdentifier objectAtIndex:newView] sender:self];
     
        
    }
}
-(void)scroll:(int)x animation:(Boolean)a{
    [self.scrollView  setContentOffset:CGPointMake(x, 0) animated:a];
}


-(int)getIndexBasedOnSequeIdentifier:(NSString * )identifier{
    
    for (int i=0;i<=[self.segueIdentifier count]-1;i++) {
        NSString *str = [self.segueIdentifier objectAtIndex:i];
        if ([str isEqualToString:identifier])
        {
            return i;
        }
        
    }
    return -1;
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    return [self getIndexBasedOnSequeIdentifier:identifier]!=self.currentView;
   
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX = self.scrollView.contentOffset.x;
    if(self.lastContentOffSetX!=offSetX){
        int swipeViewTo = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
        [self swipeAction:swipeViewTo];        
        self.lastContentOffSetX = offSetX;
    }
}

- (IBAction)btnClick:(id)sender {
    NSInteger changeToView = [sender tag];
    [self scroll:self.scrollView.frame.size.width*changeToView animation:YES];
    [self swipeAction:(self.scrollView.frame.size.width*changeToView) / self.scrollView.frame.size.width];
}
/*Swiping Logic Ends*/


/*CustomViewControllerDelegate starts*/
-(void)freezeParent:(Boolean)freeze{

    //NSLog(@"Freeze or unfreezing Parent Scrolling");
    [self.scrollView setScrollEnabled:!freeze];
    [self.scrollView setPagingEnabled:!freeze];
}

/*CustomViewControllerDelegate end*/




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
