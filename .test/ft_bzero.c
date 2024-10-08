#include <string.h>
#include <stdio.h>
#include <unistd.h>

void test(void *s, size_t len)
{
	char *str_a = strdup(s);
	char *str_b = strdup(s);
	bzero(str_a, len);
	ft_bzero(str_b, len);
	if (strcmp(str_a, str_b) == 0) return;
	printf("accepted: %s\n", str_a);
	printf("received: %s\n", str_b);
}

int	main()
{
	test("YOLO", 0);
	test("YOLO", 3);
	test("YOLO", 4);
	test("", 0);
	test("", 0);
	test("PROUT ✊", 9);
}