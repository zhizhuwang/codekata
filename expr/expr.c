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

typedef int (*OptrFun)(char optr);
typedef Result (*StartFun)(Context* ctx);
Result mixChain(Context * ctx, OptrFun optrFun, StartFun startFun);

Result num(Context * ctx)
{
	Result r;
	r.value = ctx->str[ctx->pos++] - '0';
	r.ctx = *ctx;
	return r;
}

int isAddSub(char optr)
{
	return optr == '+' || optr == '-';
}
int isMulDiv(char optr)
{
	return optr == '*' || optr == '/';
}
int calc(unsigned int left, char optr, unsigned int right)
{
	int v = 0;
	switch(optr)
	{
	case '+':
		v = left + right; break;
	case '-':
		v = left - right; break;
	case '*':
		v = left * right; break;
	case '/':
		v = left / right; break;
	}
	return v;
}
int exprAddSub(const char *s)
{
	Context ctx = {s, 0};
	return mixChain(&ctx, isAddSub, num).value;
}

int exprMulDiv(const char * s)
{
	Context ctx = {s, 0};
	return mixChain(&ctx, isMulDiv, num).value;
}

Result mulDiv(Context * ctx)
{
	return mixChain(ctx, isMulDiv, num);
}

Result mixChain(Context * ctx, OptrFun optrFun, StartFun startFun)
{
	int v = 0;
	char optr;

	Result r = startFun(ctx);
	v = r.value;
	while(optrFun(optr = r.ctx.str[r.ctx.pos]))
	{
		r.ctx.pos ++;
		r = startFun(&r.ctx);
		v = calc(v, optr, r.value);
	}
	r.value = v;
	return r;
}
int exprAddMul(const char * s)
{
	Context ctx = {s, 0};
//	return addMul(&ctx, isAddSub).value;
	return mixChain(&ctx,isAddSub, mulDiv).value;
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

void test_add_mul()
{
	assert(exprAddMul("1+2*4") == 1+2*4);
	assert(exprAddMul("1+2*4+5*6") == 1+2*4+5*6);
	assert(exprAddMul("1*2+4") == 1*2+4);
	assert(exprAddMul("1*2+4*5+6") == 1*2+4*5+6);

	assert(exprAddMul("1-2*4+5*6") == 1-2*4+5*6);
	assert(exprAddMul("1*2-4*5+6") == 1*2-4*5+6);
}

int main()
{
	test_add_sub();
	test_mul_div();
	test_add_mul();
	printf("hello world\n");
	return 0;
}
