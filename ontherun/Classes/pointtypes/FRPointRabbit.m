//
//  FRPointRabbit.m
//  ontherun
//
//  Created by Matt Donahoe on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FRPointRabbit.h"
#import "FRMission.h"

@implementation FRPointRabbit
- (void) updateForMission:(FRMission *)mission {
	/*
	 
	 called every half second to update the position of the point.
	 
	 latestsearch is the latestest known position of the user in the form
	 of a PathSearch object, which provides methods for moving and measuring distance
	 relative to the user's location
	 
	 perhaps instead I should create methods that are simpler
	 
	 - point can see player
	 - point cant see player
	 - player is 50 m away in this direction.
	 
	 
	 */
	
	FRPathSearch * playerview = [mission getPlayerView];
	FRMap * themap = [mission getMap];
	
	if (playerview && [playerview containsPoint:pos]) {
		//NSLog(@"in path search");
		float dist = [playerview distanceFromRoot:pos];
		switch (mystate){
			case kHappy:
				if (dist<30){
					mystate = kScared;
					//say something
					[mission speakEventually:[NSString stringWithFormat:@"You scared the %@",title]];
				}
				break;
			case kScared:
				pos = [playerview move:pos awayFromRootWithDelta:2.0];
				if (dist>150){
					mystate = kHappy;
					//we lost them.
					[mission speakEventually:[NSString stringWithFormat:@"You cant see the %@",title]];
				} else if (dist<5) {
					mystate = kDead;
					//closing in!
					[mission speakEventually:[NSString stringWithFormat:@"You caught the %@",title]];
				} else {
					if (arc4random()%5==0) [mission speakIfYouCan:[NSString stringWithFormat:@"The %@ is %i meters %@ you",
																	title,
																	(int)[playerview distanceFromRoot:pos],
																	[playerview directionFromRoot:pos]]];
					//still following
				}
				break;
			case kDead:
				//dead. do nothing.
				break;
			default:
				break;
		}
		
	} else {
		//point is not in the pathsearch
	}
}
@end