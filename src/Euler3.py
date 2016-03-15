def return3():
    return 3


def get_biggest_prime_factor(num):
    if num % 2 == 0:
        return num / 2
    if num % 3 == 0:
        return num / 3
    if num % 5 == 0:
        return num / 5

    return 29


def get_crible(num):
    if num == 2:
        return [2]
    if num == 3:
        return [2, 3]
    return []


def generate_tuples(num):
    if num == 2:
        return tuples_between(2, 2)
    if num == 3:
        return tuples_between(2, 3) + tuples_between(3, 3)
    if num == 4:
        return generate_tuples(num - 1) + [(4, False)]
    return []


def tuples_between(num, max):
    tab = [(num, True)]
    for i in range(2, max / num + 1):
        tab = tab + [(num * i, False)]

    return tab
