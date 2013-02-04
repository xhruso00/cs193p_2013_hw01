//
//  PorovnavaciaKartovaHra.m
//  cs193p_2013_hw01
//
//  Created by Marek Hrušovský on 2/4/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "PorovnavaciaKartovaHra.h"

@interface PorovnavaciaKartovaHra()
@property (readwrite,nonatomic) int skore;
@property (strong,nonatomic) NSMutableArray *karty;

@end

@implementation PorovnavaciaKartovaHra

- (NSMutableArray *)karty {
    if (!_karty) _karty = [[NSMutableArray alloc] init];
    return _karty;
}

- (id)initWithPocetKariet:(NSUInteger)pocetKariet pouzitimBalickahKariet:(BalicekKariet *) balicek{
    self = [super init];
    if (self) {
        for (int i = 0; i < pocetKariet; i++) {
            Karta *karta = [balicek potiahniNahodnuKartu];
            self.karty[i] = karta;
        }
    }
    
    return  self;
}

#define POROVNACI_BONUS 4
#define TREST_ZA_NEZHODU 2
#define CENA_ZA_OTOCENIE 1

- (void)otocKartuNaIndexe:(NSUInteger)index {
    Karta *karta = [self kartaNaIndexe:index];
    
    if ( karta && !karta.nehratelna) {
        if (!karta.otocenaCelnouStranou) {
            for (Karta *inaKarta in self.karty) {
                if (inaKarta.otocenaCelnouStranou &&
                    !inaKarta.nehratelna) {
                    int porovnacieSkore = [karta porovnajSKartami:@[inaKarta]];
                    if(porovnacieSkore) {
                        karta.nehratelna = YES;
                        inaKarta.nehratelna = YES;
                        self.skore += porovnacieSkore * POROVNACI_BONUS;
                    }
                    else {
                        inaKarta.otocenaCelnouStranou = NO;
                        self.skore -= TREST_ZA_NEZHODU;
                    }
                    break;
                }
            }
            self.skore -= CENA_ZA_OTOCENIE;
        }
        karta.otocenaCelnouStranou = !karta.otocenaCelnouStranou;
    }
}

- (Karta *)kartaNaIndexe:(NSUInteger)index {
    return (index < [self.karty count]) ? self.karty[index] : nil;
}
@end
