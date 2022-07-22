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

Before diving into the penalty analysis, let's visualize the data. The main question you should answer to is: what do I want to visualize?

Actually, JAR data can be considered as categorical variable: therefore, you want to see the distribution of each sensory attribute in terms of JAR categories. To do so, for a given attribute, use the `table()` function to get that distribution. Then, with the `as.data.frame()` function, transform this result into an R object that you will be able to plot.

<codeblock id="04_02_v1">
</codeblock>

With the `ggplot()` and `geom_bar()` functions of the `ggplot2` package, plot the distribution from the R object `tab`.

<codeblock id="04_02_v2">
</codeblock>

As you can see, this visualization is not explicit enough as you can't tell what is on the x-axis, nor on the y-axis. Improve your visualization with the `xlab()`, `ylab()`, `ggtitle()` functions.

<codeblock id="04_02_v3">
</codeblock>

Use different *themes* to enhance your visualization. Have a look at the following link https://ggplot2-book.org/polishing.html. For instance, start with the `theme_minimal()` function.

<codeblock id="04_02_v4">
</codeblock>

Of course the same type of visualization can be obtained for a given product. To do so, you need the contingency table that crosses the products and the levels of a given JAR attribute. Use the very important `table()` function (again) to obtain such a table.

<codeblock id="04_02_v5">
</codeblock>

From this contingency table, represent the distribution of the JAR attribute *Odor Intensity*, and the product *1JPA*. Note that ggplot visualizations can be saved easily.

<codeblock id="04_02_v6">
</codeblock>

From this contingency table, represent the distribution of the JAR attribute *Odor Intensity*, and the product *7TWA*.

<codeblock id="04_02_v7">
</codeblock>

To compare these 2 products, use the `plot_grid()` function of the `cowplot` package.

<codeblock id="04_02_v8">
</codeblock>

Actually, the comparison between the 2 products is still complicated. Obviously, the y-axis has to be set to the same scale. With the following code, get easily the maximum of occurrences for these 2 products.

<codeblock id="04_02_v9">
</codeblock>

Use the `ylim()` to set the y-axes at the same scale, so that both products can be easily compared.

<codeblock id="04_02_v10">
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

Use the `AovSum()` function of the `FactoMineR` package to estimate your model for which the liking is explained by the presence or absence of the defects, the consumers and the products. Use the `names()` function to get the names of the elements of the list of results provided by the `AovSum()` function. Display the results of the *t-test*.

<codeblock id="04_06">
</codeblock>

## The *R* corner: the JAR() fonction of the SensoMineR package
<br>

Actually, there's a very convenient way to get the penalties directly with the `JAR()` function of the `SensoMineR` package. Be careful, the `JAR()` function takes as input the most simple JAR data you can collect: *i.e.*, a data set with the product effect, the consumer effect, the liking *type* variable, and sensory attributes evaluated on a JAR scale. The arguments of the function are the name of JAR data set, the position of the product effect, the position of the consumer effect, the position of the liking variable.

<codeblock id="04_06s">
</codeblock>

Note that the proper just about right level has to be specified, otherwise  the function will not work. Note also that the model we are interested in is the second one, the one that considers all the sensory attributes at the same time: the results of this model are saved in the object `$penalty2`.

Use the `plot.JAR()` to visualize the results for a given product, say `2JPR` for instance.

<codeblock id="04_06t">
</codeblock>

The graphical output is not informative when the levels of the sensory attributes are the same. Consequently, they have to be changed. Use the very important `paste()` function to add the name of the attribute in front of its levels. Let's see how it works.

<codeblock id="04_10avant">
</codeblock>

Now, let's do it for all the sensory attributes.

<codeblock id="04_10">
</codeblock>

Run the `JAR()` function to estimate the penalties, and the `plot.JAR()` function to represent them for the product `2JPR`.

<codeblock id="04_11">
</codeblock>

Although this function is really interesting, it has its limits: the penalties are estimated for the whole product space. In other words, if you want to represent another product, the only things that are going to change are the values on the x-axis: the frequencies.

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

