#A command line program using fire module to get two numbers from the user and print the sum of the two numbers
import fire

def add(x, y):
    return x + y

if __name__ == '__main__':
    fire.Fire(add)
