---
title: 'Chapter 2: Dealing with qualitative perception'
description: This chapter deals with categorical variables. We introduce the notions of bar plot, of contingency table, of independence.
prev: /chapter1
next: /chapter3
type: chapter
id: 2
---

<style>
.accordion > input[type="checkbox"] {
  position: absolute;
  left: -100vw;
}
.accordion .content {
  overflow-y: hidden;
  height: 0;
  transition: height 0.3s ease;
}
.accordion > input[type="checkbox"]:checked ~ .content {
  height: auto;
  overflow: visible;
}
.accordion label {
  display: block;
}
body {
  font: 16px/1.5em "Overpass", "Open Sans", Helvetica, sans-serif;
  color: #333;
  font-weight: 300;
  
}
.accordion {
  margin-bottom: 1em;
}
.accordion > input[type="checkbox"]:checked ~ .content {
  padding: 15px;
  border: 1px solid #e8e8e8;
  border-top: 0;
}
.accordion .handle {
  margin: 0;
  font-size: 1.0em;
  line-height: 1.2em;
}
.accordion label {
  color: #FFFDF9;
  cursor: pointer;
  font-weight: normal;
  padding: 15px;
  background:#61B4DD;
  border-radius:15px;
}
.accordion label:hover,
.accordion label:focus {
  background: #4E92B2;
}


body {
  padding: 40px;
}
a {
  color: #06c;
}
p {
  margin: 0 0 1em;
}
h1 {
  margin: 0 0 1.5em;
  font-weight: 600;
  font-size: 1.5em;
}
.accordion {
  max-width: 65em;
}
.accordion p:last-child {
  margin-bottom: 0;
}
hr
{
border:solid 1px black;
width: 96%;
color: #FFFF00;
height: 1px;
}
</style>

<exercise id="1" title="From classes to categories and vice-versa">

By definition, a class is a set or category of things having some property or attribute in common. In the same way, a category is a class of people or things regarded as having particular shared characteristics. 

In this chapter, the notion of categories is first introduced using a survey in which 135 participants were asked about their perception of genetically modified organisms (GMO):

* Do you feel implicated in the debate about GMO (a lot, to a certain extent, a little, not at all)?

* What is your view of GMO cultivation in France (very favourable, favourable, somewhat against, totally opposed)?

* What do you think of the inclusion of GM raw materials in products for human consumption (very favourable, favourable, somewhat against, totally opposed)?

* What do you think of the inclusion of GM raw materials in products to be fed to animals (very favourable, favourable, somewhat against, totally opposed)?

* Have you ever taken part in an anti-GMO protest (Yes/No)?

* Do you think the media communicate enough information about GMO (Yes/No)?

* Do you take it upon yourself to find out more information about GMO (Yes/No)?

* Do you think that GMO might enable us to reduce the use of fungicides (Yes/No)?

* Do you think that GMO might enable us to reduce the problems of hunger in the world (Yes/No)?

* Do you think that the use of GMO might help to improve farmers' lives (Yes/No)?

* Do you think that GMO might lead to future scientific advances (Yes/No)?

* Do you think that GMO represent a danger to our health (Yes/No)?

* Do you think that GMO represent a possible danger to the environment (Yes/No)?

* Do you think that GMO represent a financial risk for farmers (Yes/No)?

* Do you think that GMO are a useless scientific practice (Yes/No)?

* Do you think our grandparents' generation had a healthier diet than us (Yes/No)?

The same people were also asked about the five following descriptive variables:

* Sex (male, female)

* Professional status (farmer, student, manual labourer, senior management, civil servant, accredited professional, technician, retailer, other profession, unemployed, retired)

* Age (--25 years, 25--40 years, 40--60 years, +60 years)

* Is your profession or education in any way linked to agriculture, the food industry or the pharmaceutical industry (Yes/No)?

* Which political movement do you most adhere to (extreme left, green, left, liberal, right, extreme right)?

Intuitively, it is easy to understand that each question, individually, defines categories of people through the response modalities chosen.

Import the data in an R object named *GMO*, then apply the `summary()` function to the *GMO* object.

<codeblock id="02_01">
</codeblock>

As shown above, data are considered as *characters* and should be encoded as factors.
Apply the `ncol()` function to *GMO* to get its number of columns. Use this information to encode the columns as factors, iteratively; then, check that the *GMO* data frame is ready to be analyzed.

<codeblock id="02_02">
ncol(GMO) returns the number of columns of GMO
</codeblock>

## The *R* corner: when categories have to be re-ordered

</exercise>

<exercise id="2" title="From categories to categorical data and their representation">

The output of the `summary()` function is interesting: it illustrates perfectly the notion of class or category. For the question *What do you think of the inclusion of GM raw materials in products to be fed to animals?*, we can see that the 135 participants of the survey are divided into 4 classes or categories: 44 are totally opposed, 39 are somewhat against, 44 are favourable, and 8 are very favourable. Practically, we want to represent the way these participants are distributed (or divided) into these 4 classes (categories or response modalities) that define a *categorical variable* (or *qualitative variable*).

To do so, we are going to extract this information, to re-order it and to represent it graphically.

<codeblock id="02_031">
</codeblock>

