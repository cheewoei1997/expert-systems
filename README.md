# Expert Systems
Simple syntax and tutorials to quickstart your CLIPS (C Language Integrated Production System) journey.

Here's how to get you started on copying all of the below tutorial codes. Run the below code to clone this repository onto your local computer.  
`git clone https://github.com/cheewoei1997/expert-systems.git`

Once you've cloned, just navigate to the folder that you have cloned and you're all set.

There are only four tutorials on CLIPS in this subject.

## Report
Softcopy for the entire assignment. [Click here](https://docs.google.com/document/d/1OPfEpSsi3fo3KtXJXrVl5oeOD03I0qlBwJKO0LNyf1A/edit?usp=sharing)


## Tutorials
### Facts and Rules
The very core of complicated if-else statements.

1. [Simple Scalar Operations](../master/1.%20Basics/simplescalaroperations.m) simplescalaroperations.m
2. [Creating a Vector/Matrix](../master/1.%20Basics/createvectormatrix.m) createvectormatrix.m
3. [Indexing](../master/1.%20Basics/indexing.m) indexing.m
4. [Matrix Operators](../master/1.%20Basics/matrixoperators.m) matrixoperators.m
5. [for/while Loops](../master/1.%20Basics/loops.m) loops.m
6. [Functions vs. Scripts](../master/1.%20Basics/functionsvsscripts.m) functionsvsscripts.m
7. [Plotting](../master/1.%20Basics/plotting.m) plotting.m
8. [Images](../master/1.%20Basics/images.m) images.m

### Patterns and Actions
Create knowledge stuff similar to objects.

1. [Sampling](../master/2.%20Sampling,%20Quantization,%20Resolution/sampling.m) sampling.m  
    The play of pixels on an image to resize them. This effect will usually cause the checkerboard effect.
2. [Quantization](../master/2.%20Sampling,%20Quantization,%20Resolution/quantization.m) quantization.m  
    Manipulation on the number of gray levels on an image to simplify the image.
3. [Resolution](../master/2.%20Sampling,%20Quantization,%20Resolution/resolution.m) resolution.m  
    The use of filters with values of ones to demonstrate gaussian blurring.

### Wildcard Patterns
Accept random arguments to perform searches similar to loop.

1. [Contrast Stretching and Histogram Equalization](../master/3.%20Smoothening%20and%20Histogram%20Manipulation/contraststretchhistoequal.m) contraststretchhistoequal.m  
    Contrast stretching vs. histogram equalization.
2. [Quantization](../master/3.%20Smoothening%20and%20Histogram%20Manipulation/convoandmedianfilter.m) convoandmedianfilter.m  
    Convolutional filters seem to not be as good as median filters in noise cleanup.
3. [Resolution](../master/3.%20Smoothening%20and%20Histogram%20Manipulation/difference.m) difference.m  
    Subtracting the background of an image to obtain the region of interest.

### Templates and Conditions
Creating frameworks to build stuff. Concept similar to abstract class.

1. [Implementing Noise Model](../master/4.%20Noise/addnoise.m) addnoise.m  
    Simulate noise in your image by adding them because who even likes clear images.
2. [Noise Reduction](../master/4.%20Noise/reducenoise.m) reducenoise.m  
    Adding noise and removing them from the original image.
3. [Simulating a Motion Blur Effect](../master/4.%20Noise/motionblur.m) motionblur.m  
    Simulate a motion blur then use Wiener filter to deblur the image.

## Credits
* Dr. Lee Chin Poo
* Do Chen Hao
* Sia Chun Wai

This tutorial is adapted from  http://sequoia.ict.pwr.wroc.pl/~witold/ai/CLIPS_tutorial/