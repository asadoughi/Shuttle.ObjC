//
//  parse_string.m
//

#import <Foundation/Foundation.h>

@interface DriversLicense : NSObject {
@private
    NSString* _firstName;
    NSString* _lastName;
    int _dateOfBirth;
    NSString *_month;
    NSString *_year;
    NSString *_day;
};
@end

@implementation DriversLicense

-(BOOL)isInvalid
{
    return _dateOfBirth == nil || _dateOfBirth == 0;
}
-(NSString *)description
{
//    return [NSString stringWithFormat:@"Driver's License: %@ %@, DOB is %@ %@, %@", _firstName, _lastName, _month, _day, _year ];

    return [NSString stringWithFormat:@"Driver's License: %@ %@, DOB is %d", _firstName, _lastName, _dateOfBirth];
}

- (id) initWithFirstName:(NSString *)firstName LastName:(NSString *)lastName DateOfBirth:(int)dateOfBirth
{
    self = [super init];
    _firstName = firstName;
    _lastName = lastName;
    _dateOfBirth = dateOfBirth; // format is YYYYMMDD
    
//    _month = [self DOBMonth:_dateOfBirth];
//    _year = [self DOBYear:_dateOfBirth];
//    _day = [self DOBDay:_dateOfBirth];
    
    return self;
}

- (id) initWithData:(NSData *)data
{
    int state = 0, firstNameStart = 0, firstNameEnd = 0, lastNameStart = 0, lastNameEnd = 0,
    dateOfBirthStart = 0, dateOfBirthEnd = 0;
    for (int i = 0; i < [data length]; i++) {
        char c = ((char *)([data bytes]))[i];
        if (state == 0 && c == '%') {
            state++;
        } else if (state == 1 && c == '^') {
            state++;
            lastNameStart = i + 1;
        } else if (state == 2 && c == '$') {
            state++;
            lastNameEnd = i;
            firstNameStart = i + 1;
        } else if (state == 3 && (c == '^' || c == '$')) {
            state++;
            firstNameEnd = i;
        } else if (state == 4 && c == ';') {
            state++;
        } else if (state == 5 && c == '=') {
            dateOfBirthStart = i + 5;
            dateOfBirthEnd = i + 5 + 8;
        }
    }
    NSLog(@"%d %d %d %d %d %d", firstNameStart, firstNameEnd, lastNameStart, lastNameEnd, dateOfBirthStart, dateOfBirthEnd);
    NSString *firstName = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(firstNameStart, firstNameEnd - firstNameStart)] encoding:NSASCIIStringEncoding];
    NSString *lastName = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(lastNameStart, lastNameEnd - lastNameStart)] encoding:NSASCIIStringEncoding];
    NSString *dateOfBirth = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(dateOfBirthStart, dateOfBirthEnd - dateOfBirthStart)] encoding:NSASCIIStringEncoding];
    int DOB = [dateOfBirth intValue];
    NSLog(@"%@ %@ %d", firstName, lastName, DOB);
    
    return [self initWithFirstName:firstName LastName:lastName DateOfBirth:DOB];
}

-(NSString *)DOBYear:(int)birthday
{
    NSString *strDOB = [NSString stringWithFormat:@"%d", birthday];
    return [strDOB substringToIndex:4];
}

-(NSString *)DOBMonth:(int)birthday
{
    NSString *strDOB = [NSString stringWithFormat:@"%d", birthday];
    return [strDOB substringWithRange:NSMakeRange(4, 2)];
}

-(NSString *)DOBDay:(int)birthday
{
    NSString *strDOB = [NSString stringWithFormat:@"%d", birthday];
    return [strDOB substringWithRange:NSMakeRange(6, 2)];
}

@end

/*
int main(int argc, char *argv[])
{
    @autoreleasepool {
        char *str = "\x02\x68\x00\x83"
        "\x1f\x3a\x1d\x00"
        "\x83\x80\x25\x54"
        "\x58\x41\x55\x53"
        "\x54\x49\x4e\x5e"
        "\x53\x41\x44\x4f"
        "\x55\x47\x48\x49"
        "\x24\x41\x4d\x49"
        "\x52\x5e\x34\x37"
        "\x30\x31\x20\x4d"
        "\x4f\x4e\x54\x45"
        "\x52\x45\x59\x20"
        "\x4f\x41\x4b\x53"
        "\x20\x42\x4c\x56"
        "\x44\x20\x41\x50"
        "\x54\x20\x31\x32"
        "\x33\x20\x5e\x3f"
        "\x3b\x36\x33\x36"
        "\x30\x31\x35\x33"
        "\x33\x38\x36\x39"
        "\x36\x38\x35\x3d"
        "\x31\x36\x31\x31"
        "\x31\x39\x38\x39"
        "\x31\x31\x32\x37"
        "\x3f\x54\x31\x33"
        "\x34\x31\x30\x30"
        "\x36\x33\x36\xea"
        "\x92\x03";
        NSData *data = [[NSData alloc] initWithBytes:(void *)str length:110];
        NSLog(@"%@", [[DriversLicense alloc] initWithData:data]);
    }
}

*/
