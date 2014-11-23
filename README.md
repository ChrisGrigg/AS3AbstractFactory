AS3AbstractFactory
==================

An example of setting up an Abstract Factory in AS3.  The purpose of this is to allow different software wrappers to be swopped easily for kiosk software.  This is for different environments such as Linux, Mac or Windows.  This is an example with a few methods to get started off.

Advantages: Allows for different types of shell software to be utilised quickly and with less bugs.  This is because the same methods must be implemented and are invoked at the same time for each factory class.
Disadvantages: Takes a lot of maintenance and whenever a modification is required, the code must be edited in multiple different classes.