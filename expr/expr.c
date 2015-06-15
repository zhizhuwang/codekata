#include <stdio.h>
#include <assert.h>

typedef struct context{
	const char * str;
	unsigned int pos;
}Context;

typedef struct result{
	Context ctx;
	int value;
}Result;

Result num(Context * ctx)
{
	Result r;
	r.value = ctx->str[ctx->pos++] - '0';
	r.ctx = *ctx;
	return r;
}

Result addSub(Context * ctx)
{
	int v = 0;
	char optr;

	Result r = num(ctx);
	v = r.value;
	while((optr = r.ctx.str[r.ctx.pos]) == '+' ||
			(optr = r.ctx.str[r.ctx.pos]) == '-')
	{
		r.ctx.pos ++;
		r = num(&r.ctx);
		if(optr == '+')
			v += r.value;
		if(optr == '-')
			v -= r.value;
	}
	r.value = v;
	return r;
}
int exprAddSub(const char *s)
{
	Context ctx = {s, 0};
	return addSub(&ctx).value;
}

Result mul(Context * ctx)
{
	int v = 0;
	char optr;
	Result r = num(ctx);

	v = r.value;
	while((optr = r.ctx.str[r.ctx.pos]) == '*'||
			(optr = r.ctx.str[r.ctx.pos]) == '/')
	{
		r.ctx.pos ++;
		r = num(&r.ctx);
		if(optr == '*')
			v = v * r.value;
		if(optr == '/')
			v = v / r.value;
	}
	r.value = v;
	return r;
}
int exprMulDiv(const char * s)
{
	Context ctx = {s, 0};
	return mul(&ctx).value;
}
void test_add_sub()
{
	assert(exprAddSub("1") == 1);
	assert(exprAddSub("1+2") == 1+2);
	assert(exprAddSub("1+2+3") == 1+2+3);
	assert(exprAddSub("1+2+3+4") == 1+2+3+4);
	assert(exprAddSub("1-2") == 1-2);
	assert(exprAddSub("1-2-3") == 1-2-3);
	assert(exprAddSub("1-2+3") == 1-2+3);
}


void test_mul_div()
{
	assert(exprMulDiv("3*4") == 3*4);
	assert(exprMulDiv("3*4*5") == 3*4*5);

	assert(exprMulDiv("4/5") == 4/5);
	assert(exprMulDiv("6/3/2") == 6/3/2);

	assert(exprMulDiv("6/3*2") == 6/3*2);
}

int main()
{
	test_add_sub();
	test_mul_div();
	printf("hello world\n");
	return 0;
}
