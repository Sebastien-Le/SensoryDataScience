---
title: 'Chapter 1: Dealing with quantitative perception'
description:
  '"Sensory Data Science" is an innovative course about data science applied to sensory data. In this course, we will try to find the right balance between statistics, computer science, mathematics, formalism, intuition, with a pinch of sensory, consumer, perception data. The spirit of the course is as follows: start with data, explore them and introduce the statistical and computer elements necessary to obtain knowledge. Data mining will be done using R software.'
prev: null
next: /chapter2
type: chapter
id: 1
---


<exercise id="1" title="From sensory data collection to a collection of sensory data">

One of the most common situation when dealing with *quantitative perception* occurs when a set of stimuli is assessed by panelists according to a bunch of quantitative sensory attributes. One can distinguish between two situations: when the sensory attributes are the same from one panelist to the other, when the sensory attributes are different from one panelist to the other, what happens when panelists can use their own sensory attributes. 

In this course, we will deal essentially with the so-called *QDA* type of data, when panelists rate according to a fix list of attributes. These data are the origin of sensory data, and we will see that it's a very convenient model, from a statistical point of view: in other words you will be able to learn a lot in terms of statistical thinking from these data.

Let's say you are a panelist, and you have to assess a set of perfumes according to a list of sensory attributes from 0 to 10: 0 meaning that you don't perceive the perfume you assess as *heady* for instance, 10 meaning that you perceive the perfume as extremely *heady*. Each time you will have to evaluate a perfume, a lab assistant will provide you with a sample of the perfume and a form to be filled. On this form, you will note your name, the three digits code of the perfume you are testing.

From a statistical point of view, the **statistical unit** of interest is the form on which you have noted many information. In other words, as in a data set rows correspond to statistical units and columns correspond to variables, in our situation, each row of our data set is a form with information such as the name of the panelist, the product that has been assessed, the scores for the different sensory attributes.

Before importing the data, let's have a look at our first data set based on quantitative measurements: `perfumes_qda_experts.csv`.

## The *Stat* corner: data collection *versus* collection of data


Let's recall that:

