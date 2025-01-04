import os

def test_pylsp():
    a = 2
    b = 3
    result = a + b
    print(os.environ)
    if a < b:
        return a
    return result

def main():
    print(test_pylsp())

if __name__ == "__main__":
    main()
