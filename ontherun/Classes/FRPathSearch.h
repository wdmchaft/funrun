//
//  FRPathSearch.h
//  ontherun
//  this object is about storing the shortest paths over a graph. it is generated by the FRMap class.
//
//  Created by Matt Donahoe on 2/1/11.
//  Copyright 2011 MIT Media Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FREdgePos.h"
#import "FRMap.h"

@interface FRPathSearch : NSObject {
	NSDictionary * previous;
	NSDictionary * distance;
	FRMap * map;
	FREdgePos * root;
}
@property (nonatomic,retain) FREdgePos * root;

- (id) initWithRoot:(FREdgePos *)r previous:(NSDictionary *)p distance:(NSDictionary *)d map:(FRMap *)m;

- (BOOL) rootIsFacing:(FREdgePos*)ep;
- (BOOL) isFacingRoot:(FREdgePos*)ep;
- (BOOL) containsPoint:(FREdgePos*)ep;
- (BOOL) edgepos:(FREdgePos*)A isOnPathFromRootTo:(FREdgePos*)B;

- (FREdgePos *) moveCloserToRoot:(FREdgePos *)ep;
- (FREdgePos *) move:(FREdgePos*)ep towardRootWithDelta:(float)dx;
- (FREdgePos *) move:(FREdgePos*)ep awayFromRootWithDelta:(float)dx;
- (FREdgePos *) forkPoint:(FREdgePos*)ep;
- (FREdgePos *) edgePosFromWithDistance:(float)d;
- (FREdgePos *) edgePosThatIsDistance:(float)d fromRootAndOther:(FRPathSearch*)p;
- (FREdgePos *) edgePosHalfwayBetweenRootAndOther:(FRPathSearch*)other withDistance:(float)d;
- (FRMap *)getMap;

- (float) straightDistanceFromRoot:(FREdgePos*)ep;
- (float) rootDistanceToLatLng:(CLLocation *)ll;
- (float) distanceFromRoot:(FREdgePos*)ep;
- (float) nodeDistance:(NSNumber*)node;

- (NSArray *) directionsToRoot:(FREdgePos *)ep;

- (NSNumber *)closerNode:(NSNumber*)node;

- (NSString *) nextRoad:(FREdgePos *)ep;
- (NSString *) directionFromRoot:(FREdgePos*)ep;
- (NSString *) directionToRoot:(FREdgePos*)ep;
- (NSString *) whereShouldIGo:(FREdgePos*)ep;
@end
