typedef struct s_test t_test;
struct s_test {
	int n;
	char *expected;
};

void test(t_test *args)
{
	char *res = ft_itoa(args->n);

	if (strcmp(res, args->expected) != 0) {
		printf("n=%d\n", args->n);
		printf("expected:%s \n", args->expected);
		printf("received:%s \n\n", res);
	}
}

int main()
{
	t_test tests[] = {
		{
			.n = 0,
			.expected = "0"
		},
		{
			.n = 42,
			.expected = "42"
		},
		{
			.n = -42,
			.expected = "-42"
		},
		{
			.n = 2147483647,
			.expected = "2147483647"
		},
		{
			.n = -2147483648,
			.expected = "-2147483648"
		},
		{
			.n = -8,
			.expected = "-8"
		},
	};

	short count = sizeof(tests) / sizeof(tests[0]);
	short index = 0;
	while (index < count)
	{
		test(tests + index++);
	}
}

