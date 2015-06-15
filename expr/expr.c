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

Result add(Context * ctx)
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
int exprAdd(const char *s)
{
	Context ctx = {s, 0};
	return add(&ctx).value;
}

int exprSub(const char *s)
{
	Context ctx = {s, 0};
	return add(&ctx).value;
}

void test_add()
{
	assert(exprAdd("1") == 1);
	assert(exprAdd("1+2") == 1+2);
	assert(exprAdd("1+2+3") == 1+2+3);
	assert(exprAdd("1+2+3+4") == 1+2+3+4);
}

void test_sub()
{
	assert(exprSub("1-2") == 1-2);
	assert(exprSub("1-2-3") == 1-2-3);
}
int main()
{
	test_add();
	test_sub();
	printf("hello world\n");
	return 0;
}
