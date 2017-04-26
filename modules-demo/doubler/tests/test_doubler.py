import unittest
import json
import subprocess
import random


class TestDoubler(unittest.TestCase):

    def setUp(self):
        self.number = random.randint(0, 100)
        with open('terraform.tfvars', 'w') as fh:
            fh.write('number =  {}\n'.format(self.number))

        subprocess.call(["terraform", "apply"])

    def tearDown(self):
        subprocess.call(["terraform", "destroy", "--force"])

    def test_doubled(self):
        with open('terraform.tfstate', 'r') as fh:
            state = json.loads(fh.read())

        actual = state['modules'][1]['outputs']['doubled']['value']
        self.assertEqual(self.number * 2, int(actual))


if __name__ == '__main__':
    unittest.main()