It makes sense to estimate penalties for each product and not only for the whole product space. To do so, the model to consider has to be modified as the product effect can't longer be taken into account.

Subset the `orange.dummy` to the data for product `2JPR`, and save the data in an object named `orange.dummy.2JPR`.

<codeblock id="04_07">
</codeblock>

Use the `AovSum()` function to estimate your model for which the liking is explained by the presence or absence of the defects.

<codeblock id="04_08">
</codeblock>

Compare graphically the penalties, when calculated at the product space level, on the one hand, at the level of product 2JPR, on the other hand. To do so, think about what you want to visualize: for all the defects, the values of the penalties estimated for all the products on the x-axis, for a given product on the y-axis.

First, build the proper data set, with the defects as rows, the estimation of the penalties as columns, for the whole product space, for a given product.

<codeblock id="04_08a">
</codeblock>

With the `ggplot()` and `geom_point()` functions, visualize the defects according to their penalties.

<codeblock id="04_08b">
</codeblock>

For this kind of representation, you have to be careful. Your brain is more comfortable when the x-axis and the y-axis have the same scale. Use the `coord_fixed()` function to fix the axes of representation. Before that, use the `summary()` function to delimit your visualization.

<codeblock id="04_08c">
</codeblock>

The labels of your defects are very important and they need to be represented. Use the `geom_text_repel()` function of the `ggrepel` package.

<codeblock id="04_08d">
</codeblock>

Let's now bring the final touch with the notion of themes: choose the one that best suits your mood.

<codeblock id="04_08e">
</codeblock>

Understanding the impact of defects on liking (or some other similar measure) can be done using <span style="font-weight : bold">exploratory multivariate</span> analyses, that are often complementary to inferential analyses.

Actually, considering a tasting sheet as a statistical individual can be really interesting. We are interested in the association profile between defects. We will see that this approach often justifies the taking into account of all the sensory attributes in our previous model: it is precisely because they are linked that we must include all of them in our linear model.

As for all statistical analysis, we must define a point of view according to which we want to understand the statistical individuals. In our case, this point of view is natural and all the sensory attributes should be taken into account to define our multivariate profiles. As data are categorical, a Multiple Correspondence Analysis should be run.

Use the `MCA()` function of the `FactoMineR` package. Pay attention to the notion of <span style="font-weight : bold">supplementary</span> variables (also called <span style="font-weight : bold">illustrative</span>) variables): it is the most important, if not the only, thing you have to think carefully of. Once supplementary variables are chosen, the rest is used to define the point of view, in other words to differentiate the statistical individuals. 

In order not to be overwhelmed by the results, it is important to look at them little by little, hence the `graph` set to `FALSE`: MCA is a graphical method, the results provided by the function are mainly graphical outputs, and therefore you have to think carefully about what you want to see. Like an investigator you have to explore the graphs little by little.

By default, for multiple correspondence analysis, the main output is the visualization of the individuals and the categories. These two scatter plots, the one of the individuals and the one of the categories, are represented in the same space as their relative position to each other is interpretable. This graph is often cluttered because of the large number of objects to be represented: it is important to know how to select them.

In the console, represent the cloud of individuals on the one hand, and the cloud of modalities on the other hand.

<codeblock id="04_12">
</codeblock>

The representation of the supplementary variables suggests to get rid of the consumer variable, but to keep the product variable. To solve these problems, use the position of the consumer variable to get rid of it. Visualize the liking variable that has been considered as a quantitative supplementary variable.

<codeblock id="04_13">
</codeblock>

What do you think about the link between the liking variable and the two first dimensions, the link between the categories of the product effect and the two first dimensions; finally the link between the liking and the products? In other words, the representation of the liking variable suggests to recode it as a factor, in order to visualize it in the same representation as the one of the defects and the categories.

Use the `as.factor()` function to recode the liking variable, set the arguments properly to visualize the categories of liking with the categories of the product effect.

<codeblock id="04_14">
</codeblock>

Now, let's connect these supplementary information to the core of the analysis: the defects. 

