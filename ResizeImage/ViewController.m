
#import "ViewController.h"
#import "SelectedObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tagcntr=2;
    addObjectArray=[[NSMutableArray alloc] init];
    UIImage *imag1=  [UIImage imageNamed:@"access0.png"];
    SelectedObject *selectedObj1=[[SelectedObject alloc] initWithFrame:CGRectMake(0, 0, imag1.size.width, imag1.size.height)];
    [selectedObj1 setImage:imag1];
    selectedObj1.center=CGPointMake(50, 240);
    [self.view insertSubview:selectedObj1 atIndex:1];
    selectedObj1.tag=1;
    [addObjectArray addObject:selectedObj1];
    
    UIImage *imag2=  [UIImage imageNamed:@"access7.png"];
    SelectedObject *selectedObj2=[[SelectedObject alloc] initWithFrame:CGRectMake(0, 0, imag2.size.width, imag2.size.height)];
    [selectedObj2 setImage:imag2];
    selectedObj2.center=CGPointMake(180, 240);
    [self.view insertSubview:selectedObj2 atIndex:2];
    selectedObj2.tag=2;
    [addObjectArray addObject:selectedObj2];
    
}
-(void) objectUnSelectIFObjectSel{
    for(SelectedObject *obj in addObjectArray)
    {
        if (obj.isObjectSelected==YES) {
            obj.isObjectSelected=NO;
            isSelecteObjectRemove=YES;
            [self objectUnselected:obj];
        }
    }
}

