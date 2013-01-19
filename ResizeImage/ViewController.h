
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
{
    NSMutableArray *addObjectArray;
    UIImageView *dotBlueArea1,*dotBlueArea2,*dotBlueArea3,*dotBlueArea4,*dotBlueArea5,*dotBlueArea6,*dotBlueArea7,*dotBlueArea8,*dotBlueArea9;
    BOOL isDotBlueAreatouch1,isDotBlueAreatouch2,isDotBlueAreatouch3,isDotBlueAreatouch4,isDotBlueAreatouch5,isDotBlueAreatouch6,isDotBlueAreatouch7,isDotBlueAreatouch8,isDotBlueAreatouch9;
    
    BOOL isSelecteObjectRemove,isSelectObjectMove,isObjectSelect,isTouchDotArea,isGroup;
    CGPoint touch1,touch2;
    int tagcntr;
}
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

- (IBAction)tapGroup:(id)sender;
- (IBAction)tapUngroup:(id)sender;
- (IBAction)tapAdd:(id)sender;

@end
