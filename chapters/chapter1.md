---
title: 'Chapter 1: Introduction to sensory analysis'
description:
  'This chapter will teach you about many cool things and introduce you to the
  most important concepts of the course.'
prev: null
next: /chapter2
type: chapter
id: 1
---


<exercise id="1" title="Distribution of sensory attributes">

Let import the dataset, do a summary of it and identify quantitative variables (sensory attributes); we're gonna work only on this variables for moment.

<codeblock id="01_01">
</codeblock>

The first point is to represent two variables. Choose them and plot their histogram.

<codeblock id="01_02">
_layout(matrix(1:2,1,2))_ allows you to obtain two graphs on a single window. 
</codeblock>

Next, plot the density for each sensory attributes with the `density()` function of R. Try to do it in a single window like before. 

<codeblock id="01_03">
</codeblock>

To a better understanding of the dispersion of a quantitative variable, we want to calculate the mean, the standard deviation, the first quartile and the third quartile for each sensory attributes in the dataset `experts`. Do it and save them in a dataframe. 

<codeblock id="01_04">
That is what is expected: 

|     | mean | sd | median | q1 | q3 |
|   :-:  |:-:    |:-:    |:-:    |:-:    |:-:    |
| Spicy | 2.2493056 | 3.149714 | 0.5 | 0.000 | 3.625 |
| Heady | 3.9628472 | 3.893348 | 1.9 | 0.300 | 8.125 |
| Fruity | 3.4868056 | 3.268117 | 2.3 | 0.500 | 6.125 |
| Green | 0.8458333 | 1.678575 | 0.2 | 0.000 | 0.700 |
| Vanilla | 3.1131944 | 3.489471 | 1.2 | 0.200 | 6.000 |
| Floral | 6.1187500 | 3.241251 | 6.8 | 3.775 | 9.000 |
| Woody | 1.2524306 | 1.780262 | 0.5 | 0.000 | 1.525 |
| Citrus | 1.0489583 | 1.750898 | 0.2 | 0.000 | 1.125 |
| Marine | 0.4673611 | 1.428887 | 0.0 | 0.000 | 0.200 | 
| Greedy | 2.9236111 | 3.489965 | 1.0 | 0.100 | 5.100 |
| Oriental | 3.6993056 | 3.944634 | 1.2 | 0.100 | 8.000 |
| Wrapping | 5.7368056 | 3.415128 | 6.3 | 2.775 | 8.900 |

</codeblock>

->>>>>>>>>>>>>>Ajout partie guillaume sur les plot de density avec indicateurs

This indicators can be visualized, plot the boxplot of each sensory attributes.Add the line corresponding to the mean of the attribute. 

<codeblock id="01_05">
</codeblock>



</exercise>

