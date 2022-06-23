---
title: 'Chapter 1: Dealing with quantitative perception'
description:
  'description très intéressante'
prev: null
next: /chapter2
type: chapter
id: 1
---


<exercise id="1" title="From sensory data collection to a collection of sensory data">

Let's say you are a panelist, and you have to assess a set of perfumes according to a list of sensory attributes from 0 to 10: 0 meaning that you don't perceive the perfume you assess as *heady* for instance, 10 meaning that you perceive the perfume as extremely *heady*. 

Each time you will have to evaluate a perfume, a lab assistant will provide you with a sample of the perfume and a form to be filled. On this form, you will note your name, the three digits code of the perfume you are testing.

From a statistical point of view, the statistical unit of interest is the form on which you have noted many information. 

In other words, as in data set rows correspond to statistical units and columns correspond to variables, in our situation, each row of our data set is a form with information such as the name of the panelist, the product that has been assessed, the scores for the different sensory attributes.

Before importing the data, let's have a look at our first data set based on quantitative measurements: *perfumes_qda_experts.csv*.

</exercise>


<exercise id="2" title="From a data set to a data frame (or a tibble)">

Let's first import our dataset and have a look at it. To do so, we will use two apparently different functions, the `read.csv()` function, dedicated to *csv* files, and the `read.table()` function, which seems more generic. We will also use a very important sign that will allow you to assign results provided by an R function to an R object: `<-`. Indeed, importing data means reading data from a source, then storing what has been read in an R object.

-   `read.csv()`:

<codeblock id="01_01">
</codeblock>

-   `read.table()`: default \`quote = " "'", which means that double and single quotation marks are considered as separators outside of perfume names here have single quotation marks and we don't want them to be considered as separators so we only indicate double quotation marks in the quote argument.

<codeblock id="01_02">
</codeblock>

Actually, the two functions `read.csv()` and `read.table()` are the same, except for the defaults.

Let's have a look at what has been imported in R, the object *expert* which is actually a data frame. To display any R object, write its name in the console. To display part of the *experts* object, select the rows and columns you want to diplay. By definition, a data frame is a table or a two-dimensional array, and you can navigate in this array as you would in any matrix, with indices that you would specify using square brackets.

<codeblock id="01_03">
</codeblock>

Now, use the `head()` function to display part of the *experts* object.

<codeblock id="01_04">
</codeblock>

Finally, use one of the most important function, the `summary()` function. You will see later, that this function can be used in various situations: on a data frame, on outputs from various model fitting functions, *etc*.

<codeblock id="01_05">
</codeblock>

By comparing these outputs, you can understand the results provided by the `summary()` function applied on a data frame.

As the *Panelist*, *Session*, *Rank*, and *Product* variables are intrinsically the sources of variability of the different sensory attributes, they have to be considered as experimental factors. To do so, we are going to transform them as factors by using the `as.factor()` function. As a variable is part of a data frame, we will use the `$` sign to reach a given variable of interest. Actually the `$` sign is used to reach any component of an R object.

<codeblock id="01_06">
</codeblock>

This can be translated by "reach the *Product* variable of the *experts* object, transform it as a factor and assign these new values in the *Product* variable of the *experts* object": in other words, change the *Product* variable into a factor (by replacing its values).

Let's now do that for the other experimental factors.

<codeblock id="01_07">
</codeblock>

Let's now have a look at our data frame (the output is displayed in the console).

<codeblock id="01_08">
</codeblock>

Apparently, nothing has changed but if you run the `summary()` function you will see that the first 4 variables are now considered as factors.

A very important function related to the notion of factor is the `level()` function (and all its variants). Let's apply it to the *Product* variable of our *expert* data frame. This function displays the vector of levels of a factor (or categorical variable).

<codeblock id="01_09">
</codeblock>

As evoked previously, you can navigate in this vector (as in a matrix) by using square brackets.

<codeblock id="01_10">
</codeblock>

And you can change this value easily by assigning another value:

<codeblock id="01_11">
</codeblock>

## Tips: the notion of iteration

<codeblock id="01_12">
</codeblock>

Finally, let's check our *experts* data frame.

According to the output, you can see that we have two types of variables: the experimental factors, on the one hand, the sensory attributes, on the other hand. 

For each factor, as for any qualitative variable, the `summary()` function provides the number of occurrences for each level: *e.g.*, for the *Product* variable, among the 288 rows in the data frame, 24 rows correspond to an assessment of the product *Angel*. 

For each sensory attribute, as for any quantitative variable, the `summary()` function provides the so-called location parameters such as the minimum, the maximum, the median, the mean and the other quartiles of the variable of interest.

## The R corner

The values of these location parameters can also be obtained by running the following simple functions. These values can be combined using the very important `c()` function (this function combines values into a vector).

<codeblock id="01_13">
</codeblock>

Let's calculate these values for all the attributes and store them in a data frame. Let's create a data frame called *loc.parameters* with the `data.frame()` function.

<codeblock id="01_14">
</codeblock>

By iterating according to the columns we can calculate the values of the location parameters for each attribute and bind them, row by row with the `rbind()` function.

<codeblock id="01_15">
</codeblock>

Then, in order to obtain an operational data frame, we set the names of the columns and the rows with the `colnames()` and the `rownames()` functions.

<codeblock id="01_16">
</codeblock>

</exercise>