-(void) objectUnselected:(SelectedObject *)obj{
    
    isDotBlueAreatouch1=NO;
    isDotBlueAreatouch3=NO;
    isDotBlueAreatouch7=NO;
    isDotBlueAreatouch5=NO;
    isDotBlueAreatouch2=NO;
    isDotBlueAreatouch4=NO;
    isDotBlueAreatouch6=NO;
    isDotBlueAreatouch8=NO;
    isDotBlueAreatouch9=NO;
    
    if (isSelecteObjectRemove==YES) {
        isSelecteObjectRemove=NO;
        [self removeSelectArea];
        for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
            [obj removeGestureRecognizer:gesture];
        }
    }
    
}
-(void) checkTouchDot:(SelectedObject *)obj TouchPoint:(CGPoint) touchPoint {
    CGPoint touchp=[self.view convertPoint:touchPoint toView:obj];
    NSLog(@"%f y=%f",touchp.x,touchp.y);
    if ( CGRectContainsPoint([dotBlueArea8 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch8=YES;
        isTouchDotArea=YES;
    }
    
    if ( CGRectContainsPoint([dotBlueArea2 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch2=YES;
        isTouchDotArea=YES;
    }
    
    if ( CGRectContainsPoint([dotBlueArea4 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch4=YES;
        isTouchDotArea=YES;
        
    }
    
    if ( CGRectContainsPoint([dotBlueArea6 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch6=YES;
        isTouchDotArea=YES;
    }
    if ( CGRectContainsPoint([dotBlueArea1 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch1=YES;
        isTouchDotArea=YES;
    }
    if ( CGRectContainsPoint([dotBlueArea3 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch3=YES;
        isTouchDotArea=YES;
    }
    if ( CGRectContainsPoint([dotBlueArea5 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch5=YES;
        isTouchDotArea=YES;
        
    }
    if ( CGRectContainsPoint([dotBlueArea7 frame],[self.view convertPoint:touchPoint toView:obj])) {
        isDotBlueAreatouch7=YES;
        isTouchDotArea=YES;
    }
    
}
-(void) tapDelete
{
    if (isGroup==NO){
        
    if ([addObjectArray count]<=8) {
        self.addBtn.enabled=YES;
    }

    for(SelectedObject *obj in addObjectArray){
        if (obj.isObjectSelected==YES) {
            [addObjectArray removeObject:obj];
            [obj removeFromSuperview];
            break;
        }
    }
    }else{
        for(SelectedObject *obj in addObjectArray){
            [obj removeFromSuperview];
        }
        [addObjectArray removeAllObjects];
        self.addBtn.enabled=YES;
    }
}
-(void)objectSelected:(SelectedObject *) obj{
    
    obj.isObjectSelected=YES;
    
    [self makeSelectedArea:obj];
    isObjectSelect=YES;
    
    [self applyGesture:obj];
}

-(void) objectMoveAndPinch:(SelectedObject *) obj TouchPoint:(UITouch*) touch{
    
    CGPoint touchPoint=[touch locationInView:[touch view]];
    CGPoint previousTouchPoint = [touch previousLocationInView:[touch view]];
    float scaleX=0,scaleY=0;
    scaleX=touchPoint.x-previousTouchPoint.x;
    scaleY=touchPoint.y-previousTouchPoint.y;
    if (isDotBlueAreatouch8==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea1.frame.origin.x-5, dotBlueArea1.frame.origin.y-5, dotBlueArea1.frame.size.width+10, dotBlueArea1.frame.size.height+10), CGRectMake(dotBlueArea2.frame.origin.x-5, dotBlueArea2.frame.origin.y-5, dotBlueArea2.frame.size.width+10, dotBlueArea2.frame.size.height+10)) ) {
            if (scaleX>0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x+scaleX, obj.frame.origin.y, obj.frame.size.width-scaleX, obj.frame.size.height);
    }
    
    if (isDotBlueAreatouch2==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea1.frame.origin.x-5, dotBlueArea1.frame.origin.y-5, dotBlueArea1.frame.size.width+10, dotBlueArea1.frame.size.height+10), CGRectMake(dotBlueArea8.frame.origin.x-5, dotBlueArea8.frame.origin.y-5, dotBlueArea8.frame.size.width+10, dotBlueArea8.frame.size.height+10)) ) {
            if (scaleY>0) {
                return;
            }
        }
        
        obj.frame=CGRectMake(obj.frame.origin.x, obj.frame.origin.y+scaleY, obj.frame.size.width, obj.frame.size.height-scaleY);
        isTouchDotArea=YES;
    }
    if (isDotBlueAreatouch4==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea2.frame.origin.x-5, dotBlueArea2.frame.origin.y-5, dotBlueArea2.frame.size.width+10, dotBlueArea2.frame.size.height+10), CGRectMake(dotBlueArea3.frame.origin.x-5, dotBlueArea3.frame.origin.y-5, dotBlueArea3.frame.size.width+10, dotBlueArea3.frame.size.height+10))) {
            if (scaleX<0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x, obj.frame.origin.y, obj.frame.size.width+scaleX, obj.frame.size.height);
        isTouchDotArea=YES;
    }
    if (isDotBlueAreatouch6==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea8.frame.origin.x-5, dotBlueArea8.frame.origin.y-5, dotBlueArea8.frame.size.width+10, dotBlueArea8.frame.size.height+10), CGRectMake(dotBlueArea7.frame.origin.x-5, dotBlueArea7.frame.origin.y-5, dotBlueArea7.frame.size.width+10, dotBlueArea7.frame.size.height+10))) {
            if (scaleY<0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x, obj.frame.origin.y, obj.frame.size.width, obj.frame.size.height+scaleY);
    }
    if (isDotBlueAreatouch1==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea1.frame.origin.x-5, dotBlueArea1.frame.origin.y-5, dotBlueArea1.frame.size.width+10, dotBlueArea1.frame.size.height+10), CGRectMake(dotBlueArea2.frame.origin.x-5, dotBlueArea2.frame.origin.y-5, dotBlueArea2.frame.size.width+10, dotBlueArea2.frame.size.height+10)) || CGRectIntersectsRect(CGRectMake(dotBlueArea1.frame.origin.x-5, dotBlueArea1.frame.origin.y-5, dotBlueArea1.frame.size.width+10, dotBlueArea1.frame.size.height+10), CGRectMake(dotBlueArea8.frame.origin.x-5, dotBlueArea8.frame.origin.y-5, dotBlueArea8.frame.size.width+10, dotBlueArea8.frame.size.height+10))) {
            if (scaleX>0 || scaleY>0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x+scaleX, obj.frame.origin.y+scaleY, obj.frame.size.width-scaleX, obj.frame.size.height-scaleY);
        isTouchDotArea=YES;
    }
    if (isDotBlueAreatouch3==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea2.frame.origin.x-5, dotBlueArea2.frame.origin.y-5, dotBlueArea2.frame.size.width+10, dotBlueArea2.frame.size.height+10), CGRectMake(dotBlueArea3.frame.origin.x-5, dotBlueArea3.frame.origin.y-5, dotBlueArea3.frame.size.width+10, dotBlueArea3.frame.size.height+10)) || CGRectIntersectsRect(CGRectMake(dotBlueArea4.frame.origin.x-5, dotBlueArea4.frame.origin.y-5, dotBlueArea4.frame.size.width+10, dotBlueArea4.frame.size.height+10), CGRectMake(dotBlueArea3.frame.origin.x-5, dotBlueArea3.frame.origin.y-5, dotBlueArea3.frame.size.width+10, dotBlueArea3.frame.size.height+10))) {
            if (scaleX<0 || scaleY>0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x, obj.frame.origin.y+scaleY, obj.frame.size.width+scaleX, obj.frame.size.height-scaleY);
    }
    
    if (isDotBlueAreatouch5==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea4.frame.origin.x-5, dotBlueArea4.frame.origin.y-5, dotBlueArea4.frame.size.width+10, dotBlueArea4.frame.size.height+10), CGRectMake(dotBlueArea5.frame.origin.x-5, dotBlueArea5.frame.origin.y-5, dotBlueArea5.frame.size.width+10, dotBlueArea5.frame.size.height+10)) || CGRectIntersectsRect(CGRectMake(dotBlueArea5.frame.origin.x-5, dotBlueArea5.frame.origin.y-5, dotBlueArea5.frame.size.width+10, dotBlueArea5.frame.size.height+10), CGRectMake(dotBlueArea6.frame.origin.x-5, dotBlueArea6.frame.origin.y-5, dotBlueArea6.frame.size.width+10, dotBlueArea6.frame.size.height+10))) {
            if (scaleX<0 || scaleY<0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x, obj.frame.origin.y, obj.frame.size.width+scaleX, obj.frame.size.height+scaleY);
    }
    if (isDotBlueAreatouch7==YES) {
        if (CGRectIntersectsRect(CGRectMake(dotBlueArea7.frame.origin.x-5, dotBlueArea7.frame.origin.y-5, dotBlueArea7.frame.size.width+10, dotBlueArea7.frame.size.height+10), CGRectMake(dotBlueArea8.frame.origin.x-5, dotBlueArea8.frame.origin.y-5, dotBlueArea8.frame.size.width+10, dotBlueArea8.frame.size.height+10)) || CGRectIntersectsRect(CGRectMake(dotBlueArea7.frame.origin.x-5, dotBlueArea7.frame.origin.y-5, dotBlueArea7.frame.size.width+10, dotBlueArea7.frame.size.height+10), CGRectMake(dotBlueArea6.frame.origin.x-5, dotBlueArea6.frame.origin.y-5, dotBlueArea6.frame.size.width+10, dotBlueArea6.frame.size.height+10))) {
            if (scaleX>0 || scaleY<0) {
                return;
            }
        }
        obj.frame=CGRectMake(obj.frame.origin.x+scaleX, obj.frame.origin.y, obj.frame.size.width-scaleX, obj.frame.size.height+scaleY);
    }
    
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    UITouch *touch = [touches anyObject];
    NSArray *allTouches = [touches allObjects];
    UITouch *t;
    isSelectObjectMove=NO;
    isSelecteObjectRemove=NO;
    if(isObjectSelect==YES){
        isTouchDotArea=NO;
        for(SelectedObject *obj in addObjectArray){
            if (obj.isObjectSelected==YES && obj.isObjectGrouped==NO){
                
                [self checkTouchDot:obj TouchPoint:[touch locationInView:self.view]];
            }
        }
    }
    
    if( isTouchDotArea==NO){
        
        for(SelectedObject *obj in addObjectArray){
            if(obj.tag==touch.view.tag  && obj.isObjectGrouped==NO && obj.isObjectSelected==NO){
                
                [self objectUnSelectIFObjectSel];
                [self objectSelected:obj];
                
            }
        }
    }
    
    if(isObjectSelect==YES){
        for(SelectedObject *obj in addObjectArray){
            if (obj.isObjectSelected==YES && obj.isObjectGrouped==NO){
                if([[event allTouches] count]==1 && isTouchDotArea==NO);{
                    if (CGRectContainsPoint([obj frame], [[allTouches objectAtIndex:0] locationInView:self.view]) ) {
                        t=[[[event allTouches] allObjects] objectAtIndex:0];
                        touch1=[t locationInView:nil];
                        isSelectObjectMove=YES;
                    }
                }
                if (isTouchDotArea==NO && isSelectObjectMove==NO){
                    isSelecteObjectRemove=YES;
                }
            }
        }
    }
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}
-(double)distance:(CGPoint)point1 toPoint:(CGPoint)point2
{
	double deltaX, deltaY;
	deltaX = point1.x - point2.x;
	deltaY = point1.y - point2.y;
	return sqrt(deltaX * deltaX + deltaY * deltaY);
}
-(void) applyGesture:(SelectedObject *) selectObject{
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [selectObject addGestureRecognizer:tapRecognizer];
    tapRecognizer.delegate=self;
}
- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer
{
    for(SelectedObject *obj in addObjectArray){
        if(obj.isObjectSelected==YES || obj.isObjectGrouped==YES)
            [self creatMenu:obj];
    }
}
-(void) tapBackto{
    [self removeSelectArea];
    for(SelectedObject *obj in addObjectArray){
        if (obj.isObjectSelected==YES ) {
            for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
                [obj removeGestureRecognizer:gesture];
            }
            obj.isObjectSelected=NO;
            
            [self.view sendSubviewToBack:obj];
        }
    }
    isObjectSelect=NO;
}
-(void) tapFrontTo{
    [self removeSelectArea];
    for(SelectedObject *obj in addObjectArray){
        if (obj.isObjectSelected==YES ) {
            for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
                [obj removeGestureRecognizer:gesture];
            }
            obj.isObjectSelected=NO;
            
            [self.view bringSubviewToFront:obj];
        }
    }
    isObjectSelect=NO;
}

