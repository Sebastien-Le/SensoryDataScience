---
title: 'Chapter 3: Everything you always wanted to know about JAR - a play in five acts'
description: This part was co-written by Alexiane Luc and Sébastien Lê. Thanks for her invaluable help!
prev: /chapter2
next: null
type: chapter
id: 3
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

Rest assured, from now on the code should not be a problem for you. It's all about sensory issues as we already have most of our statistical tools. The first question you have to ask yourself is: what have in common this case study and the two last ones? Compared to the last one for instance, the notion of formulation factors: in this case study, we are building sound logos using experimental factors. 

What is different? A lot of things. First, there are a lot of products to assess (27 sound logos), second we have not only JAR data, but also Check All That Apply data (CATA), and textual data, the infamous <span style="font-weight : bold">Why?</span> question. Finally, last but not least, we are not working with liking, it's a lot more conceptual. We are asking consumers to assess the notion of appropriateness.

The statistical tools, or concepts, we are going to play with are the contingency tables (like in the previous studies), some multiple tables, a lot of frequency tests.

Let's warm up with the usual routine: import the data and make sure that data are well imported.

<codeblock id="04_s1">
</codeblock>

According to the `summary()` function, rename the variable at column 30 as `Serious`, and recode the data with the `as.factor()` function, except variables `Adequation` (adequacy, suitable) and `Why`. Check the recoding with the `summary()` function.

<codeblock id="04_s2">
</codeblock>

Change the values of the levels of the CATA data into more explicit levels such as "Yes" and "No". Then, reorder the levels of the JAR data as previously done.

<codeblock id="04_s3">
</codeblock>

Run the following code in order to create a very helpful function that will simply produce contingency tables.

<codeblock id="04_s4">
</codeblock>

The input of the function is a matrix constituted of categorical variables. The function calculates contingency tables crossing the first column of the matrix and all the others, then aggregates them all.

Build an temporary matrix by selecting the product effect and the CATA data. Apply the `cont.categories()` function to the temporary data set. Save the results in an R object named  `contingency.CATA`. With the `t()` function, transpose the matrix to get the sounds as rows.

<codeblock id="04_s5">
</codeblock>

Use the object `contingency.CATA` and the very important `apply()` function, to get the number of times a given instrument has been associated with a CATA item.

<codeblock id="04_s6">
</codeblock>

Do the same thing for the other factors, the tempo and the pitch.

<codeblock id="04_s7">
</codeblock>

Aggregate all these vectors into an R object named `row.sup`, then aggregate `row.sup` to `contingency.CATA`. Keep one column out of two, the yes column for instance.

<codeblock id="04_s8">
</codeblock>

Use the `str_replace()` function of the `stringr` package to change the names of the columns, and to get rid of the "yes".

<codeblock id="04_s9">
</codeblock>

Now, do the same thing for the JAR data, until the creation of the `row.sup` object.

<codeblock id="04_s10">
</codeblock>

In this part, we are going to create three columns from the names of the sounds, each column being one of the three factors used to create the sounds.

<codeblock id="04_s11">
</codeblock>

Aggregate the three experimental factors to the object `contingency.JAR`, transform the `row.sup` object as a data frame.

<codeblock id="04_s12">
</codeblock>

Use the `bind_rows()` function of the `dplyr` package to aggregate the objects `contingency.JAR` and `row.sup`.

<codeblock id="04_s13">
</codeblock>

As you can see, building the `contingency.JAR` object was a little bit more complicated. It is mainly due to the fact that you are aggregating objects with different dimensions. Now, let's build our final data set named `contingency.sennheiser`.

<codeblock id="04_s14">
</codeblock>

From the last case study, you already know how to characterize the rows and columns of a contingency table, how to run a Correspondence Analysis on the JAR data, or on the CATA data (the idea is the same). You also know how to add supplementary rows and supplementary columns. You should try by yourself before going further. Spend some time with R. 

<codeblock id="04_s15">
</codeblock>

This following part is conceptually more complicated, as we want to compare the structure induced on the sound logos by the CATA on the one hand, the JAR on the other hand. Actually, asking consumers to evaluate an attribute according to a concept (in our case the adequacy), and not according to the traditional liking, is a little bit risky. It is then important to find a way to check if consumers have well understood the task. If the JAR are in the same area as the values of Sennheiser, then we can rely on the data.

Run an MFA on the `contingency.sennheiser` data. Try to understand the meaning of these visualizations.

<codeblock id="04_s16">
</codeblock>

Represent the columns of your contingency data. As you know, rows and columns live in the same space.

<codeblock id="04_s17">
</codeblock>

As you can see, this visualization is not optimal. We will make another one. To do so, we will use the coordinates of the columns calculated by the MFA. From these coordinates, we will represent the columns with the `ggplot()` and `geom_point()` functions.

Build an R object containing the coordinates of the columns on the first five dimensions, as well as their names, and finally the group these columns belong to, CATA or JAR.

<codeblock id="04_s18">
</codeblock>