* A data collection is the process of gathering and measuring information.
* A data set is a collection of data. In the case of tabular data, a data set corresponds to one table, where every column of the table represents a particular variable, and each row corresponds to a given record of the data set in question. ![formula](https://render.githubusercontent.com/render/math?math=\square)

</exercise>

<exercise id="2" title="From a data set to a data frame">

Before importing our data set in R, let's recall that R is like a freeway. It's complex, it goes very fast, it can be dangerous when it's not properly used, and as a pedestrian your life expectancy is about 5 to 10 minutes. We all know people that have opened an R session (after struggling for its installation) and that have quitted after 5 minutes, without doing anything but grumbling.

## The *R* corner: the survival guide

Let's first import our dataset and have a look at it. To do so, we will use two apparently different functions, the `read.csv()` function, dedicated to *csv* files, and the `read.table()` function, which seems more generic. We will also use a very important sign that will allow you to assign results provided by an R function to an R object: `<-`. Indeed, importing data means reading data from a source, then storing what has been read in an R object.

To survive in this jungle what you need to know is: 

* How to install R
* How to look for the appropriate piece of information when using a function or a package (let's define this roughly as a set of functions)
* How to use that piece of information
* How to import a data set and play with it

R can be found on the CRAN (Comprehensive R Archive Network) at the following address: http: //cran.r-project.org/. Choose the version that corresponds to your operating system (windows, mac or Linux), then download it. To install it you can just use the default options and say "yes" to everything. 

Once R is installed, open it, and please read carefully the message that appears in your R window, and in particular its end. As written,

```{r}
Type ’demo()’ for some demos, ’help()’ for on-line help, or
’help.start()’ for an HTML browser interface to help.
Type ’q()’ to quit R.
```

These are your first R functions: `demo()`, `help()`, `help.start()` and `q()`. 

If you run the following code

```{r}
demo()
```

you will see that R will suggest you several demos. Just pick one of them, say *graphics* for instance and have a look at what happens.

```{r}
demo(graphics)
```

As you can see, a function (with some rare exceptions) need some inputs to produce some outputs. What you need now, is a list of functions that are really important, and some insights about how to use functions. These insights can be found easily once you know the name of the function you want to use, which is often the case. To have access to the help page of a function, all you have to do is to write in the console the name of the function preceded by a question mark, as follows.

```{r}
?read.csv
```
The structure of the help page in the R documentation is roughly the same from one function to the other. It begins by a description of the function, then it shows how it can be used, then it describes the arguments of the function, in other words the input you have to provide to run the function (some/most of the arguments are optional as there is often a default value for each argument). Finally, it presents the outputs calculated or plotted by the function and it provides examples that you can copy and paste directly in your R console, without even having any data sets. ![formula](https://render.githubusercontent.com/render/math?math=\square)

Let's first import our dataset in R and have a look at it. To do so, we will use the `read.csv()` function, dedicated to *csv* files. We will also use a very important sign that will allow you to assign results provided by an R function to an R object: `<-`. Indeed, importing data means reading data from a source, then storing what has been read in an R object.

<codeblock id="01_01">
</codeblock>

Actually, this line of code will produce exactly the same result as the following line:

<codeblock id="01_17">
</codeblock>

In this one, we have introduced the notion of **argument**: in mathematics, a variable associated with a function and determining the value of the function.

## The *R* corner: the `read.table()` function

As its name suggests, the `read.table()` function reads a file in table format and creates a **data frame** from it, with cases corresponding to lines and variables to fields in the file. Actually, the two functions `read.csv()` and `read.table()` are the same, except for the defaults, *i.e.* the default values of the arguments. 

<codeblock id="01_02">
</codeblock>

Don't hesitate to have a look at the help page of the `read.table()` function. ![formula](https://render.githubusercontent.com/render/math?math=\square)

Let's have a look at what has been imported in R, the object *experts* which is actually a data frame. To display any R object, write its name in the console. To display part of the *experts* object, select the rows and columns you want to diplay. By definition, a data frame is a table or a two-dimensional array, and you can navigate in this array as you would in any matrix, with indices that you would specify using **square brackets** (not to be confused with the **parentheses** used when using a function).

<codeblock id="01_03">
</codeblock>

Now, use the `head()` function to display part of the *experts* object.

<codeblock id="01_04">
</codeblock>

Finally, use one of the most important function, the `summary()` function. You will see later, that this function can be used in various situations: on a data frame, on outputs from various model fitting functions, *etc*.

<codeblock id="01_05">
</codeblock>

By comparing these outputs, you can understand the results provided by the `summary()` function applied on a data frame. As you can guess, the `summary()` function is really important and should be used each time you have imported a data set: it provides a summary of the data set of interest which will help you checking whether your data have been properly imported. In this example, it has been applied to the data set *experts*.

## The *R* corner: the output of a function

The outputs provided by a function can be either a graphical output, or a numerical output. When it's a numerical output, it's often constituted of many different numerical results. It is literally a list of results, *i.e.* a number of connected items that are calculated by the function. The concept of **list** is really important in R, as you may want to access easily to the different items that constitute the output.  ![formula](https://render.githubusercontent.com/render/math?math=\square)

As the *Panelist*, *Session*, *Rank*, and *Product* variables are intrinsically the sources of variability of the different sensory attributes, they have to be considered as experimental factors. To do so, we are going to transform them as factors by using the `as.factor()` function. As a variable is part of a data frame, we will use the `$` sign to reach a given variable of interest. Actually the `$` sign is used to reach any  component of an R object.

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

A very important function related to the notion of factor is the `level()` function (and all its variants). Let's apply it to the *Product* variable of our *experts* data frame. This function displays the vector of levels of a factor (or categorical variable).

<codeblock id="01_09">
</codeblock>

As evoked previously, you can navigate in this vector (as in a matrix) by using square brackets.

<codeblock id="01_10">
</codeblock>

And you can change this value easily by assigning another value:

<codeblock id="01_11">
</codeblock>

## The *Algo* corner: the notion of iteration

Let ![formula](https://render.githubusercontent.com/render/math?math=j) be the column index. We are going to write our first *loop* in R, so that the four first columns of *experts* can be considered as experimental factors.

<codeblock id="01_12">
</codeblock>

Don't hesitate to go to the following link *https://www.r-bloggers.com/2015/12/how-to-write-the-first-for-loop-in-r/*. ![formula](https://render.githubusercontent.com/render/math?math=\square)

Finally, let's check our *experts* data frame.

<codeblock id="01_18">
</codeblock>

According to the output, you can see that we have two types of variables: the experimental factors, on the one hand, the sensory attributes, on the other hand. 

For each factor, as for any qualitative variable, the `summary()` function provides the number of occurrences for each level: *e.g.*, for the *Product* variable, among the 288 rows in the data frame, 24 rows correspond to an assessment of the product *Angel*. 

For each sensory attribute, as for any quantitative variable, the `summary()` function provides the so-called **location parameters** such as the minimum, the maximum, the median, the mean and the other quartiles of the variable of interest. It looks like our data have been properly imported in R.

## The *Stat* corner: the notion of percentile

When you look at the output of the `summary()` function, *Qu.* stands for quartile. By definition, each of four equal groups into which a population can be divided according to the distribution of values of a particular variable;  each of the three values of the random variable that divide a population into four groups, and as you can guess the second quartile of a series of numbers is the *median* (by definition, the value that separates the series of values into two equal parts). Sometimes, you will see the notion of *percentile*. ![formula](https://render.githubusercontent.com/render/math?math=\square)

- Minimum (![formula](https://render.githubusercontent.com/render/math?math=Q_0)) or <img src="https://latex.codecogs.com/svg.image0^{th}"/> percentile): the lowest data point in the data set excluding any outliers

- Maximum (<img src="https://latex.codecogs.com/svg.imageQ_4"/>  or <img src="https://render.githubusercontent.com/render/math?math=100^{th}"> percentile): the highest data point in the data set excluding any outliers

- Median (![formula](https://render.githubusercontent.com/render/math?math=Q_2)) or <img src="https://latex.codecogs.com/svg.image50^{th}"/> percentile): the middle value in the data set

- First quartile (![formula](https://render.githubusercontent.com/render/math?math=Q_1) or <img src="https://latex.codecogs.com/svg.image25^{th}"/>) percentile): also known as the lower quartile, it is the median of the lower half of the data set

- Third quartile (![formula](https://render.githubusercontent.com/render/math?math=Q_3) or <img src="https://latex.codecogs.com/svg.image75^{th}"/>) percentile): also known as the upper quartile, it is the median of the upper half of the data set

## The *R* corner: the `c()` function, building an intermediate data set

The values of these location parameters can also be obtained by running the functions `mean()` and `quantile()`. The input of these two functions is a sequence of values from which we want to calculate the mean, and the quantilles. After calculating the location paramters, we can combine them using the very important `c()` function (this function combines values into a vector): in other words we apply a function on outputs provided by some other functions.

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




<exercise id="3" title="From location parameters to the notion of distribution and its visualization">

In this part, we are going to introduce one of the most convenient way of representing a sequence of values (in our case, the scores associated with a sensory attribute), the so-called *boxplot*.

As for the `mean()` function, the main input you need to fill in is the vector of values you want to represent.

<codeblock id="01_19">
</codeblock>

## The *Stat* corner: the interquartile range

By definition, a boxplot is a standardized way of displaying a sequence of values based on: the minimum, the maximum, the sample median, and the first and third quartiles. In addition to the minimum and maximum values used to construct a boxplot, another important element that can also be employed to obtain a boxplot is the interquartile range (*IQR*), the distance between the upper and lower quartiles. Intuitively, you can see the notion of dispersion appearing in the notion of range. ![formula](https://render.githubusercontent.com/render/math?math=\square)

## The *R* corner: setting graphical parameters

Let's represent three boxplots in a same graphical output. To do so, we use the `par()` function to set some graphical parameters and we set the `mfrow` argument to create a matrix of plots in one ploting space.

<codeblock id="01_20">
</codeblock>

## Exercise 

To the previous graphical output, add a line corresponding to the mean with the `abline()` function. ![formula](https://render.githubusercontent.com/render/math?math=\square)

<codeblock id="01_21">
</codeblock>

By definition, a distribution is "the way in which something is shared out among a group or spread over an area". To some extent, a boxplot is a representation of a distribution. In our situation we want to understand how the scores of given sensory attribute are distributed; we also want to see if this distribution depends on some experimental factors (the products or the panelists, for instance).

For a better understanding of the notion of distribution, let's display the values that lie between 0 and 1 (included), and let's count them. To do so, we first have to select them, then to get the length (or dimension) of the vector with the scores selected. 

## The *Math* corner: function composition

In mathematics, function composition is an operation that takes two functions ![formula](https://render.githubusercontent.com/render/math?math=f) and ![formula](https://render.githubusercontent.com/render/math?math=g), and produces a function ![formula](https://render.githubusercontent.com/render/math?math=h) such that
<img src="https://latex.codecogs.com/svg.imageh(x)=g(f(x)"/>. In the following code, instead of saving the results of the selection in an R object, we used what is called function composition.

<codeblock id="01_22">
</codeblock>

`<=` is called a logical operator, and you can combine them if you want the values that lie between 1 and 2.

<codeblock id="01_23">
</codeblock>

For the attribute *Spicy*, 176 values are less than or equal to 1, 24 lie bteween 1 and 2: it seems that our **product space** composed of perfumes is not spicy at all.

## The *Algo* corner: the notion of logical operators

The most important logical operators are:

* `<`	less than
* `<=`	less than or equal to
* `>`	greater than
* `>=`	greater than or equal to
* `==`	exactly equal to
* `!=`	not equal to
* `!x`	Not x
* `x | y`	x OR y
* `x & y`	x AND y

As demonstrated, logical operators are important to select data. ![formula](https://render.githubusercontent.com/render/math?math=\square)

Let's visualize the *Spicy* attribute by using a two dimensional graph, where the *x-axis* correspond to the values taken by the scores and the *y-axis* to their respective number of occurrences. To represent this so-called **histogram**, we will first use the `hist()` function. The basic input is the sequence of values you want to represent, as for the `boxplot()` function.

<codeblock id="01_24">
</codeblock>

As we have seen previously, we have many values that lie between 0 and 1, and it could make sense to change the *breakpoints*. In our case, we used the defaults of the `hist()` function, but we could imagine increasing the number of *breaks*.

<codeblock id="01_25">
</codeblock>

If you consider a frequency as the relative number of times something occurs, the default legend on the *y-axis* is somehow misleading. You can change it by setting the `ylab` argument.

<codeblock id="01_26">
</codeblock>

Let's now set the `probability` argument to `TRUE`, and change the default title with the `main` argument.

<codeblock id="01_27">
</codeblock>

## Exercise

If you want to have a better understanding of the *y-axis*, please have a look at the following link *https://stackoverflow.com/questions/32564005/density-frequency-and-probability-in-hist*. It should help you understanding the notion of histogram and of density. ![formula](https://render.githubusercontent.com/render/math?math=\square)

Let's now introduce the notion of density. By definition, the density of a continuous random variable, is a function whose value at any given sample (or point) in the sample space (the set of possible values taken by the random variable) can be interpreted as providing a relative likelihood that the value of the random variable would be close to that sample. (*https://en.wikipedia.org/wiki/Probability_density_function*)

To get a graphical representaton of the density for a sensory attribute, we use the `density()` function, and the very important `plot()` function.

<codeblock id="01_28">
</codeblock>

As you can see, we have saved the outputs of `density()` in an object named `d`, then we have applied the `plot()` function on `d`: this function is a generic function for plotting R objects.

The `plot()` function can also be used on two vectors of same length. The output of the `density()` function is a list of numerical indicators. To get the elements of the list, we are going to use the very important function `names()`.

<codeblock id="01_29">
</codeblock>

The first element of the list, `"x"`, is the vector of the coordinates of the points where the density is estimated. The second element of the list, `"y"`,	is the vector of the estimated density values.

Let's now plot the two vectors `d$x` and `d$y`.

<codeblock id="01_30">
</codeblock>

## The *R* corner: `ggplot2` an alternative to base R

So far, the functions we've used are directly integrated in R. There's a possibility to use *external* R functions from what is called a package: in other words, a bunch of functions dedicated to a specific purpose. In the following section, we introduce the `ggplot2` package to visualize our data. `ggplot2` is a system for declaratively creating graphics, based on The Grammar of Graphics. The main idea is to provide the data, tell `ggplot2` how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

Note that packages have to be installed once, and loaded each time you want to use them. To do so, we use the `install.packages()` each time we want to install a package, and the `library()` function each time we want to use a package within an R session.

Please have a look at the following link *https://ggplot2.tidyverse.org*.
You can also download the R studio cheat sheet at the following address: *https://github.com/rstudio/cheatsheets/blob/main/data-visualization-2.1.pdf*.

Visualizing a sensory attribute with an histogram can be done the following way.

<codeblock id="01_31">
</codeblock>

As in R base, the default output is based on occurrences, but it can be changed easily as demonstrated in the following code.

<codeblock id="01_32">
</codeblock>

</exercise>





<exercise id="4" title="From distribution to dispersion">

Dispersion is (one of) **the** most important concept in statistics. It can be defined as the extent to which values of a variable differ from a fixed value such as the mean. We will illustrate graphically this concept and then define it more formally.

Let's say we want to visualize 30% of the values "around" the average (arbitrarily), how could we do that? 

In practice, we want to find `x1` and `x2` such as the mean lies between `x1` and `x2`, and 

<img src="https://latex.codecogs.com/svg.image?P[x_1 \leq X \leq x_2]=F_X(x_2)-F_X(x_1)=\int_{x_1}^{x_2}f_X(x)dx=0.3"/>

where <img src="https://latex.codecogs.com/svg.image?F_X()"/> is the so-called **cumulative function**, and <img src="https://latex.codecogs.com/svg.image?f_X()"/> the density function of ![formula](https://render.githubusercontent.com/render/math?math=X), a continuous random variable associated with a sensory attribute.

Let's first identify `i_mean` the index (position) of the mean of the *Vanilla* attribute in the vector `d$x`. To do so we are going to use the `which.max()` function. Then, let's calculate `pcum1` (*resp.* `pcum2`), which is the value of the cumulative function applied on `d$x[i_mean]` minus (*resp.* plus) 0.15. By definition, `x_1` (*resp.* `x2`) is the index of the value in the vector of the values from the cumulative function, such as the cumulative function applied on this value equals `pcum1`. In other words, the value of the cumulative function on `x_1` is equal tothe value of the cumulative function on the mean minus 0.15.

<codeblock id="01_33">
</codeblock>

The blue area illustrates the notion of dispersion around the mean, in the sense that 30% of the values lie between 1.46 and 6.56.

</exercise>




<exercise id="5" title="From dispersion to standard deviation">

As said previously, the concept of dispersion can be defined as the extent to which values of a variable differ from a fixed value such as the mean. In the same way as we have introduced location parameters, in this part, we will introduce the notion of dispersion parameters.

Remember when we defined the boxplot, we said that the box is defined by the interquartile range: that *IQR* was our first dispersion parameter. The range, *i.e.* the difference between the maximum and the minimum, is also a dispersion parameter.

The most important dispersion parameter is the so-called **standard deviation**. A useful property of the standard deviation is that it is expressed in the same unit as the data.

## The *Stat* corner: mean and standard deviation

Let's say you observe a bunch of random variables ![formula](https://render.githubusercontent.com/render/math?math=X_i), <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}"/>. From the realizations <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}"/>, you usually want to estimate the mean ![formula](https://render.githubusercontent.com/render/math?math=\mu) of your variables, to get some insights on your population. To do so, you use an estimator of ![formula](https://render.githubusercontent.com/render/math?math=\mu), usually <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i"/>. From this estimator (which is by the way a random variable), you can get an estimation of ![formula](https://render.githubusercontent.com/render/math?math=\mu) by calculating <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i"/>. The standard deviation ![formula](https://render.githubusercontent.com/render/math?math=\sigma) can be estimated using the following expression: <img src="https://latex.codecogs.com/svg.image?s = \sqrt{\frac{1}{n}\sum(x_i-\bar{x})^2}"/>.

**Centering** the data is as important as it is simple, apparently. By definition, to center is to place in the middle. Centering is subtracting the average to each value that has been measured. In other words ![formula](https://render.githubusercontent.com/render/math?math=x_i \leftarrow x_i-\bar{x}), where ![formula](https://render.githubusercontent.com/render/math?math=\bar{x}=\frac{1}{n}\sum x_i) is the average calculated over the ![formula](https://render.githubusercontent.com/render/math?math=x_i).

Understanding the idea of **standardizing the data**, is the key to understanding statistics. You will see that standardized data will allow you to do compare variables that are not *a priori* comparable: am I bigger than you are small? You will be able to answer that question with standardized data. By definition, when data are standardized, their variance is equal to 1 (hence, their standard deviation is also equal to 1). In other words, let's consider a series <img src="https://latex.codecogs.com/svg.image?\{x_1,\dots,x_n\}"/>, <img src="https://latex.codecogs.com/svg.image?x_i \leftarrow \frac{x_i-\bar{x}}{s}"/>.

By construction, standardized data have no unit of measurement. These values represent the number of standard deviation that separate an individual from the average individual. Knowing that with a normal distribution, 95% of the realizations lie between more or less 2 standard deviations (actually 1.96) from the average, when a standardized data is higher than 2 in absolute value, it means that the individual is quite peculiar regarding the variable of interest. ![formula](https://render.githubusercontent.com/render/math?math=\square)

Let's apply the `sd()` function and the `var()` function to a vector of values, in other words let's get the standard deviation of a sensory attribute and its variance: as you might already know, the standard deviation is the square root of the variance.

<codeblock id="01_34">
</codeblock>

The call of this function is very easy, but there is in fact a real conceptual difficulty behind what we do.

## The *Stat* corner: inferential *versus* descriptive

If you look at the help page of the `sd()` function you will see in the *Details* section that "Like var this uses denominator n - 1". In statistics, we distinguish two distinct situations, depending on whether the analysis is inferential or descriptive (exploratory). Inferential statistical analysis infers properties of a population, for example by testing hypotheses and deriving estimates. Descriptive statistics is distinguished from inferential statistics by its aim to summarize a sample, rather than use the data to learn about the population that the sample of data is thought to represent (*https://en.wikipedia.org/wiki/Statistical_inference* and *https://en.wikipedia.org/wiki/Descriptive_statistics*). The denominator ![formula](https://render.githubusercontent.com/render/math?math=n-1) is used in an inferential context. As you want to infer from a sample, you will systematically underestimate a deviation by dividing by $n$: to boost your estimation, the idea is to divide by a smaller number, ![formula](https://render.githubusercontent.com/render/math?math=n-1) instead of ![formula](https://render.githubusercontent.com/render/math?math=n). ![formula](https://render.githubusercontent.com/render/math?math=\square)

## Exercise

From your data, create a data frame of dispersion parameters such as the range, the IQR, the standard deviation and the variance. ![formula](https://render.githubusercontent.com/render/math?math=\square)

<codeblock id="01_35">
</codeblock>

</exercise>
