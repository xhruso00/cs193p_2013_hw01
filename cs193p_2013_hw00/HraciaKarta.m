//
//  HraciaKarta.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/28/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "HraciaKarta.h"

@implementation HraciaKarta
@synthesize farba = _farba;
@synthesize hodnota = _hodnota;

- (NSString *)obsah {
    NSArray *vsetkyHodnoty = [HraciaKarta vsetkyHodnoty];
    return [vsetkyHodnoty[self.hodnota] stringByAppendingString:self.farba];
}

+(NSArray *) platneFarby {
    return @[@"♥",@"♦",@"♣",@"♠"];
}

- (NSString *)farba {
    return _farba ? _farba: @"?";
}

+ (NSArray *)vsetkyHodnoty {
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (void)nastavFarbu:(NSString *)farba {
    if ([[HraciaKarta platneFarby] containsObject:farba])
        _farba = farba;
}

+ (int) najvyssiaHodnota {
    return [HraciaKarta vsetkyHodnoty].count - 1;
}

- (void)nastavHodnotu:(int)hodnota {
    if(hodnota <= [HraciaKarta najvyssiaHodnota])
        self.hodnota = hodnota;
}

@end
