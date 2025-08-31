%let pgm=utl-useful-datastep-functions-that-can-be-used-with-arrays-and-or-variable-lists;

%stop_submission;

Useful datastep functions that can be used with arrays and or variable lists

see github for example usage

https://tinyurl.com/26mfuf7f
https://github.com/rogerjdeangelis/utl-useful-datastep-functions-that-can-be-used-with-arrays-and-or-variable-lists

NOT SURE I GOT AL LOF THEM

MEAN
AVG
MIN
MAX
N
NMISS
CMISS
RANGE
IQR
VAR
STD
STDERR
CSS
USS
CV
SKEWNESS
KURTOSIS
MAD
MEDIAN
GEOMEAN
HARMEAN
PCTL **

BAND**
BOR**
BXOR**
BLSHIFT**
BRSHIFT**

WHICHN
WHICHC

CAT
CATS
CATT
CATX
COALESCEC
COALESCE

DIM
HBOUND
LBOUND
DIM1
DIM2
DIM3

call sortn (of ns(*)); to sort numeric variables n1-n3
call sortn (of n1-n3); to sort numeric variables n1-n3
call sortc (of c1-c3); to sort character variables c1-c3


/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

MEAN
AVG
MIN
MAX
N
NMISS
CMISS
RANGE
IQR
VAR
STD
STDERR
CSS
USS
CV
SKEWNESS
KURTOSIS
MAD
MEDIAN
PCTL

BAND
BOR
BXOR
BLSHIFT
BRSHIFT

WHICHN
WHICHC

CAT
CATS
CATT
CATX
COALESCEC

DIM
HBOUND
LBOUND
DIM1
DIM2
DIM3

call sortn (of n1-n3);
call sortc (of c1-c3);

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%macro inject(func);
data have;
  array nns[2,3,2] (1 2 2 4 4 8 1 2 2 4 4 8);
  array ns[3] n1-n3;
  array cs[3] $ c1-c3;

  x1=1;
  x2=2;
  x3=3;

  n1=1;
  n2=2;
  n3=3;

  c1='1';
  c2='2';
  c3='3';

  res=&func;
  put "&func " res=;
run;quit;
%mend inject;

/*           _               _                                    _
  ___  _   _| |_ _ __  _   _| |_    _____  ____ _ _ __ ___  _ __ | | ___  ___
 / _ \| | | | __| `_ \| | | | __|  / _ \ \/ / _` | `_ ` _ \| `_ \| |/ _ \/ __|
| (_) | |_| | |_| |_) | |_| | |_  |  __/>  < (_| | | | | | | |_) | |  __/\__ \
 \___/ \__,_|\__| .__/ \__,_|\__|  \___/_/\_\__,_|_| |_| |_| .__/|_|\___||___/
                |_|                                        |_|
*/


MEAN          (of variable-list) - Average of non-missing values.
%inject(mean(of n1-n3, of x1-x3));  RES=2;

AVG           (of variable-list) - Average of non-missing values.

MIN           (of variable-list) - Minimum value.

MAX           (of variable-list) - Maximum value.

N             (of variable-list) - Number of non-missing values.

NMISS         (of variable-list) - Number of missing values.

RANGE         (of variable-list) - Difference between max and min.

IQR           (of variable-list) - Interquartile range.

VAR           (of variable-list) - Variance.

STD           (of variable-list) - Standard Deviation.

STDERR        (of variable-list) - Standard Error of the mean.

CSS           (of variable-list) - Corrected Sum of Squares.

USS           (of variable-list) - Uncorrected Sum of Squares.

CV            (of variable-list) - Coefficient of Variation.

SKEWNESS      (of variable-list) - Skewness.

KURTOSIS      (of variable-list) - Kurtosis.

MAD           (of variable-list) - Median Absolute Deviation.

MEDIAN        (of variable-list) - Median value.

PCTL          (of variable-list) - Percentile (though its syntax is different, often used with an array)

DO NOT KNOW WHAT THIS IS DOING
==============================
%inject(pctl(2, of ns(*)));  RES=1;
%inject(pctl(2, of n1-n3));  RES=1;
%inject(pctl(of n1-n3));     RES=2;


WHICHN        (of array-name) / WHICHN (of array-name) - Searches for a numeric/character value in a list and returns its position.
%inject(whichn(3 ,of n1-n3)); RES=3

WHICHC        (of array-name) / WHICHC (of array-name) - Searches for a numeric/character value in a list and returns its position.
%inject(whichc('2',of c1-c3)); RES=2


CAN ONLY USE A LIST WITH TWO VARIABLES

BAND          (of variable-list) - Returns the bitwise logical AND of all arguments.
%inject(band(of n1-n2)); RES=0 - Can only use two vaiables;

BOR           (of variable-list) - Returns the bitwise logical OR of all arguments.
%inject(bor(of n1-n2)); RES=3 - Can only use two vaiables; '01'x or'10'x =3

BXOR          (of variable-list) - Returns the bitwise logical EXCLUSIVE OR of all arguments.
%inject(bxor(of n1-n2)); RES=3 - Can only use two vaiables;

BLSHIFT       (of variable-list) - Returns the bitwise logical left shift.
%inject(blshift(of n1-n2)); RES=4

BRSHIFT       (of variable-list) - Returns the bitwise logical right shift.
%inject(blshift(of c1-c1)); RES=4


CAT           (of variable-list) - Concatenates strings without trimming spaces.

CATS          (of variable-list) - Concatenates strings and trims leading and trailing spaces.
%inject(cats(of c1-c3)); RES=123
CATT          (of variable-list) - Concatenates strings and trims trailing spaces.
CATX          ('delimiter', of variable-list) - Concatenates strings with a delimiter and trims spaces.

DIM           (of array-name[*n*]) - Returns the number of elements in an array. The OF is used with the array name.
HBOUND        (of array-name[*n*]) - Returns the upper bound of an array dimension.
LBOUND        (of array-name[*n*]) - Returns the lower bound of an array dimension.

%inject(DIM1(nns)); RES=2
%inject(DIM2(nns)); RES=3
%inject(DIM3(nns)); RES=2

call sortn (of n1-n3); to sort numeric variables n1-n3
call sortc (of c1-c3); to sort character variables c1-c3

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

