# openeobs automation
Automation Test Suite for open-eObs, created by BJSS for LiveObs

![](https://img.shields.io/travis/openeobs/openeobs-automation.svg?logo=travis)

# Running locally
1. Modify the `config.yml` parameters such as database and server URL 
to ensure they are correct for your local instance.
2. Run Chromedriver.exe in a terminal.
3. Start your local LiveObs server.
4. Run Behave.
	1. Create a Behave run configuration in PyCharm.
	2. Populate the 'feature files or folders' field.

# Running on GoCD
Use the Makefile targets.

# The three layers of automation
It is good practice to divide test automation code up into three separate 
layers of abstraction (see page 156 of **Specification by Example**) so that 
concerns are separated. For example say a class changes in the UI, we want 
there to be minimum changes to the automation code necessary to make the tests 
operational again. Proper abstraction achieves that.

The three layers are:
1. **Business rule level**. This is the conceptual layer. It is expressed in 
feature files that describe the business rules in an abstract manner.
1. **User workflow level**. This is the logical layer. It is expressed in 
Python modules in the `steps` package. They should consist of well abstracted 
methods that describe the logical actions necessary to achieve a user goal.
1. **Technical activity level**. This is the physical layer. It describes the 
physical actions that must be taken by the user to perform a workflow. It is 
expressed in Python modules in the `liveobs_ui` package.