This can also be done using the very important function `table()`.

<codeblock id="02_032">
</codeblock>

Let's enhance the output by adding a title and some colors *(https://r-charts.com/colors/)*.

<codeblock id="02_033">
</codeblock>

If you want to represent the relative frequency, you can do that using the very important function `prop.table()`.

<codeblock id="02_034">
</codeblock>


## The *R* corner: *ggplot2* an alternative to base R
<br>

Let's represent a categorical variable with the *ggplot2* package. It can be done in several ways.

<codeblock id="02_035">
</codeblock>

From the data frame directly. Be careful at the levels order. You can change them using the `factor()` function and the *levels* argument.

<codeblock id="02_036">
</codeblock>

</exercise>

<exercise id="3" title="From categorical data to contingency table">

Who are those people who are favourable to the inclusion of GM raw materials in products to be fed to animals? Are they characterized by their political party for instance?

To answer this question we will cross these two variables and build a *contingency table* using the very important `table()` function.

<codeblock id="02_03">
</codeblock>

Re-order the *Political Party* variable from "Extreme left" to "Right".

<codeblock id="02_03bis">
</codeblock>

Those people who are favourable to the inclusion of GM raw materials in products to be fed to animals, how are they distributed within the political parties?

<codeblock id="02_04">
</codeblock>

It seems that the data are structured, which means that there's a link between the two variables *Position.Al.A* and *Political.Party*. In other words, some classes from the *Position.Al.A* variable seem to be associated in a singular way with classes from the *Political.Party* variable.

Concretely, only individuals who vote *Liberal* and *Right* are very favourable to the inclusion of GM raw materials in products to be fed to animals. 

</exercise>

<exercise id="4" title="From contingency table to the notion of independence">

## The *Stat* corner: breaking a *structure* by resampling
<br>

The idea is to mix or re-sample the data collected for the *Position.Al.A* variable: this new information is stored in  a new column called *Position.Al.A.break*.

<codeblock id="02_05">
</codeblock>

<codeblock id="02_06">
</codeblock>

In this example, the structure seems broken, which means that there's no particular link between the two variables *Position.Al.A.break* and *Political.Party*. In other words, classes from the *Position.Al.A.break* variable don't seem to be associated in a singular way with classes from the *Political.Party* variable.

Concretely, for this broken structure, if you are very favourable to the inclusion of GM raw materials in products to be fed to animals, you might vote from "Extreme Left" to "Right" unconditionally.

</exercise>

<exercise id="5" title="From the independence to its deviation">

Two events are independent if the occurrence of one does not affect the probability of occurrence of the other. More formally, two events A and B are independent if and only if their joint probability equals the product of their probabilities:

<center><img src="https://latex.codecogs.com/svg.image?\mathcal{P}(A\cap B)=\mathcal{P}(A)\mathcal{P}(B)" style="margin-top : 0rem; margin-bottom : 0rem"/></center>

In the following code, we're using an important function for building contingency table: the `as.data.frame.matrix()` (https://www.r-bloggers.com/2012/03/how-to-convert-contingency-tables-to-data-frames-with-r/).

<codeblock id="02_07">
</codeblock>

Hence, two qualitative variables are independent when we have the relation :

<img src="https://latex.codecogs.com/svg.image?f_{ij}=f_{i\cdot}\cdot f_{\cdot j}" style="margin-bottom : -0.25rem"/>


The mutual probability only depends of marginal numbers.

First, we construct the table of reference, *i.e.*: a table with the product <img src="https://latex.codecogs.com/svg.image?f_{i\cdot}\cdot f_{\cdot j}" style="margin-bottom : -0.35rem"/> in each cells. 

We have <img src="https://latex.codecogs.com/svg.image?f_{\cdot j}=\dfrac{1}{n}\sum\limits_{j\in J}n_{ij}" style="margin-bottom : -1.95rem"/> and <img src="https://latex.codecogs.com/svg.image?f_{i\cdot}=\dfrac{1}{n}\sum\limits_{i\in I}n_{ij}" style="margin-bottom : -1.95rem"/>




<codeblock id="02_08">
</codeblock>

<codeblock id="02_09">
</codeblock>


<codeblock id="02_10">
</codeblock>

<codeblock id="02_11">
</codeblock>

<codeblock id="02_12">
</codeblock>

<codeblock id="02_13">
</codeblock>

</exercise>

<exercise id="6" title="From the notion of deviation to the notion of inertia">
</exercise>

<exercise id="7" title="From the notion of inertia to Correspondence Analysis">

<codeblock id="02_14">
</codeblock>

<codeblock id="02_15">
</codeblock>

</exercise>

<exercise id="8" title="From Correspondence Analysis to Multiple Correspondence Analysis">

<codeblock id="02_16">
</codeblock>

</exercise>

<exercise id="9" title="Case study: the Beards example with CA">

<codeblock id="02_17">
</codeblock>

<codeblock id="02_18">
</codeblock>

<codeblock id="02_19">
</codeblock>

<codeblock id="02_20">
</codeblock>

<codeblock id="02_21">
</codeblock>

<codeblock id="02_22">
</codeblock>

</exercise>

<exercise id="10" title="Case study: the sorting task with MCA">