Now that you have built the proper data set, use the `summary()` function to get the limits of your graph, then the `ggplot()` and `geom_point()` functions to plot the graph. You can have a look at https://ggplot2-book.org/.

<codeblock id="04_s19">
</codeblock>

As in the previous case studies, let's select some columns, and let's represent for instance the columns associated with the JAR level.

<codeblock id="04_s20">
</codeblock>

The following MFA is interesting as we are going to add a supplementary group.

<codeblock id="04_s20bis">
</codeblock>

This part is dedicated to <span style="font-weight : bold">textual data</span>, the infamous <span style="font-weight : bold">Why?</span> question. For this kind of data, the preparation phase is really important. Once done, the rest is pretty classic, at least in this part.

Lets' have a look at these data from line 20 to line 60. What can you say from this kind of data?

<codeblock id="04_s21">
</codeblock>

To facilitate the manipulation of the data, you are going to build a new data set named `sennheiser.text`. Just keep the consumer effect, the product effect, and the answers to the <span style="font-weight : bold">Why?</span> question: in other words, get rid of the empty comments. This situation occurs quite often with consumer data: answering an opened ended question is not an easy task. Don't forget to check that your new data set has been properly created.

<codeblock id="04_s22">
</codeblock>

## The *R* corner: cleaning textual data
<br>

Now, we are going to clean the newly created data set. You don't have to know how to do it by heart, but at least you have to understand. Spend some time in the console and try to figure out the meaning of each line of code.

<codeblock id="04_s23">
</codeblock>

The next step is for the stopwords that we are going to remove. These are actually the most common words in any language (like articles, prepositions, pronouns, 
conjunctions, etc), they don't add much information to the text. Examples of stopwords in English are “the”, “a”, “an”, “so”, “what”.

To remove the stopwords, we are going to use the `tm` package.

<codeblock id="04_s24">
</codeblock>

Finally, we have created a function to get rid of the improper space.

<codeblock id="04_s25">
</codeblock>

Now, that the textual data has been processed, have a look at it before analyzing it.

<codeblock id="04_s26">
</codeblock>

<center><img src="https://latex.codecogs.com/svg.image?\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}"/></center>
<br>

Cleaning or pre-processing is the most important thing to do when dealing with textual data. Once it's done, we can use simple but very efficient functions. As mentioned previously, the contingency table is the corner stone of a lot of statistical analysis. The idea is to build a matrix where columns correspond to word, and rows are the levels of the categorical variable of interest. In most of the situations, we are interested in the products described by the words. Therefore, what we want to analyze most of the time the contingency table where rows are the products and columns are the words used to describe them. As in the previous case studies, from that matrix, we can obtain supplementary rows (or columns) by aggregating them. It is illustrated in the following example.

First, use the `textual()` function of the `FactoMineR` package to build a contingency table crossing products and words.

<codeblock id="04_s27">
</codeblock>

Then, from this matrix, build a contingency table crossing the instrument and the words. Remember, you have done that before.

<codeblock id="04_s28">
</codeblock>

<codeblock id="04_s29">
</codeblock>

You can do the same thing for the other experimental factors. Let's try.

<codeblock id="04_s30">
</codeblock>

</exercise>

<exercise id="4" title="Act 4 - difficult: the car seat case study, when JAR are free">

<slides source="tissu">
</slides>

These data express an opinion about the products through the use of terms such as "too much", "not enough" and "just right", that imply qualities and defects. 

A quality (respectively, a defect) can then be defined as a word or a set of words associated with a positive (respectively, negative) valence; the term valence being used in psychology to describe the intrinsically pleasant or unpleasant nature of a stimulus. 

Trying to assess the valence associated with textual data (such as Free JAR comments, that reflect an opinion) is common in natural language processing: this task is known as <span style="font-weight : bold">sentiment analysis</span>  .

More precisely, sentiment analysis aims at studying opinions, feelings, attitudes and emotions expressed by an individual (towards a product, in our case). In particular, it allows us to evaluate the emotional tone of an individual relatively to a text by a quantitative score, that we call valency score.
In practice, there are two main approaches to perform sentiment analysis.

The lexical approach is the most intuitive one. It is based on the creation of dictionaries, 
associating to each word a known quantitative weight, defined according to its positive, negative or neutral nature. The interest for the experimenter is to be able to define and adapt these weights to the context. The valency score of a sentence is calculated according to the ratio of positive and negative words, and according to predefined grammatical rules, considering the negations.

We are first interested in this first approach, based on dictionaries. To do so, we need to import 
the `carseat` data set as well as the dictionaries associated with these data.

<codeblock id="tuto_01"> 
</codeblock>

Then, as usual, recode the variables as factors, when necessary.
    
<codeblock id="tuto_02"> 
</codeblock>

As a pre-processing, we need to homogenize the textual data in lowercase using the `tolower()` function. The punctuation is removed and the terms that make sense when they are combined are re-coded and combined.

<codeblock id="tuto_03"> 
</codeblock>

The R package used to achieve the sentiment analysis needs to operate on dictionaries that are 
recognized as "key" object. A transformation is thus achieved. To do so, use the `as_key()` function of the `sentimentr` package.
    
