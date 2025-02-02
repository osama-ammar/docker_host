import unittest


def double(x):
    return x**2

def trible(x):
    return x*3



class UnetTesting(unittest.TestCase):   # using unittest.TestCase
    
    def test_double(self):  # test cases should start with test_  to correctly utilize unittest module
        correct = 9
        self.assertEqual(double(3),correct) #using self.assertEqual

    
    def test_trible(self):
        correct = 27
        self.assertEqual(trible(3),correct)
        
    
if __name__ == "__main__":
    unittest.main() #using unittest.main() ...strange