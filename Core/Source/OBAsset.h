//
//
// Created by Rene Pirringer.
//
// 
//


#import <Foundation/Foundation.h>


@interface OBAsset : NSObject

/*
 * property to identify the asset. This property must not be nil!!
 */
@property (nonatomic, readonly) NSString *identifier;

@property (nonatomic, readonly) UIImage *thumbnailImage;

/*
	@returns the image representation of the asset. If the asset is a video nil is returned.
            This is the 'fullScreenImage' as below.
 */
@property (nonatomic, readonly) UIImage *image;

/*
	@returns the image representation of the asset. If the asset is a video nil is returned.
            This is the orginal camera image -- the biggest and best represeation available.
 */
@property (nonatomic, readonly) UIImage *originalImage;

/*
	@returns the 'fullScreen' representation of the asset. If the asset is a video nil is returned.
            The image is fully cropped, rotated and adjusted, exactly as a user would see in Photos
            or the image picker.
 */
@property (nonatomic, readonly) UIImage *fullScreenImage;

/*
	@returns YES if the asset is a video, otherwise NO
 */
@property (nonatomic, readonly) BOOL isVideo;

/*
	@returns YES if the asset is a photo, otherwise NO
 */
@property (nonatomic, readonly) BOOL isPhoto;

/*
	@returns the playback duration of the video, or 0 if the asset is no vidoe
 */
@property (nonatomic, readonly) NSInteger duration;

/*
	The file path extension for the asset
 */
@property (nonatomic, readonly) NSString *pathExtension;

- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToAsset:(OBAsset *)asset;

- (NSUInteger)hash;

/*
* This methods saves the asset to the given file. If the file exists it is overwritten
*/
- (void)saveToFile:(NSString *)path error:(NSError **)error;


@end