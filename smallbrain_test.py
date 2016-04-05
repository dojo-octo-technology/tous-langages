# pylint: disable=missing-docstring, too-many-public-methods

import unittest
from smallbrain import *

class SmallbrainTest(unittest.TestCase):
    # number tester
    def test_is_smallbrain_number(self):
        self.assertTrue(smallbrain(1))
        self.assertTrue(smallbrain(2))
        self.assertTrue(smallbrain(153))
        self.assertTrue(smallbrain(548834))

    def test_is_not_smallbrain_number(self):
        self.assertFalse(smallbrain(10))

    # number splitter
    def test_splits_in_one(self):
        self.assertEqual([1], digits(1))

    def test_splits_in_two_digits(self):
        self.assertEqual([1,2], digits(12))
        self.assertEqual([4,2], digits(42))
