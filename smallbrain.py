def smallbrain(number):
    array = digits(number)
    size = len(array)
    return number == sum([ele**size for ele in array])

def digits(number):
    arr = []
    while 1 <= number:
        arr.insert(0, number % 10)
        number /= 10
    return arr