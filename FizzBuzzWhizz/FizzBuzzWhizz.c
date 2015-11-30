/*
 * FizzBuzzWhizz.c
 *
 *  Created on: 2015.11.29
 *      Author: zhizhuwang
 */
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#define MAX_CHARs  20
#define MAX_RESULT_LEN 100
enum r_type{
	R_ATOM,
	R_AND,
	R_OR
};

enum r_result
{
	R_SUCCESS,
	R_FAILED
};


typedef int (*pred)(int);
typedef char* (*action)(int);
struct r_atom
{
	pred p;
	action a;
};

struct r_and
{
	struct rule* rs[2];
};

struct r_or
{
	struct rule* rs[2];
};

struct rule
{
	enum r_type type;
	union
	{
		struct r_atom atom;
		struct r_and  and;
		struct r_or   or;
	} val;
};

struct rule_result
{
	int type;
	char value[MAX_RESULT_LEN];
};

struct rule_result apply_atom(struct r_atom r, int N);
struct rule_result apply_and(struct r_and r, int N);
struct rule_result apply_or(struct r_or r, int N);

struct rule* atom(pred p, action a)
{
	struct rule* r;
	struct r_atom atom;
	r = (struct rule*) malloc(sizeof(struct rule));

	atom.p = p;
	atom.a = a;

	r->type = R_ATOM;
	r->val.atom = atom;

	return r;
}

struct rule* or(struct rule* r1, struct rule* r2)
{
	struct rule* or = (struct rule*)malloc(sizeof(struct rule));

	or->type = R_OR;
	or->val.or.rs[0] = r1;
	or->val.or.rs[1] = r2;

	return or;
}

struct rule* and(struct rule* r1, struct rule* r2)
{
	struct rule* and = (struct rule*)malloc(sizeof(struct rule));

	and->type = R_AND;
	and->val.or.rs[0] = r1;
	and->val.or.rs[1] = r2;

	return and;
}

struct rule* and3(struct rule* r1, struct rule* r2, struct rule* r3)
{
	return and(r1, and(r2, r3));
}

struct rule* or3(struct rule* r1, struct rule* r2, struct rule* r3)
{
	return or(r1, or(r2,r3));
}
struct rule* or4(struct rule* r1, struct rule* r2, struct rule* r3, struct rule* r4)
{
	return or(r1, or(r2,or(r3,r4)));
}
struct rule_result apply(struct rule* r, int N)
{
	struct rule_result rr;
	switch(r->type){
	case R_ATOM:
		rr = apply_atom(r->val.atom, N);
		break;

	case R_AND:
		rr = apply_and(r->val.and, N);
		break;

	case R_OR:
		rr = apply_or(r->val.or, N);
		break;

	default:
		assert(0);
		break;
	}

	return rr;
}

struct rule_result apply_atom(struct r_atom r, int N)
{
	struct rule_result rr;
	if(r.p(N))
	{
		rr.type = R_SUCCESS;
		strcpy(rr.value, r.a(N));
	}
	else{
		rr.type = R_FAILED;
	}
	return rr;
}

struct rule_result apply_and(struct r_and r, int N)
{
	int i;
	char val[100] = {0};
	struct rule_result rr = {R_FAILED, {0}};

	for(i =0; i < 2; i++)
	{
		rr = apply(r.rs[i], N);
		if(rr.type == R_FAILED){
			return rr;
		}
		else{
			strcat(val, rr.value);
		}
	}
	rr.type = R_SUCCESS;
	strcpy(rr.value, val);

	return rr;
}

struct rule_result apply_or(struct r_or r, int N)
{
	int i;
	struct rule_result rr = {R_FAILED, {0}};

	for(i = 0; i <2; i++)
	{
		rr = apply(r.rs[i], N);
		if(rr.type == R_SUCCESS)
		{
			return rr;
		}
	}
	return rr;
}

int times_3(N)
{
	return N % 3 == 0;
}
int times_5(N)
{
	return N % 5 == 0;
}
int times_7(N)
{
	return N % 7 == 0;
}


int contains_3(int N)
{
	return N % 10 == 3 ||
		  (N /10) %10 == 3 ||
		  ((N /10) / 10) % 10 == 3;
}

int always_true(int N)
{
	return 1;
}

char * to_Fizz(int N)
{
	return "Fizz";
}

char * to_Buzz(int N)
{
	return "Buzz";
}

char * to_Whizz(int N)
{
	return "Whizz";
}
char result[100];
char * nope(int N)
{
	return itoa(N, result, 10);
}



int main()
{

	struct rule * r1_3 = atom(times_3, to_Fizz);
	struct rule * r1_5 = atom(times_5, to_Buzz);
	struct rule * r1_7 = atom(times_7, to_Whizz);

	struct rule * r1 = or3(r1_3, r1_5,r1_7);
	struct rule * r2 = or4(and3(r1_3, r1_5, r1_7),
			and(r1_3, r1_5),
			and(r1_5, r1_7),
			and(r1_3, r1_7));
	struct rule * r3 = atom(contains_3, to_Fizz);
	struct rule * rd = atom(always_true, nope);

	struct rule * spec = or4(r3,r2,r1,rd);

	struct rule_result rr;

	int i = 1;
	for(i = 1; i < 100; i ++)
	{
		rr = apply(spec, i);
		printf("%d -- %s \n" , i, rr.value);
	}

	return 0;
}












