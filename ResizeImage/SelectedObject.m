
#import "SelectedObject.h"

@implementation SelectedObject
@synthesize isObjectSelected;
@synthesize isObjectGrouped;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        isObjectSelected=NO;
        isObjectGrouped=NO;
        self.userInteractionEnabled=YES;
    }
    return self;
}

@end
