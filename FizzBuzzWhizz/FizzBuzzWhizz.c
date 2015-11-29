/*
 * FizzBuzzWhizz.c
 *
 *  Created on: 2015Äê11ÔÂ29ÈÕ
 *      Author: zhizhuwang
 */


struct rule * r1_3 = atom(times_3, to_Fizz);
struct rule * r1_5 = atom(times_5, to_Buzz);
struct rule * r1_3 = atom(times_7, to_Whizz);

struct rule * r1 = or3(r1_3, r1_5,r1_7);
struct rule * r2 = or4(and3(r1_3, r1_5, r1_7),
						and(r1_3, r1_5),
						and(r1_5, r1_7),
						and(r1_3, r1_7));
struct rule * r3 = atom(contains_3, to_Fizz);
struct rule * rd = atom(always_true, nope);

struct rule * spec = or4(r3,r2,r1,rd);

struct rule_result rr;

for(i = 1; i < 100; i ++)
{
	rr = apply(spec, i);
	printf("%d -- %s \n" , i, rr.value);
}
