# test file to check the hello.py file
import hello

def test_hello():
    assert hello.add(1, 2) == 3
    assert hello.add(1, 3) == 4
    assert hello.add(1, 4) == 5
    assert hello.add(1, 5) == 6
