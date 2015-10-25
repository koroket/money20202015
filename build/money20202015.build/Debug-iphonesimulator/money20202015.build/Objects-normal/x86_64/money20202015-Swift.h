// Generated by Apple Swift version 2.1 (swiftlang-700.1.101.6 clang-700.1.76)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import AVFoundation;
@import FBSDKLoginKit;
@import Foundation;
@import ObjectiveC;
@import CoreGraphics;
@import CoreLocation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSURL;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSManagedObjectContext;

SWIFT_CLASS("_TtC13money2020201511AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (BOOL)application:(UIApplication * __nonnull)application openURL:(NSURL * __nonnull)url sourceApplication:(NSString * __nullable)sourceApplication annotation:(id __nonnull)annotation;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
@property (nonatomic, strong) NSURL * __nonnull applicationDocumentsDirectory;
@property (nonatomic, strong) NSManagedObjectModel * __nonnull managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator * __nonnull persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext * __nonnull managedObjectContext;
- (void)saveContext;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;
@class NSLayoutConstraint;
@class UITableView;
@class AVCaptureSession;
@class AVCaptureVideoPreviewLayer;
@class AVCaptureOutput;
@class AVCaptureConnection;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC13money2020201520CameraViewController")
@interface CameraViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) IBOutlet UIView * __null_unspecified cameraView;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * __null_unspecified cameraViewHeightConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * __null_unspecified listTableViewTopConstraint;
@property (nonatomic, strong) IBOutlet UITableView * __null_unspecified listTableView;
@property (nonatomic, strong) AVCaptureSession * __nullable captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer * __nullable videoPreviewLayer;
@property (nonatomic, strong) UIView * __nullable qrCodeFrameView;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull supportedBarCodes;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)captureOutput:(AVCaptureOutput * __null_unspecified)captureOutput didOutputMetadataObjects:(NSArray * __null_unspecified)metadataObjects fromConnection:(AVCaptureConnection * __null_unspecified)connection;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;

SWIFT_CLASS("_TtC13money2020201525ChooseUsageViewController")
@interface ChooseUsageViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)continueAsConsumer:(UIButton * __nonnull)sender;
- (IBAction)continueAsBusiness:(UIButton * __nonnull)sender;
- (void)markType:(NSString * __nonnull)type;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIImageView;

SWIFT_CLASS("_TtC13money2020201523DisplayQRViewController")
@interface DisplayQRViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIImageView * __null_unspecified qrImageView;
@property (nonatomic, copy) NSString * __nullable itemid;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)viewDidAppear:(BOOL)animated;
- (void)loadQR;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FBSDKLoginButton;
@class FBSDKLoginManagerLoginResult;
@class NSError;

SWIFT_CLASS("_TtC13money2020201519LoginViewController")
@interface LoginViewController : UIViewController <FBSDKLoginButtonDelegate>
@property (nonatomic, strong) FBSDKLoginButton * __nullable fbButton;
- (void)viewDidLoad;
- (IBAction)loginPressed:(id __nonnull)sender;
- (void)loginButton:(FBSDKLoginButton * __null_unspecified)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult * __null_unspecified)result error:(NSError * __null_unspecified)error;
- (void)loginButtonDidLogOut:(FBSDKLoginButton * __null_unspecified)loginButton;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface LoginViewController (SWIFT_EXTENSION(money20202015))
- (void)login:(NSString * __nonnull)fbid;
@end


@interface NSDictionary (SWIFT_EXTENSION(money20202015))
- (BOOL)boolValue:(NSString * __nonnull)key;
- (NSString * __nonnull)stringValue:(NSString * __nonnull)key;
@end

@class UITextField;

SWIFT_CLASS("_TtC13money2020201521NewItemViewController")
@interface NewItemViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITextField * __null_unspecified nameTextField;
@property (nonatomic, strong) IBOutlet UITextField * __null_unspecified priceTextField;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified categoryTextField;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)generatePressed:(UIButton * __nonnull)sender;
- (void)postItem;
- (void)presentQR:(NSString * __nonnull)itemid;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13money202020155Place")
@interface Place : NSObject
@property (nonatomic, copy) NSString * __nonnull name;
@property (nonatomic) BOOL isOpened;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) CGFloat latitude;
@property (nonatomic, copy) NSString * __nonnull icon_url;
@property (nonatomic, copy) NSString * __nonnull photoRef;
@property (nonatomic, copy) NSString * __nonnull pid;
- (nonnull instancetype)initWithJson:(NSDictionary * __nonnull)json OBJC_DESIGNATED_INITIALIZER;
+ (void)getPlaces:(CGFloat)latitude longitude:(CGFloat)longitude completionHandler:(void (^ __nonnull)(NSArray<Place *> * __nullable))completionHandler;
- (NSString * __nonnull)placePhotoURL;
@end

@class UILabel;

SWIFT_CLASS("_TtC13money2020201518PlaceTableViewCell")
@interface PlaceTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView * __null_unspecified placeImageView;
@property (nonatomic, strong) IBOutlet UILabel * __null_unspecified placeNameLabel;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * __nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class CLLocationManager;
@class UITextView;
@class CLLocation;

SWIFT_CLASS("_TtC13money2020201526SearchPlacesViewController")
@interface SearchPlacesViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITableView * __null_unspecified placesTableView;
@property (nonatomic, strong) CLLocationManager * __null_unspecified locationManager;
@property (nonatomic, strong) IBOutlet UITextView * __null_unspecified messageTextView;
@property (nonatomic) BOOL isConsumer;
@property (nonatomic, copy) NSArray<Place *> * __nonnull places;
@property (nonatomic, strong) CLLocation * __nullable currentLocation;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


@interface SearchPlacesViewController (SWIFT_EXTENSION(money20202015)) <CLLocationManagerDelegate>
- (void)locationManager:(CLLocationManager * __nonnull)manager didUpdateLocations:(NSArray<CLLocation *> * __nonnull)locations;
@end

@class NSIndexPath;

@interface SearchPlacesViewController (SWIFT_EXTENSION(money20202015)) <UITableViewDelegate, UIScrollViewDelegate, UITableViewDataSource>
- (CGFloat)tableView:(UITableView * __nonnull)tableView heightForHeaderInSection:(NSInteger)section;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (CGFloat)tableView:(UITableView * __nonnull)tableView heightForFooterInSection:(NSInteger)section;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView * __nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)tableView:(UITableView * __nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
@end


@interface UIImageView (SWIFT_EXTENSION(money20202015))
- (void)smartLoad:(NSString * __nonnull)imgurl;
@end


@interface UITextView (SWIFT_EXTENSION(money20202015))
- (void)setBody:(NSString * __nonnull)newText;
@end

@class UIColor;

@interface UIView (SWIFT_EXTENSION(money20202015))
- (void)circleCrop;
- (void)createBorder:(CGFloat)radius color:(UIColor * __nonnull)color width:(CGFloat)width;
@end

#pragma clang diagnostic pop
