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
	Result r = num(ctx);

	v = r.value;
	while(r.ctx.str[r.ctx.pos] == '+')
	{
		r.ctx.pos ++;
		r = num(&r.ctx);
		v += r.value;
	}
	r.value = v;
	return r;
}
int exprAdd(const char *s)
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
int main()
{
	test_add();
	printf("hello world\n");
	return 0;
}
