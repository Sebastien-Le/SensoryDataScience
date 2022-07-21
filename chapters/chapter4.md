---
title: 'Chapter 4: Everything you always wanted to know about JAR - a play in five acts'
description:
prev: /chapter3
next: /chapter5
type: chapter
id: 4
---

<exercise id="1" title="Act 1 - introduction: the orange juice case study, understanding a market product space">

<slides source="orange">
</slides>

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

With the `read.csv2()` function, import the orange data set and save it in an R object named orange. With the `summary()` function, make sure that the data set has been well imported. Check carefully the type of each variable. As there are 8 orange juices in the case study, set the `maxsum` argument to 8.

<codeblock id="04_01">
</codeblock>

With the `as.factor()` function, encode all the variables except the *Liking* as factors. With the `levels()` and the `nlevels()` functions, make sure that you have 106 consumers.

<codeblock id="04_02">
</codeblock>

These *JAR* data are very simple, actually it's the minimum data you should ask to your consumers when collecting JAR data to understand a product space in terms of qualities and defects.

But what does it mean to understand a product space in terms of qualities and defects? It means that you want to measure the impact of an attribute on the liking, when the attribute is not present enough, or on the contrary, when the attribute is too present.

This impact can be measured at a product space level, or at a product level. The methodology for measuring and analyzing this kind of impact is called a <span style="font-weight : bold">penalty analysis</span> (just like in football when an offence is committed by a player in their own penalty area).

Before diving into the penalty analysis, let's visualize the data.

<codeblock id="04_02_v">
</codeblock>

The same type of visualization can be obtained by product.

<codeblock id="04_03_v">
</codeblock>


## The *Sensory* corner: JAR scales and penalties
<br>

In practice, once the product space is selected, the point of view according to which you want to understand it,  *i.e.* the sensory attributes, has to be chosen as well. The notion of defect induce naturally a model: the hedonic score, the liking, depends on the defects. No need to mention that liking depends also from the products and the consumers: all tastes are in nature. This is what we are going to consider in the following part.

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

## The *Stat* corner: the concept of dummy variable
<br>

Have a look at this link: https://en.wikipedia.org/wiki/Dummy_variable_(statistics). A dummy variable is a variable that takes values of 0 and 1, where the values indicate the presence or absence of something. When a categorical variable has more than two categories, it can be represented by a set of dummy variables, with one variable for each category.

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

In the following part, we are going to recode the sensory attributes into dummy variables, to indicate the presence or absence of a particular defect. But before that, we are going to aggregate the categories `1` and `2` into `ne` for not enough, `4` and `5` into `tm` for too much, and finally recode the category `3` into `JAR`.

<codeblock id="04_03">
</codeblock>

To recode your variables, use the `acm.disjonctif()` function of the `ade4` package. Create an R object named `orange.dummy`, in which you store the results of the recoding into dummy variables.

<codeblock id="04_04">
</codeblock>

Build an R object containing the information about the consumers, the products and the dummy variables.

<codeblock id="04_05">
</codeblock>

Use the `AovSum()` function of the `FactoMineR` package to estimate your model for which the liking is explained by the presence or absence of the defects, the consumers and the products.

<codeblock id="04_06">
</codeblock>

Penalties can also be estimated for each product. Subset the `orange.dummy` to the data for product `2JPR`, and save the data in an object named `orange.dummy.2JPR`.

<codeblock id="04_07">
</codeblock>

Use the `AovSum()` function to estimate your model for which the liking is explained by the presence or absence of the defects.

<codeblock id="04_08">
</codeblock>

Compare graphically the penalties, when calculated at the product space level, on the one hand, at the level of product 2JPR, on the other hand.

<codeblock id="04_08">
</codeblock>

## The *R* corner: the JAR() fonction of the SensoMineR package
<br>

The `JAR()` function of the `SensoMineR` package can be used to facilitate what has been done previously. The arguments of the function are the name of JAR data set, the position of the *product* factor, the position of the *panelist* factor, the position of the *liking* variable. The *JAR* data set must contain only these variables.

<codeblock id="04_09">
</codeblock>

The graphical output is not informative when the levels of the sensory attributes are the same. Consequently, they have to be changed. Use the very important `paste()` function to add the name of the attribute in front of its levels.

<codeblock id="04_10">
</codeblock>

Run the `JAR()` function to represent the penalties.

<codeblock id="04_11">
</codeblock>

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

Understanding the impact of defects on liking (or some other similar measure) can be done using <span style="font-weight : bold">exploratory multivariate</span> analyses, that are often complementary to inferential analyses.

Actually, considering a tasting sheet as a statistical individual can be really interesting. We are interested in the association profile between defects. We will see that this approach often justifies the taking into account of all the sensory attributes in our previous model: it is precisely because they are linked that we must include all of them in our linear model.

