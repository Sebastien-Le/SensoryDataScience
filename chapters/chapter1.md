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

## Histogram

Let import the dataset, do a summary of it and identify quantitative variables (sensory attributes); we're gonna work only on this variables for moment.

<codeblock id="01_01">
</codeblock>

The empirical distribution of a variable is the set of values (or modalities) taken by this variable, and their associated numbers. However, the variables being continuous, it is very rare to have the same value twice for two different individuals.

We therefore choose to make a grouping in classes.

The first point is to represent one variable. Choose it and plot its histogram.

<codeblock id="01_02">
</codeblock>

Here, a lot of information is available to us. The first one is an idea of the representation of the scores given by the judges to the attribute. We that a lot of notes are between 0 and 1. The rest is more homogeneous. As explain previously, this distribution is cut in classes. The cut is set by the argument `breaks`. By default, it is set with the _Sturges_ method, which is the most recommended in the most of the cases. If you specify manually this number,  make sure the number is not too high or not too low.

<codeblock id="01_09">
</codeblock>

We notice however that this histogram represents the frequencies of observations on the ordinate, or more precisely the number of observations of each class. It is the argument `freq = True` that gives us this representation. But you sometimes histograms are plot using Frequency density, the frequency per unit for the data in each class. It is calculated by dividing the frequency by the class width. We change the argument `probability` to `probability = TRUE` to have this representation.

<codeblock id="01_10">
</codeblock>

## Density

This notion of density is introduce here, it allows to restrict the frequencies of the classes between 0 and 1. Plot the density for one sensory attributes with the `density()` function of R.  

<codeblock id="01_03">
</codeblock>

The histogram of frenquency density can be superposed to the curve. First, plot the histogram for one sensory attribute and add the line of the density.

<codeblock id="01_11">
</codeblock>

We can also compare two estimate density of two different variables. Create a graph with the lines of the density of two sensory attributes.

<codeblock id="01_12">
</codeblock>

## Position indicator

Now that we have an idea of the variable density, we can introduce the notion of position indicator. We now want to know which notes "cut" the population into two groups of equal size. The median is the value separating the higher half from the lower half of a data sample, a population, or a probability distribution. For a data set, it may be thought of as "the middle" value. To generalize, we have the notion of quantile, which are cut points dividing the observations in a sample in the same way. 

We want to calculate the mean, the standard deviation, the first quantile and the third quantile for each sensory attributes in the data set `experts`. Do it and save them in a data frame. 

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

These indicators can be visualized, plot the box-plot of each sensory attributes. Do it on six attributes and add the line corresponding to the mean. 

<codeblock id="01_05">

</codeblock>

Let's illustrate these indicators in complementary of the density. For example, the median is a quantile associate to the order 0.5 :

<codeblock id="01_13">
</codeblock>

Do the same with the first and third quantile. 

<codeblock id="01_14">
</codeblock>

Finally, plot the density again and add the mean and 2.5 and 97.5 quantile.

<codeblock id="01_15">
</codeblock>

</exercise>


<exercise id="2" title="Product effect">

The sensory attributes are collected for different products, let's take account of this point. Remember the data set, `Product`, `Session`, `Panelist` and `Rank` must be categorical, do the transformation. 

<codeblock id="01_06">
</codeblock>

The point of interest in sensory analysis is the product effect on each sensory attributes. To begin, plot the density for one sensory attribute and for three product. To do it, you must to use `ggplot2` and `dplyr` libraries.

<codeblock id="01_07">
To reduce the data frame with the information you need, use dplyr with :
- `select()` : select the product and the sensory attribute;
- `filter()` : select rows of your products;
- `group_by()` and `mutate()` : calculate the mean for each product.
Next, to plot the graph, you need to use :
- `geom_density()`: plot the density of each product according values of your sensory attribute;
- `geom_vline` : plot the line representing the mean for each product.
</codeblock>

Each sensory attributes has different dispersion depending on the product you’re focusing on, it's the product effect.

The next part focus on the box-plots of the same sensory attribute. Using the same libraries, build three box-plot for three products.

<codeblock id="01_08">
To plot the box-plot, use `geom_boxplot()`.
</codeblock>

</exercise>

