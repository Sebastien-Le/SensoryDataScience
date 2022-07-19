---
title: 'Chapter 5: Everything you always wanted to know about JAR - a play in five acts'
description:
prev: /chapter4
next: null
type: chapter
id: 4
---

<exercise id="1" title="Act 1 - too easy: the orange juice case study, understanding a market product space">

<slides source="orange">
</slides>

Import the `orange.csv` file in an R object named `orange`. Use the `summary()` function to check the importation. 

<codeblock id="04_01">
</codeblock>

With the `as.factor()` function, encode all the variables except the *Liking* as factors. With the `levels()` and the `nlevels()` functions, make sure that you have 106 consumers.

<codeblock id="04_02">
</codeblock>

These *JAR* data are very simple, actually it's the minimum data you should ask to your consumers when collecting JAR data to understand a product space in terms of qualities and defects.

But what does it mean to understand a product space in terms of qualities and defects? It means that you want to measure the impact of an attribute on the liking, when the attribute is not present enough, or on the contrary, when the attribute is too present.

This impact can be measured at a product space level, or at a product level. The methodology for measuring and analyzing this kind of impact is called a <span style="font-weight : bold">penalty analysis</span> (just like in football when an offence is committed by a player in their own penalty area).


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

</exercise>

<exercise id="2" title="Act 2 - easy: the goji case study, an example of product formulation">

<slides source="goji">
</slides>

Question
<choice id=5>
<opt text="Reponse A ">
C'est faux mais ecrit en texte
</opt>
<opt text="Reponse B" correct="true">
Texte de reponse
</opt>
<opt text="Reponse C">
</opt>
<opt text="Reponse D">
</opt>
<opt text="Reponse E">
</opt>
<opt text="Reponse F">
</opt>
</choice>

Note : choix multiples pas implémentés

Bạn có cảm thấy liên quan đến cuộc tranh luận về GMO (rất nhiều, ở một mức độ nhất định, một chút, không hề)?



Question
<choice id=5>
<opt text="Reponse A ">
C'est faux mais ecrit en texte
</opt>
<opt text="Reponse B" correct="true">
Texte de reponse
</opt>
<opt text="Reponse C">
</opt>
<opt text="Reponse D">
</opt>
<opt text="Reponse E">
</opt>
<opt text="Reponse F">
</opt>
</choice>


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

<slides source="chapter1_01_introduction">
</slides>

</exercise>

<exercise id="5" title="Act 5 - in practice: everything you always wanted to know about JAR with R">

<slides source="chapter1_01_introduction">
</slides>

</exercise>