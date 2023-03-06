# Temporal simulation for Hardware Trojan detection

The original idea is to use glitches usually avoided to make Hardware recognizable and detect unexpected behavior. 
To this end, raise the clock frequency allow us to bring glitches transient values from the internal signals, out to the IOs.
The technique would be used in simulation to get what will be expected after chip manufacturing.
Then it would be used at post-silicon stage, to compare expected with given outputs with specific applied parameters.