As for all statistical analysis, we must define a point of view according to which we want to understand the statistical individuals. In our case, this point of view is natural and all the sensory attributes should be taken into account to define our multivariate profiles. As data are categorical, a Multiple Correspondence Analysis should be run.

Use the `MCA()` function of the `FactoMineR` package. Pay attention to the notion of <span style="font-weight : bold">supplementary</span> variables (also called <span style="font-weight : bold">illustrative</span>) variables): it is the most important, if not the only, thing you have to think carefully of. Once supplementary variables are chosen, the rest is used to define the point of view, in other words to differentiate the statistical individuals. 

In order not to be overwhelmed by the results, it is important to look at them little by little, hence the `graph` set to `FALSE`: MCA is a graphical method, the results provided by the function are mainly graphical outputs, and therefore you have to think carefully about what you want to see. Like an investigator you have to explore the graphs little by little.

<codeblock id="04_12">
</codeblock>

The representation of the supplementary variables suggests to get rid of the consumer variable  but to keep the product variable. Use the position of the consumer variable to get rid of it.

<codeblock id="04_13">
</codeblock>

The representation of the liking variable suggests to recode it as a factor.

<codeblock id="04_14">
</codeblock>

Use the `selectMod` argument to visualize defects and qualities eventually.

<codeblock id="04_15">
</codeblock>


## The *R* corner: the str_split() function of the stringr package
<br>

As mentioned previously, the juices were chosen according to 3 factors: the question arises as to whether the structure revealed by the analysis can be linked to these factors.  Therefore, it makes sense to add this information in the orange data. To do so, we are going to manipulate strings.

<codeblock id="04_16">
</codeblock>

Once the information added, you can use it as supplementary variables.

</exercise>

<exercise id="2" title="Act 2 - easy: the goji case study, an example of product formulation">

<slides source="goji">
</slides>

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

Why is this case study different from the previous one? First, the context is different, we are dealing with formulated products according to some experimental design. Then, consumers have evaluated the products twice (which is really rare, but can happen).

Basically, we are going to use the same strategy as for the orange data, but with a particular focus on the experimental factors, and on the comparison between the two sessions.

Let's first import the data, and make sure that what should be categorical is categorical.

<codeblock id="04_2_01">
</codeblock>

As data are not considered as categorical, recode them with the `as.factor()` function and a simple loop.

<codeblock id="04_2_02">
</codeblock>

Then, before diving into the penalty analysis, let's visualize the data.

<codeblock id="04_2_03">
</codeblock>

Since consumers have tested the products twice, many analyses can be performed to answer many sensory questions:

- Penalties can be estimated for both sessions of course. They can also be estimated for each session, and compared to each other. 

- From a multivariate point of view, profiles of defects can be studied all sessions combined, but they can also be compared to each other with special methods such as Multiple Factor Analysis. 

- If the product is the main object of interest, it is also possible to build a contingency table with products as rows, defects as columns, at the intersection of one row and one column, the number of times a given defect has been identified for a given row.

Let's first look at the penalties across sessions, and see, for example, if the defects have a different impact on liking and typicity. To do so, use the `JAR()` function of the `SensoMineR` package. Remember that the input of this function is the smallest possible JAR data set consisting of the consumer variable, the product variable, the liking (or assimilated) variable, and finally the sensory attributes evaluated on a JAR scale. In other words, apply the `JAR()` function twice, with first the liking variable, then the typicity variable. Save the penalties and compare them.

<codeblock id="04_2_04">
</codeblock>

Now that the penalties for the liking and for the typicity are estimated, let's compare them to each other graphically.

<codeblock id="04_2_05">
</codeblock>

The same type of analysis can be done per session.

Let's have a look at the profiles of defects. The idea is to represent the profiles all sessions combined, and to see if the structure induced by the profiles can be explained by supplementary information such as the experimental factors used to formulate the products.

<codeblock id="04_2_06">
</codeblock>


</exercise>

<exercise id="3" title="Act 3 - JAR: the Sennheiser case study, when JAR meet CATA">

<slides source="Sennheiser">
</slides>

<br>

To get a graphical representation of the density for a sensory attribute, we use the `density()` function, and the very important `plot()` function.

<codeblock id="01_28">
</codeblock>


</exercise>

<exercise id="4" title="Act 4 - difficult: the car seat case study, when JAR are free">

<slides source="tissu">
</slides>

<codeblock id="tuto_13">
</codeblock>

<codeblock id="tuto_14">
</codeblock>

<codeblock id="tuto_15"> 
</codeblock>
    
<codeblock id="tuto_16">
</codeblock>
      
<codeblock id="tuto_17">
</codeblock>


</exercise>

<exercise id="5" title="Act 5 - conclusion: everything you always wanted to know about JAR with R">

</exercise>