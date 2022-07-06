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

<exercise id="1" title="From classes to categories">
  
By definition, a class is "a set or category of things having some property or attribute in common and differentiated from others by kind, type, or quality". In the same way, a category is "a class or division of people or things regarded as having particular shared characteristics". In this chapter, the notion of categorical variable is first introduced using a survey in which people are asked about their perceptions of genetically modified organisms.

<codeblock id="02_01">
</codeblock>

<codeblock id="02_02">
</codeblock>

<codeblock id="02_03">
</codeblock>

<codeblock id="02_04">
</codeblock>

</exercise>

<exercise id="2" title="From categories to categorical data">

<codeblock id="02_05">
</codeblock>

<codeblock id="02_06">
</codeblock>

<codeblock id="02_07">
</codeblock>

<codeblock id="02_08">
</codeblock>

<codeblock id="02_09">
</codeblock>

</exercise>

<exercise id="3" title="From categorical data to contingency table">
</exercise>

<exercise id="4" title="From contingency table to the notion of independence">
</exercise>

<exercise id="5" title="From the independence to its deviation">

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