<codeblock id="04_14b">
</codeblock>

As you can see, the visualization is quite cluttered. We need to find a way to select the categories we want to display. Use the `selectMod` argument to visualize defects and qualities eventually. To use this very important argument, you need to know the labels of the objects you want to represent. You will see that it is possible to select these names in a very simple way.

First, store the names of the active categories in an object named `mod.active` (modalities and categories represent the same concept).

<codeblock id="04_15">
</codeblock>

Then, use the `str_detect()` function of the `stringr` package to select the categories that contain the string `JAR` for instance.

<codeblock id="04_15a">
</codeblock>

Finally, create an R object in which you store the value `JAR`, and run the `plot.MCA()` function with the `selectMod` argument that has been properly set.

<codeblock id="04_15b">
</codeblock>

Actually, you are learning to code a function using the notion of argument through the object in which you store a value.

## The *R* corner: the str_split() function of the stringr package
<br>

As mentioned previously, the juices were chosen according to 3 factors: the question arises as to whether the structure revealed by the analysis can be linked to these factors.  Therefore, it makes sense to add this information in the orange data. To do so, we are going to manipulate strings.

<codeblock id="04_16">
</codeblock>

Once the information added, you can use it as supplementary variables.

<codeblock id="04_17">
</codeblock>

</exercise>



<exercise id="2" title="Act 2 - easy: the goji case study, an example of product formulation">

<slides source="goji">
</slides>

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

Why is this case study different from the previous one? First, the context is different, we are dealing with formulated products according to some experimental design. Then, consumers have evaluated the products twice (which is really rare, but can happen). Finally, consumers have evaluated the products through liking and typicity, in other words, through two quantitative variables. They represent two different dimensions of perception that might be linked.

Basically, we are going to use the same strategy as for the orange data, but in order to compare the impact of defects on liking on the one hand, on typicity on the other hand. It might be interesting to see whether some defects have more impact on liking than on typicity. Finally, we will focus on the experimental factors, and on the comparison between the two sessions.

Let's first import the data, and make sure that what should be categorical is categorical.

<codeblock id="04_2_01">
</codeblock>

As data are not considered as categorical, recode them with the `as.factor()` function and a simple loop.

<codeblock id="04_2_02">
</codeblock>

Let's first look at the penalties across sessions, and see, for example, if the defects have a different impact on liking and typicity. To do so, use the `JAR()` function of the `SensoMineR` package. Remember that the input of this function is the smallest possible JAR data set consisting of the consumer variable, the product variable, the liking (or assimilated) variable, and finally the sensory attributes evaluated on a JAR scale. In other words, apply the `JAR()` function twice, with first the liking variable, then the typicity variable. Save the penalties and compare them.

Create two R objects named `goji.liking` and `goji.typicity`, in which you store the proper information: think carefully about the minimum information to estimate penalties.

<codeblock id="04_2_04">
</codeblock>

Run the `JAR()` function of the `SensoMineR` package on both objects, store the results in two separate objects and compare the estimation of the penalties for the model that takes into account all the sensory attributes at the same time.

<codeblock id="04_2_04a">
</codeblock>

Obviously, comparing penalties estimated from the liking and the typicity is not straightforward. As you know, a graph is worth a thousand words. Let's plot the two sets of penalties. To do so, we are going to build the proper data set as input of the `ggplot()` and `geom_point()` functions: a data frame, where rows correspond to defects and columns to penalties for the liking and the typicity.

<codeblock id="04_2_04b">
</codeblock>

Let's now plot these two vectors of penalties with the `ggplot()` and `geom_point()` functions.

<codeblock id="04_2_04c">
</codeblock>

It is obvious that this visualization must be drastically improved. As in the introduction, you have to think about a proper frame of representation: think about the limits of the x-axis and the y-axis, think about the scales of the x-axis and the y-axis (`coord_fixed()`).

<codeblock id="04_2_04d">
</codeblock>

Once the limits are set, think about the labels of the defects, as this is the main information to be displayed. Use the `geom_text_repel()` of the `ggrepel` package to display properly the labels.

