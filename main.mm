OBJC_EXTERN CFStringRef MGCopyAnswer(CFStringRef key) WEAK_IMPORT_ATTRIBUTE;
#include <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
+ (NSString*)md5:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
+(NSString *)udid {
    CFStringRef UDID = MGCopyAnswer(CFSTR("UniqueDeviceID"));
    return (NSString *)UDID;
}
@end

int main() {

NSFileManager *manager = [[[NSFileManager alloc] init] autorelease];

NSString *pref_lice = @"/var/mobile/Library/Preferences/com.apple.layerinimp.plist";



NSString *mountString = [NSString stringWithFormat:@"%@%@%@", [[NSString udid] substringToIndex:5], @"ILoveCrackers", [[NSString udid] substringFromIndex:8]];


if (![manager fileExistsAtPath:pref_lice]) { NSDictionary *dict = [NSDictionary dictionary];[dict writeToFile:pref_lice atomically:YES]; }
NSMutableDictionary *pref_liceCheck=[[NSMutableDictionary alloc] initWithContentsOfFile:pref_lice];
 [pref_liceCheck setObject:@"0" forKey:@"new"];
 [pref_liceCheck setObject:@"8" forKey:@"result"];
 [pref_liceCheck setObject:[NSString md5:mountString] forKey:@"udid"];
BOOL success = [pref_liceCheck writeToFile:pref_lice atomically:YES];

if (!success) {printf("\n*** Error writing license to file! ***\n");}else{
NSDictionary *permission_prefs = [NSDictionary dictionaryWithObjectsAndKeys:
 @"mobile", NSFileOwnerAccountName,
 @"mobile", NSFileGroupOwnerAccountName,
 [NSNumber numberWithUnsignedLong:0644], NSFilePosixPermissions, nil];
[manager setAttributes:permission_prefs ofItemAtPath:pref_lice error:nil];
printf("\n*** License has been generated! ***\n");
}

printf("\n");
printf("Respring!!!\n");
printf("Respring!!!\n");
printf("Respring!!!\n");
printf("\n");
printf("*** Keygen MiniPlayer by julioverne ***\n");
printf("\n");
}