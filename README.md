# Finit-state-macines-network.
Finit state macines network for MSI protocol modelling.

This was my course work (third year student, sept 2016 - dec 2016).
You can find additional information about MSI protocol here https://en.wikipedia.org/wiki/MSI_protocol.

1. Model - contains VHDL description of MSI protocol model.
  Main file - mode;
  Test file - test.
  There are 2 additional file: in01.dat and out01.dat. They contain data samples for model simulating.
2. TestCreator - contains C program for test generation. Project has been wrote in C++ Builder 6, so i can not comment on these project files, due to age of this program. You may try to copy it or simply use already generated .exe file (it should not have problems with compatcibility).
  TestCreator creates random test with various lengths for MSI protocol modelling. You just need to copy in01.dat and out01.dat to you working directory and start simulating of model.