<codeblock id="04_2_04e">
</codeblock>

Unfortunately, the visualization needs some improvements: pay attention to the warning message that tells you that there are "9 unlabeled data points (too many overlaps). Consider increasing max.overlaps".

<codeblock id="04_2_04f">
</codeblock>

And now, the final polish: play with the themes and find the one that suits best with your mood.

<codeblock id="04_2_04g">
</codeblock>

What do you think about this visualization?

Let's now move to the multivariate analysis of the defects. In other words, let's study the profiles of defects. As presented in the orange case study, we're going to use Multiple Correspondence Analysis.

First, as always, run the `summary()` function on the goji data set. It allows you to check if you are working on the proper data, and to choose the <span style="font-weight : bold">active variables</span> that define your profile of defects.

<codeblock id="04_2_10">
</codeblock>

The active variables are in our case the sensory attributes, all the other variables are going to be considered as illustrative.

<codeblock id="04_2_11">
</codeblock>

As shown, the shape of the defects profiles is kind of particular. It shows that there are special profiles with defects that are quite rare: unfortunately, categories that are rarely chosen have an important impact in the analysis. There's a way to solve this problem: recoding the levels and aggregating, in our case, *not enough* and *really not enough*, *too much* and *really too much*. The recoding option will not be shown here, we will use a special argument of the `MCA()` function, `level.ventil`. This argument is, in practice, really important when dealing with categorical data. This argument is a proportion corresponding to the level under which the category is ventilated; by default, 0 and no "*ventilation*" is done (*ventiler* is a french verb that means to distribute).

<codeblock id="04_2_12">
</codeblock>

As shown, the defects that have been rarely chosen have been aggregated randomly to some other defects of the same attribute. It will not change the interpretation of the analysis, but it will facilitate it. Now, represent the active categories, and the supplementary categories.

<codeblock id="04_2_13">
</codeblock>

The output still needs to be improved. Let's get rid of the uninformative factors (at least for this analysis), and let's keep the informative ones, *i.e.* the product effect, the base effect and the dose of goji effect.

<codeblock id="04_2_14">
</codeblock>

Just like in the orange case study, select the JAR categories and the formulation categories.

<codeblock id="04_2_15">
</codeblock>

Finally, represent the liking and the typicity variables as supplementary quantitative variables.

<codeblock id="04_2_16">
</codeblock>

What do you think about all these visualizations?

This part is completely new compared to what have been shown in the orange case study. We're going to study the data at a product level. We are going to build a <span style="font-weight : bold">contingency table</span>, with as rows, the products, and as columns, the defects: at the intersection of one row and one column, the number of times a given defect has been qualified a given product. We have seen this type of table in the orange case study for visualization purposes: let's now analyze this type of table. But before that, let's build it.

Select the product effect and the sensory attributes. Initialize your contingency table. Keep on building it with a loop.

<codeblock id="04_2_17">
</codeblock>

It's important to understand this code. You will see in the next case study that it will be simplified using a very powerful function. Now, we're going to study the defects at a formulation level and not at a product level. In other words, we're going to build contingency tables for the base effect and the dose effect. To do so, we are going to use an important function that will prevent you from making loops: that's why this function is so important, loops are not that elegant, nor efficient. Don't hesitate to have a look at https://www.r-bloggers.com/2010/08/a-brief-introduction-to-%E2%80%9Capply%E2%80%9D-in-r/.

<codeblock id="04_2_18">
</codeblock>

Let's do that for the dose effect...

<codeblock id="04_2_19">
</codeblock>

...and bind it with the main contingency table.

<codeblock id="04_2_20">
</codeblock>

We are now ready for a very important multivariate analysis: Correspondence Analysis, nothing else but the graphical version of the very important <span style="font-weight : bold">Chi-square test</span>.

As for all exploratory multivariate analysis, the main questions before running the analysis are: 

- what do you want to represent?
- how do you want to represent it?

