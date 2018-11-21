from robot.api import logger
from robot.errors import ExecutionFailed

class Library(object):
    """
    Our Library for HackerSchool demo.
    
    =Table of contents=
    
    - `Usage`
    - `Keywords`
    
    = Usage =
    Just import it and have fun
    """

    ROBOT_LIBRARY_VERSION = 1.0

    def just_call(self):
        """
        Basic call keyword.
        
        Example:
        | Just Call |
        """
        logger.info("Hello World")
        logger.console("Hello world")
        
    def log_input(self, input):
        logger.info(input)
        logger.console(input)
        
    def compare_something(self, input):
        self.input = int(input)
        if self.input < 5:
             logger.info("Test passed because value %s is lower than 5" % input, also_console=True)
        elif self.input == 5:
            logger.warn("%s is equal to 5 and will reach the treshold soon" % input)
        else:
            logger.error("The value %s reached treshold 5!!!" % input)
            raise ExecutionFailed("Value five was reached!!!!")
        
    def add_values(self, a, b):
        """
        Keyword accepts two parameters, add them and returns result.
        
        Example:
        | ${someVar} | Add Values | 3 | 4 |
        """
        result = int(a) + int(b)
        return result
    
    
    
    
    
    
    