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

- Minimum (![formula](https://render.githubusercontent.com/render/math?math=Q_0)) or <img src="https://latex.codecogs.com/svg.image?0^{th}"/> percentile): the lowest data point in the data set excluding any outliers

- Maximum (<img src="https://latex.codecogs.com/svg.image?Q_4"/>  or <img src="https://render.githubusercontent.com/render/math?math=100^{th}"> percentile): the highest data point in the data set excluding any outliers

- Median (![formula](https://render.githubusercontent.com/render/math?math=Q_2)) or <img src="https://latex.codecogs.com/svg.image?50^{th}"/> percentile): the middle value in the data set

- First quartile (![formula](https://render.githubusercontent.com/render/math?math=Q_1) or <img src="https://latex.codecogs.com/svg.image?25^{th}"/>) percentile): also known as the lower quartile, it is the median of the lower half of the data set

- Third quartile (![formula](https://render.githubusercontent.com/render/math?math=Q_3) or <img src="https://latex.codecogs.com/svg.image?75^{th}"/>) percentile): also known as the upper quartile, it is the median of the upper half of the data set

## The *R* corner: the `c()` function, building an intermediate data set

The values of these location parameters can also be obtained by running the functions `mean()` and `quantile()`. The input of these two functions is a sequence of values from which we want to calculate the mean, and the quantiles. After calculating the location paramters, we can combine them using the very important `c()` function (this function combines values into a vector): in other words we apply a function on outputs provided by some other functions.

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
<span style="position: center" ><img src="https://latex.codecogs.com/svg.image?h(x)=g(f(x))" style="margin-bottom : -0.25rem"/></span>. In the following code, instead of saving the results of the selection in an R object, we used what is called function composition.

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

<center><img src="https://latex.codecogs.com/svg.image?P[x_1 \leq X \leq x_2]=F_X(x_2)-F_X(x_1)=\int_{x_1}^{x_2}f_X(x)dx=0.3"/></center>

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

Let's say you observe a bunch of random variables <img src="https://latex.codecogs.com/svg.image?X_i" style="margin-bottom : -0.25rem"/>, <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}" style="margin-bottom : -0.25rem"/>. From the realizations <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}" style="margin-bottom : -0.25rem"/>, you usually want to estimate the mean <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> of your variables, to get some insights on your population. To do so, you use an estimator of <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>, usually <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i" style="margin-bottom : -1rem"/>. From this estimator (which is by the way a random variable), you can get an estimation of <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> by calculating <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i" style="margin-bottom : -1rem"/>. The standard deviation <img src="https://latex.codecogs.com/svg.image?\sigma" style="margin-bottom : -0.25rem"/> can be estimated using the following expression: <img src="https://latex.codecogs.com/svg.image?s = \sqrt{\frac{1}{n}\sum(x_i-\bar{x})^2}" style="margin-bottom : -1rem"/>.

**Centering** the data is as important as it is simple, apparently. By definition, to center is to place in the middle. Centering is subtracting the average to each value that has been measured. In other words <img src="https://latex.codecogs.com/svg.image?x_i \leftarrow x_i-\bar{x}" style="margin-bottom : -0.25rem"/>, where <img src="https://latex.codecogs.com/svg.image?\bar{x}=\frac{1}{n}\sum x_i" style="margin-bottom : -1rem"/> is the average calculated over the ![formula](https://render.githubusercontent.com/render/math?math=x_i).

Understanding the idea of **standardizing the data**, is the key to understanding statistics. You will see that standardized data will allow you to do compare variables that are not *a priori* comparable: am I bigger than you are small? You will be able to answer that question with standardized data. By definition, when data are standardized, their variance is equal to 1 (hence, their standard deviation is also equal to 1). In other words, let's consider a series <img src="https://latex.codecogs.com/svg.image?\{x_1,\dots,x_n\}" style="margin-bottom : -0.25rem"/>, <img src="https://latex.codecogs.com/svg.image?x_i \leftarrow \frac{x_i-\bar{x}}{s}" style="margin-bottom : -1rem"/>.

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





<exercise id="6" title="From distribution to conditional distribution">

The main question with sensory data or perception data is often: "can I explain the differences between the scores provided by my assessors for a given attributes, by the differences between my products?". In other words, one of the main hypothesis you want to test is whether different products might induce different perceptions and therefore might explain the variability of the scores.

Let's consider the two products *Angel* and *J'adore ET*, and the sensory attribute *Floral*: is there a difference between these two products according to the *Floral* attribute?

To clarify this question, let's represent the *Floral* attribute according to the two products *Angel* and *J'adore ET*. This task clearly suggests data manipulation, and we are going to introduce briefly the `dplyr` package. Don't hesitate to have a look at the *dplyr* cheat sheet at the following address: *https://github.com/rstudio/cheatsheets/blob/main/data-transformation.pdf*. You can also visit this page: *https://dplyr.tidyverse.org/reference/filter.html*.

## The *R* corner: this is a `%>%`

To subset our *experts* data frame, keeping the rows related to the two products *Angel* and *J'adore ET*, we're going to use the `filter()` function and a very important tool named **pipe**, `%>%`; not to be confused with the vertical line `|`, which is the logical operator *OR* and which is also called *pipe*.

If you want to know more about pipes (the first one), have a look at the online book *R for data science* from *Hadley Wickham* and *Garrett Grolemund*: *https://r4ds.had.co.nz/pipes.html*.

<codeblock id="01_36">
</codeblock>

Actually, you can subset in many different ways. If you remember well, you can navigate through a matrix with square brackets, where rows are separated by columns with a comma. If you want to select rows related to *Angel*, you can put a condition on the rows.

<codeblock id="01_37">
</codeblock>

You can add another condition with the logical operator `|` and select rows related to *Angel* and *J'adore ET*.

<codeblock id="01_38">
</codeblock>

Another way to do it, would be to use the `%in%` operator.

<codeblock id="01_39">
</codeblock>

Let's have a look et the summary of the subset.

<codeblock id="01_40">
</codeblock>

As you can see, the *Product* variable is still considered as a factor with 12 levels. You can get rid of the unused levels with the `droplevels()` function.![formula](https://render.githubusercontent.com/render/math?math=\square)

<codeblock id="01_41">
</codeblock>

<codeblock id="01_42">
</codeblock>

To have an other visualization, we can use `fill` and not `color` to have the shade of lines and we can change the gradient of colors of lines in informing the parameter `alpha` in `geom_histogram()`

<codeblock id="01_43">
</codeblock>

Another way of representing this type of information is by using boxplots.

<codeblock id="01_44">
</codeblock>

Remember what we said at the beginning of this part, we want to test whether different products might induce different perceptions and therefore might explain the variability of the scores: this is exactly what this graphical output suggests.

</exercise>





<exercise id="7" title="From conditional distribution to the comparison of two means">

Let's have a look at the *Angel* data on the one hand, on the *J'adore ET* data on the other hand. To do so we're going to build two data frames named *angel_exp* and *jadore_exp* respectively.

<codeblock id="01_45">
</codeblock>

## The *Stat* corner: the magic of sampling distribution and confidence interval

In a real life situation, you measure some quantitative variable on a sample of size <img src="https://latex.codecogs.com/svg.image?n"/>, in order to estimate the mean <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> of what you measure. Formally, you would say, for instance, that you observe a bunch of random variables <img src="https://latex.codecogs.com/svg.image?X_i" style="margin-bottom : -0.25rem"/>, <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}" style="margin-bottom : -0.25rem"/>, that follow a normal distribution with mean <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> and variance <img src="https://latex.codecogs.com/svg.image?\sigma^2" style="margin-bottom : -0.25rem"/>. From the realizations <img src="https://latex.codecogs.com/svg.image?\{ x_1, \dots, x_n \}" style="margin-bottom : -0.25rem"/>, you usually want to estimate <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>, to get some insights on your population.
To do so, you use an estimator of <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>, usually <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i" style="margin-bottom : -1rem"/>. Why would you do that? The answer is, <img src="https://latex.codecogs.com/svg.image?\bar{X}_n" style="margin-bottom : -0.25rem"/> has some very good properties. This estimator is a random variable which expectation is equal to <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>, in other words <img src="https://latex.codecogs.com/svg.image?E(\bar{X}_n)=\mu" style="margin-bottom : -0.25rem"/>. By definition, in probability theory, the expected value of a random variable is intuitively the long-run average value of repetitions of the experiment it represents (Wikipedia). The other very important property is that the distribution of the mean <img src="https://latex.codecogs.com/svg.image?E(\bar{X}_n)=\bar{X}_n" style="margin-bottom : -0.25rem"/> is approximately a normal distribution, whatever the original distribution of the <img src="https://latex.codecogs.com/svg.image?X_i" style="margin-bottom : -0.25rem"/>, it's incredible but true.

The thing is, in a real life situation, you only have one sample (in most cases). But if you had the possibility to have an infinite number of samples, you would be able to calculate an infinite number of means and to calculate the mean of the means. From that, you would get <img src="https://latex.codecogs.com/svg.image?E(\bar{X}_n)\bar{X}_n" style="margin-bottom : -0.25rem"/>, as well as the standard deviation of <img src="https://latex.codecogs.com/svg.image?\bar{X}_n" style="margin-bottom : -0.25rem"/>, and its distribution. You would be able to get a confidence interval of the mean, which is really important.

If you had enough money to run several times the same experiment, and hence to have measures from many different samples, you would see that the mean of the means over the samples is equal to <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>. Practically, it means that estimating the mean by using the formula <img src="https://latex.codecogs.com/svg.image?\frac{1}{n}\sum x_i" style="margin-bottom : -1rem"/> that you've learned when you were in school, is a good thing to do: the estimator <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i" style="margin-bottom : -1rem"/> has a very good property.

Please, copy and paste the following command lines.

<codeblock id="01_46">
</codeblock>

As you can see, we have simulated 20 *realizations* of a random variable following a normal distribution with <img src="https://latex.codecogs.com/svg.image?\mu=85" style="margin-bottom : -0.25rem"/> and <img src="https://latex.codecogs.com/svg.image?\sigma=2"/>.

<codeblock id="01_47">
</codeblock>

What if we simulate 100 samples of size 20?

<codeblock id="01_56">
</codeblock>

Remember the previous graphical representation that you obtained from 11 samples? The means that you have calculated for the 11 samples, are not exactly the same. They vary, but not as much as the original data. It's not only important to understand that, but it should be also very intuitive for you.
When the population is infinite (and in the case of withdraws with replacement), the variance of <img src="https://latex.codecogs.com/svg.image?\bar{X}_n" style="margin-bottom : -0.25rem"/> is:

<center><img src="https://latex.codecogs.com/svg.image?Var(\bar{X}_n)=\frac{\sigma^2}{n}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

It should make sense for you that the variance of <img src="https://latex.codecogs.com/svg.image?\bar{X}_n"/> depends on the variance of the original data, the ones that you measures on your statistical individual. If the data are variable ("messy"), the average will certainly vary from one sample to the other.

To understand the denominator, let's take samples of different sizes. If you measure small samples, the mean of your samples will vary more from one sample to the other than if you measure large samples. Let's take samples of size <img src="https://latex.codecogs.com/svg.image?n=2"/> for instance, which is really unrealistic. In one sample you may get two small individuals or two big individuals (let's say you measure the size of an individual), which can explain the fact that the mean may vary a lot from one sample to the other. If you work with samples of size <img src="https://latex.codecogs.com/svg.image?n=1000000000"/>, which can also be unrealistic, you won't probably get 1000000000 small individuals in one sample. For these samples of large size you will probably have something representative of the distribution of your individuals. The means over something representative will not vary a lot from one sample to the other, as they are all supposed to be representative.

This result on the variance of <img src="https://latex.codecogs.com/svg.image?\bar{X}_n" style="margin-bottom : -0.25rem"/> is really important. I'm sure that you have already seen this formula somewhere, and each time you want to calculate a confidence interval for some estimator you divide some variance by <img src="https://latex.codecogs.com/svg.image?\sqrt{n}" style="margin-bottom : -0.25rem"/>. Don't do that systematically. You have to understand what you're doing. If you are interested into some kind of estimator, all you have to do is to get the variance of that estimator. If your estimator is "blablabla", you need to know the variance of "blablabla", in order to get a confidence interval for "blablabla".

The way <img src="https://latex.codecogs.com/svg.image?\bar{X}_n" style="margin-bottom : -0.25rem"/> is distributed is not dependent from the fact that the <img src="https://latex.codecogs.com/svg.image?X_i" style="margin-bottom : -0.25rem"/> follow a normal distribution. This result is not that intuitive, but it is really important, as even though you're not working with normal distributions, the estimator of the mean will follow a normal distribution, that's the **central limit theorem**.

Suppose that <img src="https://latex.codecogs.com/svg.image?\forall i, X_i" style="margin-bottom : -0.25rem"/> follows a <img src="https://latex.codecogs.com/svg.image?N(\mu,\sigma^2)" style="margin-bottom : -0.25rem"/>. Then if you standardize the data, you get the following formula:

<center><img src="https://latex.codecogs.com/svg.image?\frac{\bar{X}_n-\mu}{\sigma/\sqrt{n}} \sim N(0,1)." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

From that formula, you can easily deduce a confidence interval for <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>.

<center><img src="https://latex.codecogs.com/svg.image?[\bar{X}_n-u_{1-\alpha/2}\times \frac{\sigma}{\sqrt{n}};\bar{X}_n+u_{1-\alpha/2}\times \frac{\sigma}{\sqrt{n}}]," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

where <img src="https://latex.codecogs.com/svg.image?u_{1-\alpha/2}" style="margin-bottom : -0.25rem"/> is the quantile of a normal distribution (X) such as <img src="https://latex.codecogs.com/svg.image?P(X\leq u_{1-\alpha/2})=1-\alpha/2" style="margin-bottom : -0.5rem"/>.

You should read the formula this way:

<center><img src="https://latex.codecogs.com/svg.image?[\bar{X}_n-u_{1-\alpha/2}\times \sigma_{\bar{X}_n};\bar{X}_n+u_{1-\alpha/2}\times \sigma_{\bar{X}_n}]," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

or even more generally

<center><img src="https://latex.codecogs.com/svg.image?[blabla-C\times \sigma_{blabla};blabla+C\times \sigma_{blabla}]," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

where <img src="https://latex.codecogs.com/svg.image?blabla"/> is the estimator of your parameter if interest and <img src="https://latex.codecogs.com/svg.image?C"/> is a constant.

When <img src="https://latex.codecogs.com/svg.image?\sigma"/> is not known, the standardization is not as trivial as in the previous case. You can't divide by <img src="https://latex.codecogs.com/svg.image?\sigma"/> anymore, as you don't know its value. You have to estimate it in an *inferential* context. This word, *inferential*, is super important, we've seen it before. It means that you want to generalize what you observed on the individuals of your sample, to the individuals of the whole population. In other words as you don't know <img src="https://latex.codecogs.com/svg.image?\sigma"/> you have to estimate it, but in a particular way, that takes into account the fact that you are working with a sample.

In an inferential context, we are going to use the following formula:

<center><img src="https://latex.codecogs.com/svg.image?S'^2=\frac{1}{n-1}\sum(X_i-\bar{X}_n)^2" style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

Why so? Actually, the main idea behind that estimator is that if you work on a sample in an inferential context you will always underestimate the variance with the sum of squares divided by <img src="https://latex.codecogs.com/svg.image?n"/>, as there is always some variability that you will miss: you observe less diversity on a sample, than on the whole population. So if you want to *infer* you have to boost the formula by dividing your sum of squares by <img src="https://latex.codecogs.com/svg.image?n-1"/> rather than by dividing by <img src="https://latex.codecogs.com/svg.image?n"/>.

As <img src="https://latex.codecogs.com/svg.image?S'"/> is a random variable and not a constant (as <img src="https://latex.codecogs.com/svg.image?\sigma"/> when you know its value), the distribution of the "standardized" <img src="https://latex.codecogs.com/svg.image?\bar{X}_n" style="margin-bottom : -0.25rem"/> is more complex than in the previous case.

<center><img src="https://latex.codecogs.com/svg.image?\frac{\bar{X}_n-\mu}{S'/\sqrt{n}} \sim T(n-1)." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

Hence, the confidence interval for <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> is:

<center><img src="https://latex.codecogs.com/svg.image?[\bar{X}_n-t^{(n-1)}_{1-\alpha/2}\times \frac{S'}{\sqrt{n}};\bar{X}_n+t^{(n-1)}_{1-\alpha/2}\times \frac{S'}{\sqrt{n}}]," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

where <img src="https://latex.codecogs.com/svg.image?t^{(n-1)}_{1-\alpha/2}" style="margin-bottom : -0.75rem"/> is the quantile of a Student distribution with <img src="https://latex.codecogs.com/svg.image?n-1"/> degrees of freedom (T) such as <img src="https://latex.codecogs.com/svg.image?P(T \leq t^{(n-1)}_{1-\alpha/2})=1-\alpha/2" style="margin-bottom : -0.5rem; margin-top : 1rem"/>. <img src="https://latex.codecogs.com/svg.image?\square"/>

Very practically, it means that you can determine a confidence interval for the real mean <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> that you will never know.

<codeblock id="01_48">
</codeblock>

## Exercise: the notion of *p-value*

The function we're going to use for our **t-test** is called `t.test`. If you don't know how to use this function, write the following code in the console `?t.test` and you will get an explanation of the function. Go straight to the example part, at the very end. Think carefully of the parameters that you have to specify. For this test, we want to check whether the product *Angel* or the product *J'adore ET* can be considered as *floral*? Based on what you've experienced, how could you define the notion of _p-value_? <img src="https://latex.codecogs.com/svg.image?\square"/>

When you compare two means, <img src="https://latex.codecogs.com/svg.image?\mu_1" style="margin-bottom : -0.25rem"/> and <img src="https://latex.codecogs.com/svg.image?\mu_2" style="margin-bottom : -0.25rem"/>, you want to assess which one of the two following hypotheses. [By definition, a supposition or proposed explanation made on the basis of limited evidence as a starting point for further investigation.] is the most convincing:

1. <img src="https://latex.codecogs.com/svg.image?H_0: \mu_1 = \mu_2" style="margin-bottom : -0.25rem"/>
2. <img src="https://latex.codecogs.com/svg.image?H_1: \mu_1 \ne \mu_2" style="margin-bottom : -0.25rem"/>

When you look at the <img src="https://latex.codecogs.com/svg.image?H_0" style="margin-bottom : -0.25rem"/>, the so-called null hypothesis, you can also rephrase it the following way: <img src="https://latex.codecogs.com/svg.image?H_0: \mu_1 - \mu_2 =0" style="margin-bottom : -0.25rem"/>. If you think carefully about what you've seen so far, what you need in order to assess these two hypotheses is a confidence interval for the difference <img src="https://latex.codecogs.com/svg.image?\mu_1 - \mu_2" style="margin-bottom : -0.25rem"/> (that you will never know, by the way). In other words, to assess the veracity of these hypotheses, what you need to do is to consider the following test statistic. [By definition, a single measure of some attribute of a sample (_i.e._ a statistic) used in statistical hypothesis testing, Wikipedia]:

<center><img src="https://latex.codecogs.com/svg.image?D=\bar{X}_1-\bar{X}_2." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

And of course, if you think about what we said in the previous section, you need to estimate <img src="https://latex.codecogs.com/svg.image?D"/> and its variance, in order to get a confidence interval for <img src="https://latex.codecogs.com/svg.image?\mu_1 - \mu_2"  style="margin-bottom : -0.25rem"/>.

The main difficulty here is to get an estimator for <img src="https://latex.codecogs.com/svg.image?\sigma^2_D"  style="margin-bottom : -0.25rem"/> (let's call this estimator <img src="https://latex.codecogs.com/svg.image?\hat{\sigma}^2_D"  style="margin-bottom : -0.25rem"/>) and to get the distribution of

<center><img src="https://latex.codecogs.com/svg.image?\frac{D}{\hat{\sigma}_D}," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

under the null hypothesis (when the two means are the same).

The principle of this test is fundamental, and it will be always the same principle for other test statistic: you need to know their standard deviation, and their distribution under the null hypothesis, once standardized (once it is divided by the standard deviation).

As "everything" is independent, the variance of a difference is the sum of the variances. In other words:

<center><img src="https://latex.codecogs.com/svg.image?Var(\bar{X}_1-\bar{X}_2) = Var(\bar{X}_1) + Var(\bar{X}_2)= \frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

If we can assume that there's a common variance <img src="https://latex.codecogs.com/svg.image?\sigma^2=\sigma_1^2=\sigma_2^2" style="margin-bottom : -0.25rem"/> (_cf._ next section), then 

<center><img src="https://latex.codecogs.com/svg.image?\sigma^2_D=\sigma^2(\frac{1}{n_1}+\frac{1}{n_2})." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

Now we have to find an estimator of the common variance <img src="https://latex.codecogs.com/svg.image?\sigma^2" style="margin-bottom : -0.25rem"/>, which is naturally the weighted average of the variances:

<center><img src="https://latex.codecogs.com/svg.image?\hat{\sigma}^2=\frac{(n_1-1){S'_1}^2+(n_2-1){S'_2}^2}{n_1+n_2-2}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

It's not that difficult and it's rather logical (you want to mix both information, and you mostly believe in the one for which you have lots of observations); and finally:

<center><img src="https://latex.codecogs.com/svg.image?\hat{\sigma}^2_D=\hat{\sigma}^2(\frac{1}{n_1}+\frac{1}{n_2})." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

Under the null hypothesis (the two means are equal):

<center><img src="https://latex.codecogs.com/svg.image?\frac{D}{\hat{\sigma}_D} \sim T(n_1+n_2-2)." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>


In statistics, statistical hypothesis testing is fundamental. Two hypotheses are confronted, the null hypothesis, <img src="https://latex.codecogs.com/svg.image?H_0"  style="margin-bottom : -0.25rem"/>, and the alternative hypothesis, <img src="https://latex.codecogs.com/svg.image?H_1"  style="margin-bottom : -0.25rem"/>. Apparently, one hypothesis has to be chosen, but in practice the problem is different and can be expressed the following way: should I chose <img src="https://latex.codecogs.com/svg.image?H_0" style="margin-bottom : -0.25rem"/>? In other words, the problem is not symmetrical and <img src="https://latex.codecogs.com/svg.image?H_0"  style="margin-bottom : -0.25rem"/> is the hypothesis according to which a decision is taken. By definition (Wikipedia), the size for simple hypotheses, is the test's probability of incorrectly rejecting the null hypothesis. *The false positive rate*; the significance level of a test (<img src="https://latex.codecogs.com/svg.image?\alpha"/>), is the upper bound imposed on the size of a test. Its value is chosen by the statistician prior to looking at the data or choosing any particular test to be used. It is the maximum exposure to erroneously rejecting <img src="https://latex.codecogs.com/svg.image?H_0" style="margin-bottom : -0.25rem"/> he/she is ready to accept. Testing <img src="https://latex.codecogs.com/svg.image?H_0"  style="margin-bottom : -0.25rem"/> at significance level <img src="https://latex.codecogs.com/svg.image?\alpha"/> means testing <img src="https://latex.codecogs.com/svg.image?H_0" style="margin-bottom : -0.25rem"/> with a test whose size does not exceed <img src="https://latex.codecogs.com/svg.image?\alpha"/>. In most cases, one uses tests whose size is equal to the significance level.

</exercise>





<exercise id="8" title="From the comparison of two means to the notion of model">

The concept of model is very important. A model, in its usual sense, can be seen as a simplified description of the reality. When you test the difference in means between the two products *Angel* and *J'adore ET*, you implicitly suggest that the floral character of a perfume depends on the perfume. This model can be written the following way: `Floral~Products`. From a perceptual point of view, this model is really too simplistic, and in reality, q simple but much more realistic model is to consider the assessor as a factor of variability. In other words, you want to evaluate the following model: `Floral~Products+Panelist`.

For educational purposes, we will first look at the first model but in practice it is the second model that should be considered.

Let's now use the following notations: 

* <img src="https://latex.codecogs.com/svg.image?y_{ij}" style="margin-bottom : -0.25rem"/> is the value taken for the <img src="https://latex.codecogs.com/svg.image?j^{th}" style="margin-bottom : -0.25rem"/> value associated with the <img src="https://latex.codecogs.com/svg.image?i^{th}"/> perfume
* <img src="https://latex.codecogs.com/svg.image?y_{i.}" style="margin-bottom : -0.25rem"/> is the average over the values for the <img src="https://latex.codecogs.com/svg.image?i^{th}"/> perfume
* <img src="https://latex.codecogs.com/svg.image?y_{..}" style="margin-bottom : -0.25rem"/> is the average over the values and over the perfumes
* <img src="https://latex.codecogs.com/svg.image?n_{i}"/> is sample size for the <img src="https://latex.codecogs.com/svg.image?i^{th}"/> perfume

The following formula is very important as it represents a very important concept, the decomposition of the total variance into two parts, the **within** variance and the **between** variance:

<center><img src="https://latex.codecogs.com/svg.image?\sum_{i=1}^I\sum_{j=1}^{n_i}(y_{ij}-y_{..})^2=\sum_{i=1}^In_i(y_{i.}-y_{..})^2+\sum_{i=1}^I\sum_{j=1}^{n_i}(y_{ij}-y_{i.})^2," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

<center><img src="https://latex.codecogs.com/svg.image?SS_T=SS_{B}+SS_{W}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/><center>

When <img src="https://latex.codecogs.com/svg.image?n_i=r"/> (which means that you have the same number of observations _per_ perfume; the design is called a _balanced design_) the decomposition of the total variance can be written:

<center><img src="https://latex.codecogs.com/svg.image?\sum_{i=1}^I\sum_{j=1}^{r}(y_{ij}-y_{..})^2=\sum_{i=1}^Ir(y_{i.}-y_{..})^2+\sum_{i=1}^I\sum_{j=1}^{r}(y_{ij}-y_{i.})^2." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

Another very important concept is the _determination coefficient_ which corresponds to the proportion of variability that is due to your factor of interest (in our example, the *Product* factor). In other words, in that *total* variability amongst the values, it is the part due to the differences between the perfumes (*i.e.*, the *Product* factor, also called the _Product_ effect):

<center><img src="https://latex.codecogs.com/svg.image?R^2=\frac{SS_B}{SS_T}=1-\frac{SS_W}{SS_T}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

In our problem, we want to test whether there is an effect of our factor of interest or not. We are confronted to an hypothesis test (again):

* <img src="https://latex.codecogs.com/svg.image?H_0:" style="margin-bottom : -0.25rem"/> the factor has no effect on <img src="https://latex.codecogs.com/svg.image?Y"/> (there is no differences between the perfumes)
* <img src="https://latex.codecogs.com/svg.image?H_0:" style="margin-bottom : -0.25rem"/> the factor has an effect on <img src="https://latex.codecogs.com/svg.image?Y"/> (at least one perfume is different from the others)

Under the null hypothesis, when the factor has no effect, we have the following important result: 

v<img src="https://latex.codecogs.com/svg.image?\frac{\frac{SS_B}{I-1}}{\frac{SS_W}{n-I}}=\frac{MS_F}{MS_R}\sim F^{I-1}_{n-I}" style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

The numerator is the Mean Square of the factor, while the denominator is the Mean Square of the residual. The distribution under the null hypothesis is an *F* distribution with <img src="https://latex.codecogs.com/svg.image?I-1"/> degrees of freedom on the numerator and <img src="https://latex.codecogs.com/svg.image?n-I"/> degrees of freedom on the denominator.

In other words, if you want to test the effect of a factor, you have to calculate that kind of test statistic (the ratio of mean squares). For each test, you will get a *p-value*.

These results can be obtained in two steps. First, we **fit** the model with the very important `lm()` function: the output of this function is what is called a *fitted model object*. Then, we run the `anova()` function on the *fitted model object* to compute an analysis of variance table: this table is crucial as it summarizes how the total variance is decomposed according to your model.

<codeblock id="01_49">
</codeblock>

<codeblock id="01_50">
</codeblock>

</exercise>





<exercise id="9" title="From the notion of model to the analysis of variance model">

This model assumes that you can associate one mean _per_ perfume. For a given perfume, the differences amongst the values is due to a random variable that follows a normal distribution.

The model can be written the following way:

<center><img src="https://latex.codecogs.com/svg.image?Y_{ij}=\mu_i + \epsilon_{ij}," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

where <img src="https://latex.codecogs.com/svg.image?\epsilon_{ij} \sim N(0,\sigma^2)" style="margin-bottom : -0.25rem"/>, with <img src="https://latex.codecogs.com/svg.image?Cov(\epsilon_{ij},\epsilon_{i'j'})=0" style="margin-bottom : -0.25rem"/>. 

This model can also be written the following way: 

<center><img src="https://latex.codecogs.com/svg.image?Y_{ij}=\mu + \alpha_i + \epsilon_{ij}," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/>.</center>

where <img src="https://latex.codecogs.com/svg.image?\epsilon_{ij} \sim N(0,\sigma^2)" style="margin-bottom : -0.25rem"/>, with <img src="https://latex.codecogs.com/svg.image?Cov(\epsilon_{ij},\epsilon_{i'j'})=0" style="margin-bottom : -0.25rem"/>. 

In order to estimate the parameters of the model, we use the following constraint: 

<center><img src="https://latex.codecogs.com/svg.image?\sum_{i=1}^I\alpha_i=0." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

This constraint is particularly interesting as implicitly you compare the effect of the qualitative factor of interest with respect to the mean <img src="https://latex.codecogs.com/svg.image?\mu"/>.

The problem of estimation of the parameters consists in estimating <img src="https://latex.codecogs.com/svg.image?\hat{\mu}" style="margin-bottom : -0.25rem"/>, <img src="https://latex.codecogs.com/svg.image?\hat{\alpha}_i" style="margin-bottom : -0.25rem"/> such as

<center><img src="https://latex.codecogs.com/svg.image?y_{ij}= \hat{\mu} + \hat{\alpha}_i + \epsilon_{ij}," style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

that minimize <img src="https://latex.codecogs.com/svg.image?\sum e^2_{ij}" style="margin-bottom : -0.75rem"/>. Hence the name of the method used to get these estimations and which is called the least squares method.

In the case where the number of observations is the same from one condition to the other (here, from one perfume to the other), the estimations of the parameters with the least squares method are very simple and natural:

1. <img src="https://latex.codecogs.com/svg.image?\hat{\mu}=y_{..}" style="margin-bottom : -0.25rem"/>
2. <img src="https://latex.codecogs.com/svg.image?\hat{\alpha}_i = y_{i.}-y_{..}" style="margin-bottom : -0.25rem"/>

Of course, as mentioned previously, as we want to see whether there's an effect of the factor on a continuous variable <img src="https://latex.codecogs.com/svg.image?Y"/> and for which modality(ies) of the factor there's a difference with respect to the mean, we're going to test <img src="https://latex.codecogs.com/svg.image?\alpha_i" style="margin-bottom : -0.25rem"/> with respect to 0. As always, to assess the veracity of an hypothesis, in our case whether <img src="https://latex.codecogs.com/svg.image?\alpha_i=0" style="margin-bottom : -0.25rem"/> or not, for a given <img src="https://latex.codecogs.com/svg.image?i"/>, we need the variance or the test statistic <img src="https://latex.codecogs.com/svg.image?\sigma^2_{\hat{\alpha}_i}" style="margin-bottom : -0.25rem"/>. When the design is balanced:

<center><img src="https://latex.codecogs.com/svg.image?Var(\hat{\alpha}_i)=\sigma^2_{\hat{\alpha}_i} = \frac{I-1}{I}\frac{\sigma^2}{r}."  style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

To estimate <img src="https://latex.codecogs.com/svg.image?\sigma^2"/> we're going to use as an estimator:

<center><img src="https://latex.codecogs.com/svg.image?\hat{\sigma}^2=\frac{\sum_{i}\sum_{j}(y_{ij}-y_{i.})^2}{n-I}=\frac{\sum_{i}\sum_{j}e^2_{ij}}{n-I}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

Indeed, 

<center><img src="https://latex.codecogs.com/svg.image?\hat{y}_{ij} = \hat{\mu} + \hat{\alpha}_i," style="*margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

and

<center><img src="https://latex.codecogs.com/svg.image?e_{ij}=y_{ij} -\hat{y}_{ij}." style="margin-top : -1.25rem; margin-bottom : 1.25rem"/></center>

## Exercise

* Install the **FactoMineR** package. 
* Load the **FactoMineR** package with the `library()` function.
* Take a look at the `AovSum()` function of the **FactoMineR** package (`?AovSum`).
* With the model that you have written, run the `AovSum` function and put the results of this function in an R object called `res`.
* Apply the `names()` function to `res`. What are the results of this function?
* Look at the component `res$Ftest`. Concerning the products, what would you say in terms of Floral?
* Look at the component `res$Ttest`. Which one of the products is the most Floral?
* Write another model that will allow you to integrate the fact that subject may eventually behave differently.
* Perform the analysis of variance that corresponds to that new model. Provide an interpretation of the results.

<codeblock id="01_57">
</codeblock>

## The `SensoMineR` corner:

Let's now apply the `decat()` function that will help us understanding the products according to the sensory descriptors. In the following code you can see how to run the function and how you can save the outputs in a list that you can name whatever you want: in this example, the outputs are saved in an object named *resdecat* (it could have been called *bob_the_sponge*); literally *resdecat* is equal to the outputs produced by the `decat()` function when applied to the *experts* data.

<codeblock id="01_51">
</codeblock>

As mentioned previously, *resdecat* is a list of results. As a list, you can have access to its different components by using the `names()` function, that provides the name of each component of your output.

<codeblock id="01_52">

</codeblock>

To access to one of the component, just write the name of the output associated with the name of the component: the association is done with the *$* sign.

<codeblock id="01_53">
</codeblock>

As a matter of fact, *resdecat$resT* is also constituted of smaller results. Let's identify them with the **names** function (again)

<codeblock id="01_54">
</codeblock>

It appears that the `decat()` function provides a sensory description of each product. For instance, if you write the following code in the R console, you will get a description of the product *Angel*.

<codeblock id="01_55">
</codeblock>

According to the coefficients of the first column, this product has been perceived as significantly higher regarding the descriptors *Greedy*, *Heady*,..., and significantly lower regarding the descriptors *Floral*, *Fruity*,...

**Recap. **What have we done so far? and, what should you know? You should know how to install R, to install packages, to look at the information that is necessary to run some functions. Once the analysis is made, you usually get an output which is either a graphical output, or results from some calculations. These numerical results can be displayed in the console, by typing the name of the result of interest. Please, keep in mind the concept of list.

</exercise>

