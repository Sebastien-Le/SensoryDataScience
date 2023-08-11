---
title: 'Chapter 2: Dealing with qualitative perception'
description: This chapter deals with categorical variables. We introduce the notions of bar plot, of contingency table, of independence, the magic of Correspondence Analysis...
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

<style>
.accordion2 > input[type="checkbox"] {
  position: absolute;
  left: -100vw;
}
.accordion2 .content {
  overflow-y: hidden;
  height: 0;
  transition: height 0.3s ease;
}
.accordion2 > input[type="checkbox"]:checked ~ .content {
  height: auto;
  overflow: visible;
}
.accordion2 label {
  display: block;
}
body {
  font: 16px/1.5em "Overpass", "Open Sans", Helvetica, sans-serif;
  color: #333;
  font-weight: 300;
  
}
.accordion2 {
  margin-bottom: 1em;
}
.accordion2 > input[type="checkbox"]:checked ~ .content {
  padding: 15px;
  border: 0px solid #e8e8e8;
  border-top: 0;
}
.accordion2 .handle {
  margin: 0;
  font-size: 1.0em;
  line-height: 1.2em;
}
.accordion2 label {
  color: #FFFDF9;
  cursor: pointer;
  font-weight: normal;
  padding: 15px;
  background: #f8ac00;
  border-radius:15px;
}
.accordion2 label:hover,
.accordion2 label:focus {
  background: #e49e00;
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
.accordion2 {
  max-width: 65em;
}
.accordion2 p:last-child {
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

Intuitively, it is easy to understand that each question, individually, defines categories of participants through the response modalities they have chosen.

Let's now have a look at our data. Import the data in an R object named *GMO*, then apply the `summary()` function to the *GMO* object.

<codeblock id="02_01">
</codeblock>

As shown above, data are considered as *characters* and should be encoded as factors.
Apply the `ncol()` function to *GMO* to get its number of columns. Use this information to encode the columns as factors, iteratively; then, check that the *GMO* data frame is ready to be analyzed.

<codeblock id="02_02">
ncol(GMO) returns the number of columns of GMO
</codeblock>

The output of the `summary()` function is interesting: it illustrates perfectly the notion of class or category. For the question *"What do you think of the inclusion of GM raw materials in products to be fed to animals?"*, we can see that the 135 participants of the survey are divided into 4 classes or categories: 44 are totally opposed, 39 are somewhat against, 44 are favourable, and 8 are very favourable.

</exercise>

<exercise id="2" title="From categories to categorical data and their representation">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec2">
</codeblock>
  </div>
</section>
</HTML>

As explained previously, for a given question, the different *response modalities* define classes or categories of participants. Practically, we want to represent the way these participants are distributed into these classes. The graphical representation of a categorical variable is often done through a bar plot: one bar per category with a height proportional to the numeric value associated with the category.

Let's have a look at the *Position.H.Food* variable, and let's represent its distribution. To do so, extract the distribution information with the `summary()` function and visualize it with the `barplot()` function.

<codeblock id="02_031">
</codeblock>

By default, the levels of a categorical are sorted in an alphabetical order. In our case, the *Position.H.Food* variable is an *ordered categorical variable*, a categorical variable with a quantitative dimension that can be ordered. For a better understanding of the data, this relation order between the categories should be kept.

To do so, we are using the `c()` function to temporarily re-order the levels.

<codeblock id="02_031b">
</codeblock>

## The *R* corner: when categories have to be *re-ordered*
<br>

There's a trick for re-ordering the levels of a categorical variable. 

Check the levels of the categorical variable *Position.Culture*. Re-order these levels in a more *natural* way, by using the `factor()` function, combined with the `levels()` function. Check again the levels of the variable *Position.Culture*

<codeblock id="02_021">
</codeblock>

Extracting the distribution information can also be done using the very important function `table()`. This function will be used soon when dealing with two categorical variables.

<codeblock id="02_032">
</codeblock>

Let's enhance the visualization by adding a title and some colors *(https://r-charts.com/colors/)*.

<codeblock id="02_033">
</codeblock>

To represent the distribution in terms of percentages, use the very important function `prop.table()`.

<codeblock id="02_034">
</codeblock>


## The *R* corner: *ggplot2* an alternative to base R
<br>

Let's represent a categorical variable with the `ggplot2` package. While the `barplot()` uses a vector containing the distribution information, the `ggplot()`  function requires to create a data frame. 

<codeblock id="02_035">
</codeblock>

The `data.frame()` function has generated two variables (*Var1* and *Freq*). Associate the x-axis with the categories and the y-axis with the number of occurrences.

<codeblock id="02_035b">
</codeblock>

Raw data (*MGO*) can be used directly. Associate the x-axis with the categories and set the `stat` to `"count"` (this argument was set previously to `"identity"`, but with the distribution as input).

<codeblock id="02_036">
</codeblock>

</exercise>

<exercise id="3" title="From categorical data to contingency table">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec3">
</codeblock>
  </div>
</section>
</HTML>

Who are those people who are favourable to the inclusion of GM raw materials in products to be fed to animals? Are they characterized by their political party for instance?

To answer this question cross these two variables and build a *contingency table* using the very important `table()` function; before that re-order the *Position.A.Food* variable, as well as the *Political.Party* variable from "Extreme left" to "Right".

<codeblock id="02_03">
</codeblock>

## The *Stat* corner: some very important notations
<br>

A contingency table is a very important object in statistics. It is interesting to present it in a formal way by introducing some notations. Let <img src="https://latex.codecogs.com/svg.image?i" style="margin-top : 0rem; margin-bottom : 0rem"/> be the index of the rows, <img src="https://latex.codecogs.com/svg.image?j" style="margin-top : 0rem; margin-bottom : -0.4rem"/> be the index of the columns: <img src="https://latex.codecogs.com/svg.image?n_{ij}" style="margin-top : 0rem; margin-bottom : -0.4rem"/> is the contingent of individuals that belong to both categories <img src="https://latex.codecogs.com/svg.image?i" style="margin-top : 0rem; margin-bottom : 0rem"/> and <img src="https://latex.codecogs.com/svg.image?j" style="margin-top : 0rem; margin-bottom : -0.4rem"/>; <img src="https://latex.codecogs.com/svg.image?n" style="margin-top : 0rem; margin-bottom : 0rem"/> is the total number of individuals, 

<center>
<img src="https://latex.codecogs.com/svg.image?n = \sum_i n_{i.} = \sum_j n_{.j} = \sum_i \sum_j n_{ij}," style="margin-top : 0rem; margin-bottom : -0.5rem"/>
<center>

where <img src="https://latex.codecogs.com/svg.image?n_{i.}" style="margin-top : 1rem; margin-bottom : -0.2rem"/> is the contingent of individuals in the category <img src="https://latex.codecogs.com/svg.image?i" style="margin-top : 1rem; margin-bottom : 0rem"/>.

Now let's ask ourselves an important practical question: those people who are favourable to the inclusion of GM raw materials in products to be fed to animals, how are they distributed within the political parties? 

To answer this question, set the `fill` argument to the name of the variable of interest.

<codeblock id="02_04a">
</codeblock>

Notice that raw data have been used with the very important `..count..` value.

Set the `position` argument to `"dodge"` for an alternative visualization.

<codeblock id="02_04">
</codeblock>

It seems that the data are *structured*, which means that there's a link between the two variables *Position.A.Food* and *Political.Party*. In other words, some classes from the *Position.A.Food* variable seem to be associated in a singular way with classes from the *Political.Party* variable.

Concretely, participants of the survey who are very favourable to the inclusion of GM raw materials in products to be fed to animal are voting either *Liberal* or *Right*.

</exercise>

<exercise id="4" title="From contingency table to the notion of independence">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec4">
</codeblock>
  </div>
</section>
</HTML>

What happens when data are not structured and when there's no apparent link between two categorical variables?

## The *Stat* corner: breaking a *structure* by resampling
<br>

To understand what is an absence of structure we will disturb the data. The idea is to mix or resample the data collected for the *Position.A.Food* variable: this new information is stored in a new column called *Position.A.Food.Permuted*.

Create a vector of dimension 135 in which the positions of the participants have been permuted.

<codeblock id="02_05a">
</codeblock>

Create a vector of dimension 135 in which the values of the participants have been permuted.

<codeblock id="02_05">
</codeblock>

Visualize the relation between the two variables *Position.A.Food.Permuted* and *Political.Party*.

<codeblock id="02_06">
</codeblock>

In this example, the structure seems broken, which means that there's no particular link between the two variables *Position.A.Food.Permuted* and *Political.Party*. In other words, classes from the *Position.A.Food.Permuted* variable don't seem to be associated in a singular way with classes from the *Political.Party* variable.

Concretely, for this broken structure, if you are very favourable to the inclusion of GM raw materials in products to be fed to animals, you might vote from "Extreme left" to "Right" unconditionally. This leads us to the notion of independence.

Two events are independent if the occurrence of one does not affect the probability of occurrence of the other. More formally, two events A and B are independent if and only if their joint probability equals the product of their probabilities:

<center><img src="https://latex.codecogs.com/svg.image?\mathcal{P}(A\cap B)=\mathcal{P}(A)\times\mathcal{P}(B)." style="margin-top : 0rem; margin-bottom : 0rem"/></center>

In the following part, we are going to compare <img src="https://latex.codecogs.com/svg.image?\mathcal{P}(A\cap B)" style="margin-top : 1rem; margin-bottom : -0.5rem"/> to  <img src="https://latex.codecogs.com/svg.image?\mathcal{P}(A)\times\mathcal{P}(B)" style="margin-top : 1rem; margin-bottom : -0.5rem"/>, from what have been observed, *i.e.* from the data.

Build a contingency table crossing the two variables *Position.A.Food* and *Political.Party* with the `table()` function. From this contingency table, calculate the marginal probabilities for each variable with the `apply()` and `sum()` functions. Then, from the definition of two independent events, build the probabilities matrix of the joint distribution of *Position.A.Food* and *Political.Party*, under the hypothesis of independence.

<codeblock id="02_07">
</codeblock>

The output `res.table` from the `table()` function can be seen as a matrix <img src="https://latex.codecogs.com/svg.image?(n_{ij})" style="margin-bottom : -0.25rem"/>.

The marginal probabilities for each variable can be defined as :

<center><img src="https://latex.codecogs.com/svg.image?f_{i\cdot}=\dfrac{1}{n}\sum\limits_{i\in I}n_{ij}" style="margin-bottom : -1.95rem"/> and
<img src="https://latex.codecogs.com/svg.image?f_{\cdot j}=\dfrac{1}{n}\sum\limits_{j\in J}n_{ij}," style="margin-bottom : -1.95rem"/></center>

where <img src="https://latex.codecogs.com/svg.image?n=\sum\limits_{i\in I}\sum\limits_{j\in J} n_{ij}." style="margin-bottom : -2.15rem"/>

<br>

When the variables are independent:

<center><img src="https://latex.codecogs.com/svg.image?f_{ij}=f_{i\cdot} \times f_{\cdot j}." style="margin-bottom : 0.5rem"/></center>

</exercise>

<exercise id="5" title="From the independence to its deviation">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec5">
</codeblock>
  </div>
</section>
</HTML>

Beyond the formulas, it is important to understand visually *how far* data can be from the independence, in other words how your data deviate from the independence.

Represent the distribution of the participants according to the two variables *Position.A.Food* and *Political.Party*. Consider 3 situations, the theoretical situation when the two variables are independent (in the sense of the definition above), the artifactual situation when the answers to the *Position.A.Food* are permuted, and finally the observed situation with the data collected. For these representations, use the `barplot()` function, as well as the `legend()` function.

Choose the proper data to visualize the first situation.

<codeblock id="02_08">
Use Joint.independence
</codeblock>

Choose the proper data to visualize the second situation.

<codeblock id="02_08b">
Remember that data have been permuted
</codeblock>

Choose the proper data to visualize the third situation.

<codeblock id="02_08c">
</codeblock>

Obviously, the artifactual situation is not far from the independence situation. This result was expected as data were permuted which leads to a lack of structure in the data. The observed situation is quite far from both theoretical and artifactual situations. This result was expected due to the strong structure in the data, particularly between the two variables *Position.A.Food* and *Political.Party*.

## The *Stat* corner: the *Chi-square* test
<br>

The notion of deviation to the independence situation is the core of the Chi-square test. This test is designed to evaluate the dependence between two categorical variables. It calculates a distance between what has been observed and the situation of independence.

Use the `chisq.test()` function to test whether the two categorical variables *Political.Party* and *Position.A.Food* are independent.

<codeblock id="02_13">
</codeblock>

What is the value of the Chi-square distance between these two variables?

<choice id=1>
<opt text="0.0002428">
Try again
</opt>
<opt text="36.777" correct="true">
Good job
</opt>
<opt text="12">
Try again
</opt>
</choice>

The Chi-square distance represents the distance from the independence situation. The *p-value* is the probability to observe such a distance (in our case such a *high* distance) under the hypothesis of independence. In our case, observing such a distance is really really rare when the data are independent: in other words, it seems that data are really dependent.

</exercise>

<exercise id="6" title="From the notion of deviation to the notion of distance">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec5">
</codeblock>
  </div>
</section>
</HTML>

This drift or deviation from the independence can be formalized in relation to a natural comparison point, starting from the definition of independence. The equation <img src="https://latex.codecogs.com/svg.image?f_{ij}=f_{i\cdot} \times f_{\cdot j}" style="margin-top : 1rem; margin-bottom : -0.5rem"/> can also be written:


<center><img src="https://latex.codecogs.com/svg.image?\dfrac{f_{ij}}{f_{i\cdot}\times f_{\cdot j}}-1=0." style="margin-top : -1rem; margin-bottom : 0rem"/><center>

In the following, we will see how to interpret this value in relation to its sign.

Calculate the matrix that corresponds to this new formulation of the independence model.

<codeblock id="02_10">  
</codeblock>

For this matrix, positive numbers correspond to a positive dependency (association) between two categories, as illustrated by the number 1.95 for the two categories *Right* and *Very Favourable*; similarly, negative numbers correspond to a negative dependency (incompatibility) between two categories, as illustrated by the number -1 for the two categories *Extreme left* and *Very Favourable*.

The deviation matrix defines multivariate profiles as vectors of <img src="https://latex.codecogs.com/svg.image?R^J" style="margin-top : -1rem; margin-bottom : 0rem"/> for the rows, and <img src="https://latex.codecogs.com/svg.image?R^I" style="margin-top : -1rem; margin-bottom : 0rem"/> for the columns. These profiles can be directly interpreted in terms of difference from the independence model. Hence the idea of calculating a distance between two rows or two columns. In our example, we expect the two categories *Extreme left* and *Left* to be quite close and the two categories *Extreme left* and *Right* to be quite distant.

Naturally, if you had to compare two political parties in terms of difference from the independence model, you would calculate a distance based on the differences regarding the levels of the variable *Position.A.Food*. As the different levels of *Position.A.Food* have a different weight relative to each other, you would naturally take that information into account, and calculate a distance weighted by the relative importance of each level. In other words, we're going to consider the following distance between two political parties <img src="https://latex.codecogs.com/svg.image?i" style="margin-top : -1rem; margin-bottom : 0rem"/> and <img src="https://latex.codecogs.com/svg.image?i'" style="margin-top : -1rem; margin-bottom : 0rem"/>:

<center>
<img src="https://latex.codecogs.com/svg.image?d^2(i,i') = \sum\limits_{j\in J}f_{\cdot j}((\dfrac{f_{ij}}{f_{i\cdot}\times f_{\cdot j}})-(\dfrac{f_{i'j}}{f_{i'\cdot}\times f_{\cdot j}}))^2" style="margin-top : -1rem; margin-bottom : 0rem"/>
<center>

Actually, it's quite easy to demonstrate that this distance is equivalent to:

<center>
<img src="https://latex.codecogs.com/svg.image?d^2(i,i') = \sum\limits_{j\in J}\dfrac{n}{n_{\cdot j}}(\dfrac{n_{ij}}{n_{i\cdot}}-\dfrac{n_{i'j}}{n_{i'\cdot}})^2" style="margin-top : 0rem; margin-bottom : 0rem"/>
<center>

Calculate the distance matrix between row-profiles, *i.e.* the political parties.

<codeblock id="02_11">
</codeblock>

As expected, this distance matrix is diagonal; as expected also, the categories *Extreme left* and *Left* are close from each other, and are both far from the category *Right*.

Visualize this distance matrix with the `heatmap()` function, with colors corresponding to the values in the matrix.

<codeblock id="02_12">
</codeblock>

</exercise>

<exercise id="7" title="From the notion of distance to the notion of inertia">

With a distance and a system of masses, we can now focus on the very important concept of inertia. By definition, the inertia of our Political parties is obtained by the following calculation:

<center>
<img src="https://latex.codecogs.com/svg.image?I(N_{I}) = \sum\limits_{i\in I} f_{i\cdot}\times d^2(i,O)," style="margin-top : 0rem; margin-bottom : 0rem"/>
<center>

where <img src="https://latex.codecogs.com/svg.image?I(N_{I})" style="margin-top : 0rem; margin-bottom : -0.3rem"/> is the inertia of the system of rows, <img src="https://latex.codecogs.com/svg.image?N_{I}" style="margin-top : 0rem; margin-bottom : -0.3rem"/> denotes the scatter plot of the rows
in the <img src="https://latex.codecogs.com/svg.image?R^J" style="margin-top : 0rem; margin-bottom : 0rem"/> space, and <img src="https://latex.codecogs.com/svg.image?O" style="margin-top : 0rem; margin-bottom : 0rem"/> denotes the center of gravity of <img src="https://latex.codecogs.com/svg.image?N_{I}" style="margin-top : 0rem; margin-bottom : -0.2rem"/>. One can easily show that the inertia is equal to the Chi-square distance divided by the number of individuals.

Hence the name of the distance between two row profiles which is called the Chi-square distance.

</exercise>

<exercise id="8" title="From the notion of inertia to Correspondence Analysis">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec5">
</codeblock>
  </div>
</section>
</HTML>

The multidimensional analysis of the deviation matrix (or discrepancy matrix) consists in finding the dimensions that maximize the inertia of the orthogonal projection of the rows (on these dimensions). In other words, these are the dimensions for which the categories of the variable *Political.Party* and the categories of the variable *Position.A.Food* are the most dependent: these are the dimensions for which the correspondence (the association) between the categories of the variable *Political.Party* and the categories of the variable *Position.A.Food* are the highest.

These dimensions are obtained by applying the so-called Correspondence Analysis (CA) on the contingency table. Correspondence Analysis is the multidimensional method dedicated to the analysis of the dependence between two categorical variables, from the point of view of their categories. In other words, CA is dedicated to the analysis of the correspondence between the categories of one categorical variable and the categories of another one.

To apply this method, use the `CA()` function of the `FactoMineR` package, then use the `plot.CA()` function in order to represent the rows of the contingency table.

<codeblock id="02_14">
</codeblock>

Use the `plot.CA()` function in order to represent the columns of the contingency table.

<codeblock id="02_15">
</codeblock>

Have a look at the numerical indicators.

<codeblock id="02_15b">
</codeblock>

Display the eigenvalues, sum them and multiply the value of the sum by the number of individuals.

<codeblock id="02_15c">
</codeblock>

## The *R* corner: the *descfreq()* function...a must have
<br>

Use the *descfreq()* function of the `FactoMineR` package to get an automatic description of the rows of the object `res.table`.
  
<codeblock id="02_15d">
</codeblock>

Display the description of the political party associated with the category *Right*. Try with the political party of your choice.

<codeblock id="02_15e">
</codeblock>

</exercise>

<exercise id="9" title="From Correspondence Analysis to Multiple Correspondence Analysis">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec9">
</codeblock>
  </div>
</section>
</HTML>

Multiple Correspondence Analysis (MCA) is an extension of Correspondence Analysis (CA) that allows for the analysis of the relationships among more than two categorical variables simultaneously. This method can also be seen as a PCA on categorical variables. Indeed, the datasets analysed in PCA and MCA are similar, with individuals in rows and variables in columns, continuous variables in the case of PCA and categorical variables in the case of MCA.

MCA is a useful technique in data exploration and visualization when working with complex categorical data with multiple variables. It helps to identify patterns and associations between the different categorical variables, as well as the relationships among the categories within each variable.

To apply this method, use the `MCA()` function of the `FactoMineR` package, then use the `plot.MCA()` function in order to represent the rows of the dataset.

Before using the `MCA()` function, a crucial question needs to be addressed: which variables should be used to differentiate individuals? In this example, the goal is to classify individuals based on their opinions on genetically modified organisms (GMOs). Therefore, to distinguish between two individuals, variables associated with GMOs will be used. To calculate the distance between individuals, the first 16 variables of the dataset are utilised.

The `MCA()` function facilitates the distinction between variables used in calculating the distance between individuals, *i.e.* active variables and other variables referred to as illustrative or supplementary variables. To classify the variables, the arguments *quanti.sup* and *quali.sup* are employed, each indicating the columns of supplementary quantitative or qualitative variables. By default, any remaining variables are considered to be active variables.

<codeblock id="02_037">
</codeblock>

Multiple correspondence analysis is highly sensitive to rare modalities, leading to greater distance between individuals who possess them and those who do not. The `MCA()` function includes a crucial argument, namely the `level.ventil` argument. Set this argument to 0.05: individuals who have chosen rare modalities, taken by less than 5% of individuals, are randomly assigned another modality.

<codeblock id="02_038">
</codeblock>

Use the `plot.MCA()` function in order to represent the results from MCA.

<codeblock id="02_039">
</codeblock>

As you can see, the graph is overloaded. It shows the individuals in black, the modalities associated with the active variables in red and the supplementary variables in green. It is possible to represent only one type of object by making the others invisible using the `invisible` argument. If you set the argument to `"var"` then the modalities associated with the active variables will not be represented. If you set the argument to `"quali.sup"` then the modalities associated with the supplementary variables will not be represented.

<codeblock id="02_040">
</codeblock>

If you set the argument to `"quali.sup"` then the modalities associated with the supplementary variables will not be represented.

<codeblock id="02_041">
</codeblock>

By playing with the `label` argument, represent individuals without their identifier.

<codeblock id="02_042">
</codeblock>

Represent the modalities associated with the supplementary variables. Comment and interpret this graphical output.

<codeblock id="02_043">
</codeblock>

To comprehend the structure of variability between individuals induced by the distance based on GMO variables, use the `dimdesc()` function to gain a better understanding of the dimensions derived from the MCA. This function is applied to the results of the MCA directly.

<codeblock id="02_044">
</codeblock>

Interpret the first dimension using the code provided below. Start by identifying the modalities that are associated with the supplementary variables. These modalities are particularly interesting because they did not intervene in the distance between individuals and therefore did not participate in the construction of the dimensions.

<codeblock id="02_045">
</codeblock>

In the case of questionnaire data, it is common to want to obtain a typology of respondents. This can easily be done using an unsupervised classification based on the factorial coordinates from the MCA. This classification can easily be done using the `HCPC()` function. Note that by default, the number of factorial coordinates saved by the `MCA()` function is equal to 5. It is possible to carry out the typology on a larger number of factorial coordinates: this is done using the `ncp` argument of the `MCA()` function.

<codeblock id="02_046">
</codeblock>

As indicated by the code, the `HCPC()` function can automatically determine an optimal number of clusters. To achieve this, the `nb.clust` argument should be set to -1. Now that we have clusters of respondents who share a common perception of GMOs, we can explore how these clusters can be nterpreted: let's examine the numerical indicators provided by the `HCPC()` function.

<codeblock id="02_047">
</codeblock>

The function provides two particularly important outputs: the original dataset, *i.e.* the one analyzed by the MCA, to which the cluster variable derived from the hierarchical clustering on the MCA components has been added (`$data.clust`); the automatic description of the cluster variable (`$desc.var`).

To obtain the distribution of the cluster variable, simply apply the `summary()` function to the appropriate dataset.

<codeblock id="02_048">
</codeblock>

You can now proceed to review the description of the clusters and interpret them.

<codeblock id="02_049">
</codeblock>


## The *R* corner: the *catdes()* function...a must have
<br>

The `catdes()` function is one of the most important in the `FactoMineR` package. It enables the automatic description of a qualitative variable using the other variables in the dataset, whether they are quantitative or qualitative.

We will apply this function to two variables of interest. First, the political party variable. This will enable us to have a description of political parties based on their stance towards GMOs.

<codeblock id="02_050">
</codeblock>

Display the description of the political party associated with the category *Right*. Try with the political party of your choice.

Second, the cluster variable, which will provide an automatic description of the cluster variable obtained from the HCPC function.

<codeblock id="02_051">
</codeblock>

</exercise>

<exercise id="10" title="From Multiple Correspondence Analysis to Sorting Data">

<HTML>
<section class="accordion2">
  <input type="checkbox" name="collapse2" id="handle2">
  <h2 class="handle">
    <label for="handle2">In the last episodes...</label>
  </h2>
  <div class="content">
  <p>This is what you need to do before beginning this section, if your connection has been interrupted or if you have have interrupted your learning.
  </p>
<codeblock id="chap2_sec9">
</codeblock>
  </div>
</section>
</HTML>

Multiple Correspondence Analysis (MCA) is an extension of Correspondence Analysis (CA) that allows for the analysis of the relationships among more than two categorical variables simultaneously. This method can also be seen as a PCA on categorical variables. Indeed, the datasets analysed in PCA and MCA are similar, with individuals in rows and variables in columns, continuous variables in the case of PCA and categorical variables in the case of MCA.

MCA is a useful technique in data exploration and visualization when working with complex categorical data with multiple variables. It helps to identify patterns and associations between the different categorical variables, as well as the relationships among the categories within each variable.

To apply this method, use the `MCA()` function of the `FactoMineR` package, then use the `plot.MCA()` function in order to represent the rows of the dataset.

Before using the `MCA()` function, a crucial question needs to be addressed: which variables should be used to differentiate individuals? In this example, the goal is to classify individuals based on their opinions on genetically modified organisms (GMOs). Therefore, to distinguish between two individuals, variables associated with GMOs will be used. To calculate the distance between individuals, the first 16 variables of the dataset are utilised.

The `MCA()` function facilitates the distinction between variables used in calculating the distance between individuals, *i.e.* active variables and other variables referred to as illustrative or supplementary variables. To classify the variables, the arguments *quanti.sup* and *quali.sup* are employed, each indicating the columns of supplementary quantitative or qualitative variables. By default, any remaining variables are considered to be active variables.

<codeblock id="02_037">
</codeblock>

Multiple correspondence analysis is highly sensitive to rare modalities, leading to greater distance between individuals who possess them and those who do not. The `MCA()` function includes a crucial argument, namely the `level.ventil` argument. Set this argument to 0.05: individuals who have chosen rare modalities, taken by less than 5% of individuals, are randomly assigned another modality.

<codeblock id="02_038">
</codeblock>

Use the `plot.MCA()` function in order to represent the results from MCA.

<codeblock id="02_039">
</codeblock>

As you can see, the graph is overloaded. It shows the individuals in black, the modalities associated with the active variables in red and the supplementary variables in green. It is possible to represent only one type of object by making the others invisible using the `invisible` argument. If you set the argument to `"var"` then the modalities associated with the active variables will not be represented. If you set the argument to `"quali.sup"` then the modalities associated with the supplementary variables will not be represented.

<codeblock id="02_040">
</codeblock>

If you set the argument to `"quali.sup"` then the modalities associated with the supplementary variables will not be represented.

<codeblock id="02_041">
</codeblock>

By playing with the `label` argument, represent individuals without their identifier.

<codeblock id="02_042">
</codeblock>

Represent the modalities associated with the supplementary variables. Comment and interpret this graphical output.

<codeblock id="02_043">
</codeblock>

To comprehend the structure of variability between individuals induced by the distance based on GMO variables, use the `dimdesc()` function to gain a better understanding of the dimensions derived from the MCA. This function is applied to the results of the MCA directly.

<codeblock id="02_044">
</codeblock>

Interpret the first dimension using the code provided below. Start by identifying the modalities that are associated with the supplementary variables. These modalities are particularly interesting because they did not intervene in the distance between individuals and therefore did not participate in the construction of the dimensions.

<codeblock id="02_045">
</codeblock>

In the case of questionnaire data, it is common to want to obtain a typology of respondents. This can easily be done using an unsupervised classification based on the factorial coordinates from the MCA. This classification can easily be done using the `HCPC()` function. Note that by default, the number of factorial coordinates saved by the `MCA()` function is equal to 5. It is possible to carry out the typology on a larger number of factorial coordinates: this is done using the `ncp` argument of the `MCA()` function.

<codeblock id="02_046">
</codeblock>

As indicated by the code, the `HCPC()` function can automatically determine an optimal number of clusters. To achieve this, the `nb.clust` argument should be set to -1. Now that we have clusters of respondents who share a common perception of GMOs, we can explore how these clusters can be nterpreted: let's examine the numerical indicators provided by the `HCPC()` function.

<codeblock id="02_047">
</codeblock>

The function provides two particularly important outputs: the original dataset, *i.e.* the one analyzed by the MCA, to which the cluster variable derived from the hierarchical clustering on the MCA components has been added (`$data.clust`); the automatic description of the cluster variable (`$desc.var`).

To obtain the distribution of the cluster variable, simply apply the `summary()` function to the appropriate dataset.

<codeblock id="02_048">
</codeblock>

You can now proceed to review the description of the clusters and interpret them.

<codeblock id="02_049">
</codeblock>


## The *R* corner: the *catdes()* function...a must have
<br>

The `catdes()` function is one of the most important in the `FactoMineR` package. It enables the automatic description of a qualitative variable using the other variables in the dataset, whether they are quantitative or qualitative.

We will apply this function to two variables of interest. First, the political party variable. This will enable us to have a description of political parties based on their stance towards GMOs.

<codeblock id="02_050">
</codeblock>

Display the description of the political party associated with the category *Right*. Try with the political party of your choice.

Second, the cluster variable, which will provide an automatic description of the cluster variable obtained from the HCPC function.

<codeblock id="02_051">
</codeblock>

</exercise>