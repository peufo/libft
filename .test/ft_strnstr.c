void test(const char *str, const char *find, t_size len)
{
	char *a = strnstr(str, find, len);
	char *b = ft_strnstr(str, find, len);

	if (a != b) {
		printf("str=%s find=%s len=%lu\n" ,str, find, len);
		printf("accepted: %s\n", a);
		printf("received: %s\n", b);
	}
}

int main()
{
	test("", "", 0);
	test("", "", 10);
	test("YOLO", "", 0);
	test("YOLO", "", 4);
	test("YOLO", "", 5);
	test("YOLO", "", 10);
	test("YOLO", "LO", 0);
	test("YOLO", "LO", 1);
	test("YOLO", "LO", 2);
	test("YOLO", "LO", 3);
	test("YOLO", "LO", 4);
	test("YOLO", "LO", 5);
	test("YOLO", "LO", 10);
	test("YOLO", "O", 0);
	test("YOLO", "O", 4);
	test("YOLO", "O", 5);
	test("YOLO", "O", 10);
	test("", "O", 0);
	test("", "O", 4);
	test("", "O", 5);
	test("", "O", 10);
	test("YOLO", "LA", 0);
	test("YOLO", "LA", 4);
	test("YOLO", "LA", 5);
	test("YOLO", "LA", 10);
}

