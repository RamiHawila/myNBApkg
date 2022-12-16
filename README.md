
<!-- README.md is generated from README.Rmd. Please edit that file -->

# myNBApkg

<!-- badges: start -->
<!-- badges: end -->

## Overview

This package was designed as part of a final project for Biostatistical
Computing with the goal of assisting in performing computations of
summary statistics, illustrations, and models to better understand NBA
seasonal data.

## Installation

You can install the development version of myNBApkg from
[GitHub](https://github.com/RamiHawila/myNBApkg) with:

``` r
# install.packages("devtools")
devtools::install_github("RamiHawila/myNBApkg")
```

## Load the package

``` r
library(myNBApkg)
```

## Example

This is a basic example which will illustrate the usage of the different
available functions.

### Player-level exploration

We will use the functions below to describe the performance of Stephen
Curry based on the 2022-2023 NBA season. The first table demonstrates a
number of Stephen’s statistics. The true shooting percentage, free throw
rate, assists, and turnover rates are also demonstrated using the
functions.

``` r
player_basic_stats(player="Stephen Curry", data=DATASET)
#>          Player    Position Team Field Goals Total Rebounds Assists Steals
#> 1 Stephen Curry Point Guard  GSW        10.7            6.8     7.1    1.2
#>   Blocks Turnovers Personal Fouls
#> 1    0.2       2.9              2
true_shooting_percentage(player="Stephen Curry", data=DATASET)
#> The true shooting percentage for Stephen Curry is 68.8%
free_throw_rate(player="Stephen Curry", data=DATASET)
#> The free throw rate for Stephen Curry is 25.9%
basic_stats_rate(player="Stephen Curry", data=DATASET)
#> The assists and turnover rates of Stephen Curry are 34.1% and 11.3% respectively.
```

### Position-level exploration

We will use the functions below to describe the characteristics of the
Point Guard position based on the 2022-2023 NBA season. The first table
demonstrates a number of the statistics associated with point guards
including field goals, rebounds, assists, etc. In the second table, the
top 5 point guards in terms of scoring points are shown. A barplot is
presented comparing the Points scored for different positions.

``` r
position_stats(position = "Point Guard", data = DATASET)
#>      Position Field Goals Total Rebounds  Assists Steals    Blocks Turnovers
#> 1 Point Guard    4.117105       3.036842 4.256579  0.925 0.3171053  1.714474
#>   Personal Fouls
#> 1       1.811842
position_best(position = "Point Guard", measure = "PTS", topn = 5,data = DATASET)
#>            Player  Tm    Position  PTS
#> 19    Luka Dončić DAL Point Guard 33.1
#> 15  Stephen Curry GSW Point Guard 31.4
#> 50      Ja Morant MEM Point Guard 28.5
#> 76     Trae Young ATL Point Guard 28.2
#> 40 Damian Lillard POR Point Guard 26.3
plot_basic_stats(measure="PTS",data=DATASET)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

### Modelling of Free Throw Percentage and Minutes Played

We will use the function below to model the free throw success rate and
minutes played based on the 2022-2023 NBA season. This function produces
a table that summarizes the linear regression fit. Based on the results
from the first table, we can see that field goals have a significantly
negative impact on the free throw rates, where as effective field goals
percentage and point scored have a significantly positive impact on the
free throw rates. Based on the results from the second table, the
position played in addition to age, personal fouls, and points scored
had significant positive impact on the number of minutes played.

<div id="psefzvwulk" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">


<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}


</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <td colspan="4" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Linear regression summary modelling Free Throw Percentage per game</td>
    </tr>
    
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Beta&lt;/strong&gt;"><strong>Beta</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;95% CI&lt;/strong&gt;&lt;sup class=&quot;gt_footnote_marks&quot;&gt;1&lt;/sup&gt;"><strong>95% CI</strong><sup class="gt_footnote_marks">1</sup></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;p-value&lt;/strong&gt;"><strong>p-value</strong></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Position</td>
<td headers="estimate" class="gt_row gt_center"></td>
<td headers="ci" class="gt_row gt_center"></td>
<td headers="p.value" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Center</td>
<td headers="estimate" class="gt_row gt_center">—</td>
<td headers="ci" class="gt_row gt_center">—</td>
<td headers="p.value" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Point Guard</td>
<td headers="estimate" class="gt_row gt_center">0.02</td>
<td headers="ci" class="gt_row gt_center">-0.03, 0.07</td>
<td headers="p.value" class="gt_row gt_center">0.4</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Power Forward</td>
<td headers="estimate" class="gt_row gt_center">0.01</td>
<td headers="ci" class="gt_row gt_center">-0.04, 0.06</td>
<td headers="p.value" class="gt_row gt_center">0.7</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Shooting Guard</td>
<td headers="estimate" class="gt_row gt_center">0.04</td>
<td headers="ci" class="gt_row gt_center">-0.01, 0.09</td>
<td headers="p.value" class="gt_row gt_center">0.10</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Small Forward</td>
<td headers="estimate" class="gt_row gt_center">0.04</td>
<td headers="ci" class="gt_row gt_center">-0.01, 0.09</td>
<td headers="p.value" class="gt_row gt_center">0.2</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">FG</td>
<td headers="estimate" class="gt_row gt_center">-0.10</td>
<td headers="ci" class="gt_row gt_center">-0.14, -0.06</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">eFG.</td>
<td headers="estimate" class="gt_row gt_center">0.20</td>
<td headers="ci" class="gt_row gt_center">0.01, 0.38</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;">0.036</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">PTS</td>
<td headers="estimate" class="gt_row gt_center">0.04</td>
<td headers="ci" class="gt_row gt_center">0.03, 0.06</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><sup class="gt_footnote_marks">1</sup> CI = Confidence Interval</td>
    </tr>
  </tfoot>
</table>
</div>
<div id="lllhlnqmid" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}


</style>
<table class="gt_table">
  <thead class="gt_header">
    <tr>
      <td colspan="4" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Linear regression summary modelling Minutes Played per game</td>
    </tr>
    
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Characteristic&lt;/strong&gt;"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;Beta&lt;/strong&gt;"><strong>Beta</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;95% CI&lt;/strong&gt;&lt;sup class=&quot;gt_footnote_marks&quot;&gt;1&lt;/sup&gt;"><strong>95% CI</strong><sup class="gt_footnote_marks">1</sup></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="&lt;strong&gt;p-value&lt;/strong&gt;"><strong>p-value</strong></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Position</td>
<td headers="estimate" class="gt_row gt_center"></td>
<td headers="ci" class="gt_row gt_center"></td>
<td headers="p.value" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Center</td>
<td headers="estimate" class="gt_row gt_center">—</td>
<td headers="ci" class="gt_row gt_center">—</td>
<td headers="p.value" class="gt_row gt_center"></td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Point Guard</td>
<td headers="estimate" class="gt_row gt_center">6.0</td>
<td headers="ci" class="gt_row gt_center">4.3, 7.7</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Power Forward</td>
<td headers="estimate" class="gt_row gt_center">3.2</td>
<td headers="ci" class="gt_row gt_center">1.8, 4.5</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Shooting Guard</td>
<td headers="estimate" class="gt_row gt_center">5.3</td>
<td headers="ci" class="gt_row gt_center">3.7, 6.9</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-style: italic;">    Small Forward</td>
<td headers="estimate" class="gt_row gt_center">5.4</td>
<td headers="ci" class="gt_row gt_center">3.8, 7.0</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">Age</td>
<td headers="estimate" class="gt_row gt_center">0.14</td>
<td headers="ci" class="gt_row gt_center">0.05, 0.23</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;">0.002</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">FG.</td>
<td headers="estimate" class="gt_row gt_center">-4.7</td>
<td headers="ci" class="gt_row gt_center">-9.8, 0.38</td>
<td headers="p.value" class="gt_row gt_center">0.070</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">ORB</td>
<td headers="estimate" class="gt_row gt_center">0.75</td>
<td headers="ci" class="gt_row gt_center">-0.07, 1.6</td>
<td headers="p.value" class="gt_row gt_center">0.072</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">DRB</td>
<td headers="estimate" class="gt_row gt_center">1.1</td>
<td headers="ci" class="gt_row gt_center">0.71, 1.5</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">PF</td>
<td headers="estimate" class="gt_row gt_center">2.9</td>
<td headers="ci" class="gt_row gt_center">2.3, 3.5</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
    <tr><td headers="label" class="gt_row gt_left" style="font-weight: bold;">PTS</td>
<td headers="estimate" class="gt_row gt_center">0.72</td>
<td headers="ci" class="gt_row gt_center">0.64, 0.81</td>
<td headers="p.value" class="gt_row gt_center" style="font-weight: bold;"><0.001</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><sup class="gt_footnote_marks">1</sup> CI = Confidence Interval</td>
    </tr>
  </tfoot>
</table>
</div>
