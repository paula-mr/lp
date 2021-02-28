import traceback

class FormulaError(Exception):
    pass

def calculate(op, arg1, arg2):
    if op == '+':
        return arg1 + arg2
    if op == '-':
        return arg1 - arg2
    if op == '*':
        return arg1 * arg2
    if op == '/':
        return arg1 / arg2
    raise FormulaError("x nao e um operador valido")

def parse_input(input):
    args = input.split()
    if len(args) < 3:
        raise FormulaError("A entrada nao consiste de 3 elementos")
    op = args[1]

    try:
        arg1 = float(args[0])
        arg2 = float(args[2])
    except ValueError:
        raise FormulaError("O primeiro e o terceiro valor de entrada devem ser numeros")

    return op, arg1, arg2

def process():
    user_input = input()
     
    try:
        op, arg1, arg2 = parse_input(user_input)
        result = calculate(op, arg1, arg2)
        print(result)
    except FormulaError:
        traceback.print_exc()


def __main__():
    try:
        while True:
            process()
    except KeyboardInterrupt:
        pass

__main__()

# TODO perguntar da stack trace