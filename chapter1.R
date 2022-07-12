<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> master
<HTML>
  <section class="accordion">
    <input type="checkbox" name="collapse2" id="handle2">
      <h2 class="handle">
        <label for="handle2">At second reading: mean and standard deviation</label>
          </h2>
          <div class="content">
            <p> Let's say you observe a bunch of random variables <img src="https://latex.codecogs.com/svg.image?X_i" style="margin-bottom : -0.25rem"/>, <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}" style="margin-bottom : -0.25rem"/>. From the realizations <img src="https://latex.codecogs.com/svg.image?\{ X_1, \dots, X_n \}" style="margin-bottom : -0.25rem"/>, you usually want to estimate the mean <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> of your variables, to get some insights on your population. To do so, you use an estimator of <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/>, usually <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i" style="margin-bottom : -1rem"/>. From this estimator (which is by the way a random variable), you can get an estimation of <img src="https://latex.codecogs.com/svg.image?\mu" style="margin-bottom : -0.25rem"/> by calculating <img src="https://latex.codecogs.com/svg.image?\bar{X}_n=\frac{1}{n}\sum X_i" style="margin-bottom : -1rem"/>. The standard deviation <img src="https://latex.codecogs.com/svg.image?\sigma" style="margin-bottom : -0.25rem"/> can be estimated using the following expression: <img src="https://latex.codecogs.com/svg.image?s = \sqrt{\frac{1}{n}\sum(x_i-\bar{x})^2}" style="margin-bottom : -1rem"/>.</p>
<p> <span style="font-weight : bold">Centering</span> the data is as important as it is simple, apparently. By definition, to center is to place in the middle. Centering is subtracting the average to each value that has been measured. In other words <img src="https://latex.codecogs.com/svg.image?x_i \leftarrow x_i-\bar{x}" style="margin-bottom : -0.25rem"/>, where <img src="https://latex.codecogs.com/svg.image?\bar{x}=\frac{1}{n}\sum x_i" style="margin-bottom : -1rem"/> is the average calculated over the <img src="https://latex.codecogs.com/svg.image?x_{i}" style="margin-bottom : -0.25rem"/>.</p>
<p>Understanding the idea of <span style="font-weight : bold">standardizing the data</span>, is the key to understanding statistics. You will see that standardized data will allow you to do compare variables that are not <i>a priori</i> comparable: am I bigger than you are small? You will be able to answer that question with standardized data. By definition, when data are standardized, their variance is equal to 1 (hence, their standard deviation is also equal to 1). In other words, let's consider a series <img src="https://latex.codecogs.com/svg.image?\{x_1,\dots,x_n\}" style="margin-bottom : -0.25rem"/>, <img src="https://latex.codecogs.com/svg.image?x_i \leftarrow \frac{x_i-\bar{x}}{s}" style="margin-bottom : -1rem"/>.</p>
  <p>By construction, standardized data have no unit of measurement. These values represent the number of standard deviation that separate an individual from the average individual. Knowing that with a normal distribution, 95% of the realizations lie between more or less 2 standard deviations (actually 1.96) from the average, when a standardized data is higher than 2 in absolute value, it means that the individual is quite peculiar regarding the variable of interest.</p>
  </div>
  </section>
  </HTML>
  


<<<<<<< HEAD
=======
>>>>>>> binder
>>>>>>> master
# Exo 1

# Exo 2

experts <- read.csv("data/perfumes_qda_experts.csv")

experts$Product <- as.factor(experts$Product)
experts$Panelist <- as.factor(experts$Panelist)
experts$Session <- as.factor(experts$Session)
experts$Rank <- as.factor(experts$Rank)
summary(experts)
levels(experts$Product)[4] <- "Cinéma"

library(ggplot2)
library(dplyr)