In fact, in practice, we rarely answer the first question, as we often want to study all the rows of our data set. But in any case, we must answer the second question, as it constitutes the point of view according to which we analyze the data.

The second question corresponds to the choice of the <span style="font-weight : bold">active</span> variables *versus* the <span style="font-weight : bold">illustrative</span> ones. You have to do that each time.

The first question corresponds to the choice of the <span style="font-weight : bold">active</span> rows *versus* the <span style="font-weight : bold">illustrative</span> ones. It rarely happens, except in this case study.

As you can easily guess, the products are going to be active, and the categories associated with the formulation are going to be illustrative. Run the `CA()` function of the `FactoMineR` package, by specifying the supplementary (illustrative) rows. Save the results in an object named `res.ca`. 

<codeblock id="04_2_21">
</codeblock>

Use the `plot.CA()` function to represent the rows only.

<codeblock id="04_2_22">
</codeblock>

Use the very important `ellipseCA()` function to represent *confidence ellipses* around the products.

<codeblock id="04_2_23">
</codeblock>

These graphical representations are very useful: they allow us to understand the data, but also to communicate and convey messages. However, they are not sufficient in themselves, we need a tool to automatically describe a contingency table: rows *versus* columns and *vice versa*. This tool is the very important `descfreq()` function of the `FactoMineR` package.

<codeblock id="04_2_24">
</codeblock>

Apply the `descfreq()` function to understand the base effect and the dose effect.

<codeblock id="04_2_25">
</codeblock>

<br>

Since consumers have tested the products twice, many analyses can be performed to answer many sensory questions:

- Penalties can be estimated for each session, and compared to each other. 

- From a multivariate point of view, profiles of defects for each session can be compared to each other with special methods such as Multiple Factor Analysis (MFA). 

- If the product is the main object of interest, it is also possible to build contingency tables for each session, with products as rows, defects as columns. They can also be compared to each other with MFA.

As you can guess, we are going to talk about multiple tables and of course Multiple Factor Analysis, the *Queen* of the multiple tables methods.

Similarly to the beginning of the case study with the liking and the typicity we are going to create two objects, one per session, named respectively `goji.liking.s1` and `goji.liking.s2`. Here, we are interested in comparing the impact of the defects on the liking for the two sessions.

<codeblock id="04_2_26">
</codeblock>

Once the objects are created, apply the `JAR()` function, store the results and build an object that will allow you to compare the penalties for sessions 1 and 2.

<codeblock id="04_2_27">
</codeblock>

Now it's time for the visual comparison between the penalties. Take your time and run a very similar code to the one you used for comparing liking and typicity.

<codeblock id="04_2_28">
</codeblock>

To compare the profiles of defects of each session, build a multiple table by combining data from session 1 to data from session 2. Instead of binding by rows, you have to bind by columns. To do so, you have to order the two newly created data sets, by consumer and by product, to make sure that you are not mixing the data.

<codeblock id="04_2_29">
</codeblock>

Last but not least, the very important `MFA()` function. Before applying it, you need to know what it does. As you want to compare session 1 and session 2, the function needs to understand the way your data are organised. In other words, you have to specify that there are two groups of variables and that each group contains 6 variables (6 sensory attributes). You also have to specify the type of each group, whether the group is made of quantitative variables, qualitative variables, or is a contingency table.

Save the results in an object named `res.mfa`, use the `plot.MFA()` to get the representation of the groups.

<codeblock id="04_2_30">
</codeblock>

The most important thing right now is to understand how to use the function. The graphical output is quite easy to understand as it shows that the structure induced by the profiles of defects has not changed from one session to the other.

Let's quickly do the same type of analysis at a product level. In other words, let's build 2 contingency tables.

<codeblock id="04_2_31">
</codeblock>

Now you have to think about an important argument, the type of your groups. This analysis is quite unusual, although very important, it's a Multiple Factor Analysis on Contingency Tables. We will come back later on this one in the next case study.

<codeblock id="04_2_32">
</codeblock>

As you can see, the structure induced on the products by the defects is globally the same from one session to the other.

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