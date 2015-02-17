//
//
// Created by Rene Pirringer.
//
// 
//


#import "OBAsset.h"


@implementation OBAsset {

}

- (BOOL)saveToFile:(NSString *)path error:(NSError **)error {
    return YES;
}

- (BOOL)isEqual:(id)other {
	if (other == self) {
		return YES;
	}
	if (!other || ![[other class] isEqual:[self class]]) {
		return NO;
	}

	return [self isEqualToAsset:other];
}

- (BOOL)isEqualToAsset:(OBAsset *)asset {
	if (self == asset) {
		return YES;
	}
	if (asset == nil) {
		return NO;
	}
	if (self.identifier != asset.identifier && ![self.identifier isEqualToString:asset.identifier]) {
		return NO;
	}
	return YES;
}

- (NSUInteger)hash {
	return [self.identifier hash];
}


@end