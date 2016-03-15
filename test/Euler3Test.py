import unittest
from src.Euler3 import return3, get_biggest_prime_factor, get_crible, generate_tuples, tuples_between


class Euler3Test(unittest.TestCase):
    def test_shouldReturn3(self):
        self.assertEqual(3, return3())

    def test_returns_biggest_prime_factor(self):
        #self.assertEqual(29, get_biggest_prime_factor(13195))
        self.assertEqual(2, get_biggest_prime_factor(4))
        self.assertEqual(3, get_biggest_prime_factor(6))
        self.assertEqual(3, get_biggest_prime_factor(9))
        self.assertEqual(5, get_biggest_prime_factor(25))

    def test_crible_erathostene(self):
        self.assertEqual([], get_crible(1))
        self.assertEqual([2], get_crible(2))
        self.assertEqual([2, 3], get_crible(3))

    def test_generate_tuples(self):
        self.assertEquals([], generate_tuples(1))
        self.assertEquals([(2, True)], generate_tuples(2))
        self.assertEquals([(2, True), (3, True)], generate_tuples(3))
        self.assertEquals([(2, True), (3, True), (4, False)], generate_tuples(4))


    def test_tuples_between(self):
        self.assertEquals([(2, True)], tuples_between(2,2))
        self.assertEquals([(2, True), (4, False)], tuples_between(2,4))
        self.assertEquals([(2, True), (4, False), (6, False)], tuples_between(2,6))