<codeblock id="tuto_04"> 
</codeblock>

The `sentiment()` function of the `sentimentr` package is used to perform the sentiment analysis.
The function takes also as arguments the *polarity* and the *valence shifter* dictionaries.

<codeblock id="tuto_05"> 
</codeblock>

The valency score obtained for each comment are concatenated to the leather data set in order to associate to each
comment its valency score.

<codeblock id="tuto_06"> 
</codeblock>

We need to check the consistency of the resulting valency scores with the hedonic categories in order to be sure that this quantitative score is relevant and can be exploited. To achieve it, an analysis of variance that explains the valency score according to the hedonic categories and the judges is achieved. What do you think of the results?

<codeblock id="tuto_07"> 
</codeblock>

<codeblock id="tuto_08"> 
</codeblock>

A boxplot can be obtained with the `geom_boxplot()` function of the `ggplot2` package, in order to represent the
distribution of the valency scores according to the hedonic categories in which the described product has been
placed by the respondent prior to the description step.

<codeblock id="tuto_09"> 
</codeblock>

Let's now create a matrix product x respondent whose entries are the valency scores associated with the description of a product by a respondent. It is just a reorganization of the data.

<codeblock id="tuto_10"> 
</codeblock>

We thus want to run a PCA on this data table. The graphical display represents an internal preference mapping. Let's now see how the respondents (as variables) are displayed.

<codeblock id="tuto_11"> 
</codeblock>

Results from this first approach seem promising as the transformation of a textual data into a quantitative data allows to consider new analyses. However, various limitations can be noted regarding the way the valency scores were calculated. First of all, since the dictionary is implemented by one experimenter, these scores are not necessarily transposable to another experimenter. In this sense, this approach appears subjective. Moreover, a positive attribute for a certain type of product may turn out to be negative for another. This is for example the case of the "acid" attribute, which can be positive for a lemon pie, but negative for a wine. The dictionaries must then be recreated as soon as the product space is different. In this sense, this approach is not generic. In order to overcome these limitations, we are more interested in a second approach, which is a machine learning one. Contrary to the lexical approach, it is only based on the collected data.
    
For saving time, import the data set with the valency scores calculated with the machine learning approach.

<codeblock id="tuto_12"> 
</codeblock>

As usual, recode the variables that need to be imported as factors.

<codeblock id="tuto_13"> 
</codeblock>

As for the valency scores resulting from the lexical approach, we transform the data set into a matrix product x respondent, whose entries are the valency scores calculated with the machine learning approach, associated with the description of the product by the respondent.
    
<codeblock id="tuto_14"> 
</codeblock>

Run a Principal Component Analysis with the `PCA()` function of the `FactoMineR` package in order to get a representation the products based on these new valency scores.

<codeblock id="tuto_15"> 
</codeblock>

In order to check the consistency and the added-value of the valency scores regarding Liking, let's construct the same
matrix product x respondent as for the valency scores from the two approaches. The entries are the liking scores given
by each respondent for each product.
    
<codeblock id="tuto_16"> 
</codeblock>

Let's run a PCA to represent the products according to their Liking scores.
    
<codeblock id="tuto_17"> 
</codeblock>

Now we want to see the differences between products according to the three different scores: valency scores from
lexical approach, valency scores from machine learning approach and liking scores. To do so, we need to combine the three product x respondent matrices.

<codeblock id="tuto_18"> 
</codeblock>

Run a Multiple Factor Analysis with the `MFA()` function pf the `FactoMineR` package, in order to see how consistent are the three different scores. Keep in mind that Liking scores were collected in order to assess the validity of our sentiment analysis and machine learning approaches: in a Free JAR protocol, hedonic scores are not collected.

<codeblock id="tuto_19"> 
</codeblock>

</exercise>

<exercise id="5" title="Act 5 - conclusion: teach me to do it myself!">

- If you want the R scripts or the data sets of this tutorial, you have to know first how to download a file from github:
    - Go to the file you want to download.
    - Click it to view the contents within the GitHub UI.
    - In the top right, right click the Raw button.
    - Save as...

- If you are looking for the R scripts:

https://github.com/Sebastien-Le/SensoryDataScience/

Then download the following files: orange.R, goji.R, sennheiser.R and carseat.R

- If you are looking for the data sets:

https://github.com/Sebastien-Le/SensoryDataScience/tree/master/data

- If you want to learn about R and Rstudio:

https://hbctraining.github.io/Intro-to-R-flipped/lessons/01_introR-R-and-RStudio.html

https://r-bootcamp.netlify.app/

https://rbasics.netlify.app/

https://philosopher-analyst.netlify.app/intro-r/

- If you want to learn about exploratory multivariate analysis and the FactoMineR package: 

http://factominer.free.fr/index.html

- If you want to know how to run usual statistical analyses with R: 

https://www.statmethods.net/index.html

- If you are looking for a good online book about R and data science:

https://r4ds.had.co.nz/

- If you are looking for a good online book about visualization:

https://ggplot2-book.org/

- If you want to find a free book about R: 

https://bookdown.org/

</exercise>