-(void) creatMenu:(SelectedObject *)obj{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    CGPoint location;
    
    UIMenuItem *MenuItemFront = [[UIMenuItem alloc] initWithTitle:@"To Front" action:@selector(tapFrontTo)];
    UIMenuItem *MenuItemBack = [[UIMenuItem alloc] initWithTitle:@"To Back" action:@selector(tapBackto)];
    UIMenuItem *MenuItemDelete = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(tapDelete)];
    location = CGPointMake(obj.frame.size.width/2, 0);
    
    [obj becomeFirstResponder];
    [menuController setMenuItems:[NSArray arrayWithObjects:MenuItemFront,MenuItemBack,MenuItemDelete, nil]];
    
    [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0) inView:obj];
    [menuController setMenuVisible:YES animated:YES];
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint=[touch locationInView:[touch view]];
    CGPoint previousTouchPoint = [touch previousLocationInView:[touch view]];
    float scaleX=0,scaleY=0;
    scaleX=touchPoint.x-previousTouchPoint.x;
    scaleY=touchPoint.y-previousTouchPoint.y;
    
    if (isObjectSelect== YES) {
        
        for(SelectedObject *obj in addObjectArray){
            if (obj.isObjectSelected==YES && obj.isObjectGrouped==NO){
                UITouch* t;
                [self objectMoveAndPinch:obj TouchPoint:touch];
                
                if([[event allTouches] count]==1){
                    t=[[[event allTouches] allObjects] objectAtIndex:0];
                    if (isSelectObjectMove==YES)
                    {
                        
                        touch2=[t locationInView:self.view];
                        touch1=[t previousLocationInView:self.view];
                        obj.center=CGPointMake(obj.center.x+touch2.x-touch1.x,obj.center.y+touch2.y-touch1.y);
                        touch1=touch2;
                    }
                }
                if (isTouchDotArea==YES) {
                    isSelecteObjectRemove=NO;
                    dotBlueArea1.center=CGPointMake(obj.bounds.origin.x-10, obj.bounds.origin.y-10);
                    dotBlueArea2.center=CGPointMake(obj.frame.size.width/2, obj.bounds.origin.y-10);
                    dotBlueArea3.center=CGPointMake(obj.frame.size.width+10, obj.bounds.origin.y-10);
                    dotBlueArea4.center=CGPointMake(obj.frame.size.width+10, obj.frame.size.height/2);
                    dotBlueArea5.center=CGPointMake(obj.frame.size.width+10, obj.frame.size.height+10);
                    dotBlueArea6.center=CGPointMake(obj.frame.size.width/2, obj.frame.size.height+10);
                    dotBlueArea7.center=CGPointMake(obj.bounds.origin.x-10, obj.frame.size.height+10);
                    dotBlueArea8.center=CGPointMake(obj.bounds.origin.x-10, obj.frame.size.height/2);
                    dotBlueArea9.center=CGPointMake(obj.frame.size.width/2, obj.bounds.origin.y-45);
                    
                }
            }
        }
    }
    if (isGroup==YES) {
        for(SelectedObject *obj in addObjectArray){
            if (obj.isObjectSelected==NO && obj.isObjectGrouped==YES){
                UITouch* t;
                t=[[[event allTouches] allObjects] objectAtIndex:0];
                touch2=[t locationInView:self.view];
                touch1=[t previousLocationInView:self.view];
                obj.center=obj.center=CGPointMake(obj.center.x+touch2.x-touch1.x,obj.center.y+touch2.y-touch1.y);
            }
        }
    }
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (isObjectSelect==YES){
        
        for(SelectedObject *obj in addObjectArray){
            if (obj.isObjectSelected==YES && obj.isObjectGrouped==NO){
                isTouchDotArea=NO;
                isDotBlueAreatouch1=NO;
                isDotBlueAreatouch3=NO;
                isDotBlueAreatouch7=NO;
                isDotBlueAreatouch5=NO;
                isDotBlueAreatouch2=NO;
                isDotBlueAreatouch4=NO;
                isDotBlueAreatouch6=NO;
                isDotBlueAreatouch8=NO;
                isDotBlueAreatouch9=NO;
                if(isDotBlueAreatouch9==YES){
                    isDotBlueAreatouch9=NO;
                }
                if (isSelecteObjectRemove==YES) {
                    isSelecteObjectRemove=NO;
                    [self removeSelectArea];
                    for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
                        [obj removeGestureRecognizer:gesture];
                    }
                    
                    obj.isObjectSelected=NO;
                    
                    isObjectSelect=NO;
                    
                }
            }
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void) makeSelectedArea:(SelectedObject *) obj{
    dotBlueArea1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea1.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea1.center=CGPointMake(obj.bounds.origin.x-10, obj.bounds.origin.y-10);
    [obj addSubview:dotBlueArea1];
    
    dotBlueArea2=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea2.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea2.center=CGPointMake(obj.frame.size.width/2, obj.bounds.origin.y-10);
    [obj addSubview:dotBlueArea2];
    
    dotBlueArea3=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea3.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea3.center=CGPointMake(obj.frame.size.width+10, obj.bounds.origin.y-10);
    [obj addSubview:dotBlueArea3];
    
    dotBlueArea4=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea4.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea4.center=CGPointMake(obj.frame.size.width+10, obj.frame.size.height/2);
    [obj addSubview:dotBlueArea4];
    
    dotBlueArea5=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea5.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea5.center=CGPointMake(obj.frame.size.width+10, obj.frame.size.height+10);
    [obj addSubview:dotBlueArea5];
    
    dotBlueArea6=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea6.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea6.center=CGPointMake(obj.frame.size.width/2, obj.frame.size.height+10);
    [obj addSubview:dotBlueArea6];
    
    dotBlueArea7=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    dotBlueArea7.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea7.center=CGPointMake(obj.bounds.origin.x-10, obj.frame.size.height+10);
    [obj addSubview:dotBlueArea7];
    
    dotBlueArea8=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25) ];
    dotBlueArea8.image=[UIImage imageNamed:@"bluedotimage.png"];
    dotBlueArea8.center=CGPointMake(obj.bounds.origin.x-10, obj.frame.size.height/2);
    [obj addSubview:dotBlueArea8];
    
    
}
-(void) removeSelectArea{
    [dotBlueArea1 removeFromSuperview];
    [dotBlueArea2 removeFromSuperview];
    [dotBlueArea3 removeFromSuperview];
    [dotBlueArea4 removeFromSuperview];
    [dotBlueArea5 removeFromSuperview];
    [dotBlueArea6 removeFromSuperview];
    [dotBlueArea7 removeFromSuperview];
    [dotBlueArea8 removeFromSuperview];
}
- (IBAction)tapGroup:(id)sender {
    
    [self removeSelectArea];
    
    for(SelectedObject *obj in addObjectArray){
        for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
            [obj removeGestureRecognizer:gesture];
        }
        obj.isObjectSelected=NO;
        obj.isObjectGrouped=YES;
        [self applyGesture:obj];
        
    }
    isObjectSelect=NO;
    isGroup=YES;
    
}

- (IBAction)tapUngroup:(id)sender {
    
    isGroup=NO;
    
    for(SelectedObject *obj in addObjectArray){
        
        obj.isObjectGrouped=NO;
        for(UIGestureRecognizer *gesture in [obj gestureRecognizers]){
            [obj removeGestureRecognizer:gesture];
        }
        
    }
    isObjectSelect=NO;
    isTouchDotArea=NO;
}

- (IBAction)tapAdd:(id)sender {
    int a=arc4random()%2+1;
    NSString *str;
    if (a==1) {
        str=@"access0.png";
    }
    else{
        str=@"access7.png";
    }
    UIImage *image=[UIImage imageNamed:str];
    tagcntr++;
    SelectedObject *imgVw=[[SelectedObject alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [imgVw setImage:image];
    imgVw.center=CGPointMake(160, 240);
    imgVw.tag=tagcntr;
    [self.view addSubview:imgVw];
    [addObjectArray addObject:imgVw];
    if ([addObjectArray count]==8) {
        self.addBtn.enabled=NO;
    }
    
}
@end
