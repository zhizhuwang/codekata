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

int main()
{
	test_add_sub();
	printf("hello world\n");
	return 0;
}
