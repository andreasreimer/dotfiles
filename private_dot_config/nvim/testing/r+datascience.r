# taken from: https://yards.albert-rapp.de/prelims

# 1 Preliminaries ----
## some intro into R, git and Rstudio

 # install.packages("datasauRus")
library(datasauRus)
library(tidyverse)
plot_data <- datasauRus::datasaurus_dozen 

show(datasaurus_dozen)

ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset)) +
    geom_point() +
    theme_void() +
    theme(legend.position = "none") +
    facet_wrap(~dataset, ncol = 3)


plot_data %>% 
  filter(dataset == 'dino') %>% 
  ggplot(mapping = aes(x = x, y = y), col = "black") +
  geom_point()

str(datasaurus_dozen)


# 2 Data Exploration ---- 

# install.packages("gapminder")
library(gapminder)

(tib <- gapminder)
str(tib)
head(tib)
colnames(tib)
range(tib$year)

library(tidyverse)
CurrentYear <- 2007

TibFiltered <- filter(tib, year == CurrentYear)
head(TibFiltered)

ggplot(data = TibFiltered)+
 geom_point(mapping = aes(x = lifeExp, y=gdpPercap))

ggplot(data = TibFiltered)+
 geom_point(mapping = aes(y = lifeExp, x=gdpPercap))


ggplot(data = TibFiltered)+
 geom_point(
	    mapping = aes(x = gdpPercap, y=lifeExp ),
	    color ="blue"
	    )

ggplot(data = TibFiltered)+
 geom_point(
	    mapping = aes(
			  x = gdpPercap,
			  y=lifeExp,
	    		  color = continent
	    		)
	    )

ggplot(data = TibFiltered)+
 geom_point(
	    mapping = aes(
			  x = gdpPercap,
			  y=lifeExp,
	    		  color = lifeExp
	    		)
	    )

country_filter <- c(
		    "Germany",
		    "Australia",
		    "United States",
		    "Afghanistan",
		    "Bangladesh"
		    )

selectedCountries <- tib %>%
	filter(country %in% country_filter)
selectedCountries

# AR version
ggplot(data = selectedCountries)+
	geom_line(
		  mapping = aes(
				x = year,
				y = lifeExp,
				color = country
				)
		  )
# AR version
ggplot(data = selectedCountries)+
	geom_line(
		  mapping = aes(
				x = year,
				y = lifeExp,
				color = country
				)
		  ) + 
	geom_point(
		  mapping = aes(
				x = year,
				y = lifeExp,
				color = country
				)
		  )

# shorted version with same result
ggplot(
  data = selectedCountries, 
  mapping = aes(x = year, y = lifeExp, color = country)
) +
  geom_line() +
  geom_point() 

# add-on: testing the "explore" package ----
# some nice package a came by on Twitter - good time to test it here
# install.packages("explore")
# more infos check link: https://cran.r-project.org/web/packages/explore/vignettes/explore.html
library(explore)
explore(tib)
describe(tib)
explore(iris)
describe(iris)

iris %>% explain_tree(target = Species)
selectedCountries %>% explain_tree(target = lifeExp)
tib %>% explain_tree(target = lifeExp)


# 2.2 Back to Data Exploration part 2 ----



ggplot( data = selectedCountries, aes(year, lifeExp, color = country)) +
  geom_line() +
  geom_point(aes(shape = continent)) 

ggplot(
	data = selectedCountries,
	mapping = aes(x = year, y = lifeExp, color = country)
	) +
	geom_point() + 
	stat_smooth() 


ggplot(
	data = selectedCountries,
	mapping = aes(x = year, y = lifeExp, color = country)
	) +
	geom_point() + 
	stat_smooth(method ="lm", se = FALSE) 

tib_2007 <- tib %>%
	filter( year == 2007)

ggplot(
	data = tib_2007,
	mapping = aes(x = lifeExp)
	)+
	geom_histogram()


ggplot(
	data = tib_2007,
	mapping = aes(x = lifeExp)
	)+
	geom_histogram(binwidth = 3)

  
ggplot(
	data = tib_2007,
	mapping = aes(x = lifeExp)
	)+
	geom_histogram(binwidth = 3, aes(fill = continent))

ggplot(
	data = tib_2007,
	mapping = aes(x = lifeExp)
	)+
	geom_histogram(
	  mapping = aes(fill = continent),
	  binwidth = 5, 
	  position = "dodge"
	  )


ggplot(
	data = tib_2007,
	mapping = aes(x = lifeExp)
	)+
  stat_density(
    
	  mapping = aes(fill = continent),
   position = "identity",
   alpha = 0.4
  )

ggplot(
	data = tib_2007,
	mapping = aes(y = lifeExp)
	)+
  geom_boxplot()

ggplot(
	data = tib_2007,
	mapping = aes(y = lifeExp, color = continent)
	)+
  geom_boxplot()

ggplot(
	data = tib_2007,
	mapping = aes(y = lifeExp, color = fct_reorder(continent, lifeExp))
	)+
  geom_boxplot()

ggplot(
	data = tib_2007,
	mapping = aes(x = lifeExp, fill = continent)
	)+
	geom_histogram()+
  facet_wrap(vars (continent))

tib_1952_2007 <- tib %>%
  filter(year %in% c(1952,2007))

ggplot(
	data = tib_1952_2007,
	mapping = aes(x = lifeExp, fill = continent)
	)+
	geom_histogram(bins = 6)+
  facet_grid(cols = vars(year), rows = vars(continent))

ggplot(
	data = tib_2007,
	mapping = aes(y = lifeExp, color = fct_reorder(continent, lifeExp))
	)+
	labs(title = "Distribution of Life Expectancies", 
	subtitle = "this is a subtitle",
	y = "life expectancy",
	color = "Continent")+
  geom_boxplot()



g <- ggplot(
	data = tib_1952_2007,
	mapping = aes(x = lifeExp, fill = continent)
	)+
	geom_histogram(bins = 6)+
  facet_grid(cols = vars(year), rows = vars(continent))

g +
  theme(legend.position = "none")

g +
  theme(legend.position = "bottom")


p <- ggplot(data = tib_2007) +
  geom_point(
    mapping = aes(
      x = gdpPercap, 
      y = lifeExp,
      color = continent,
      size = pop
    )
  )
p

p + guides(size = "none")

p +
	labs(
	     x = "GDP per Captia",
	     y = "life expectancy",
	     color = "Continent",
	     title = "GDP per Captia vs. Life Expectancy in 2007",
	     subtitle = "the siye of the bubbles relates to a country's population"
	     ) +
       guides(size = "none") + 
       theme(legend.position = "bottom")


selectedCountries_2007 <- selectedCountries %>%
	filter(year == 2007)

ggplot(
       data = tib_2007,
       mapping = aes(
		     x = gdpPercap,
		     y = lifeExp,
		     color = continent 
		     )
       ) +
       geom_point(mapping = aes(size = pop)) +
       guides(size = "none") +
       geom_label(
		 data = selectedCountries_2007,
		 mapping = aes(label = country), 
		 show.legend = FALSE 
		 )




ggplot(
       data = tib_2007,
       mapping = aes(
		     x = gdpPercap,
		     y = lifeExp,
		     color = continent 
		     )
       ) +
       geom_point(mapping = aes(size = pop)) +
       guides(size = "none") +
       ggrepel::geom_label_repel(
		 data = selectedCountries_2007,
		 mapping = aes(label = country), 
		 show.legend = FALSE 
		 )

	# installed.packages("ggrepel")


ggplot(
       data = tib_2007,
       mapping = aes(
		     x = gdpPercap,
		     y = lifeExp,
		     color = continent 
		     )
       ) +
       geom_point(mapping = aes(size = pop)) +
       guides(size = "none") +
       ggrepel::geom_label_repel(
		 data = selectedCountries_2007,
		 mapping = aes(label = country), 
		 box.padding = 3.5,
		 point.padding = 0.5,
		 show.legend = FALSE 
		 )

ggplot(
       data = tib_2007,
       mapping = aes(
		     x = gdpPercap,
		     y = lifeExp,
		     color = continent 
		     )
       ) +
       geom_point() +
       theme_bw()

ggplot(
       data = tib_2007,
       mapping = aes(
		     x = gdpPercap,
		     y = lifeExp,
		     color = continent 
		     )
       ) +
       geom_point() +
       theme_bw() + 
       # change text settings of axis label
       theme(axis.title = element_text(size = 14, face = "bold")) + 
       # change panel background color to 
       theme(panel.background = element_rect(fill = "pink"))


# next chapter is 2.4.3 Scales 

ggplot(
  data = tib_2007,
  mapping = aes(
      x = gdpPercap,
      y = lifeExp,
      color = continent)
) + 
  geom_point(mapping = aes(size = pop))

ggplot(
  data = tib_2007,
  mapping = aes(
      x = gdpPercap,
      y = lifeExp,
      color = continent)
) + 
  geom_point(mapping = aes(size = pop))+
  scale_x_continuous(trans = "log10")+
  guides(size="none") +
  scale_y_continuous() +
    scale_color_discrete() +
    scale_size_continuous()

ggplot(
  data = tib_2007,
  mapping = aes(
      x = gdpPercap,
      y = lifeExp,
      color = continent)
) + 
  geom_point(mapping = aes(size = pop))+
  scale_x_continuous(trans = "sqrt", breaks =c(2500, 5000, 10000))+
  guides(size="none") +
  scale_y_continuous() +
    scale_color_discrete() +
    scale_size_continuous()


ggplot(
  data = tib_2007,
  mapping = aes(
      x = gdpPercap,
      y = lifeExp,
      color = continent)
) + 
  geom_point(mapping = aes(size = pop))+
  scale_x_continuous(trans = "sqrt", breaks =c(2500, 5000, 10000))+
  guides(size="none") +
  scale_y_continuous(labels = scales::percent) +
    scale_color_brewer() +
    scale_size_continuous()

p <- ggplot (
  data = tib_2007 ,
  mapping = aes (
    x = gdpPercap ,
    y = lifeExp ,
    color = continent )
) +
  geom_point ( mapping = aes ( size = pop ) ) +
  guides ( size = "none" )

p + scale_color_brewer ( palette = "Set1" )
p + scale_color_brewer ( palette = "Dark2" )
p + scale_color_brewer ( palette = "Paired" )

# custom color gradient über Alter - siehe hier
ggplot(
  data = tib_2007,
  mapping = aes(
    x = gdpPercap,
    y = lifeExp,
    color = lifeExp)
) +
  geom_point() +
  scale_color_gradient(low= "orangered2", high = "seagreen3")

# 2.5.1 
ggplot(
  data = mpg,
  mapping = aes(
    x = displ,
    y = hwy)
)+
  geom_point()
# the plot shows fuel consumption on the highway 
# on the y axis and the engine displacement in litres on the x axis
# smaller engines have higher and better mpg / overall fuel cunsumption.


ggplot(
  data = mpg,
  mapping = aes(
    x = displ,
    y = hwy)
)+
  geom_jitter()

# with jitter the points are slightly moved, so you can better see where 
# you have a lot o meassurements.

# 2.5.2 facets
# task: use mpg dataset, show hwy on y axis, show cty on x axis, 
# facet group 1999 and 2008 left and right next to each other
# facet group 4, front, rear driven cars from top to bottom

ggplot(
  data = mpg,
  mapping = aes(
    x = cty,
    y = hwy)
)+
  geom_jitter(color = "blue") + 
  facet_grid(cols = vars(year), rows = vars(drv))

ggplot ( data = tib_2007 ,
  mapping = aes (
    x = lifeExp , fill = continent ) ) +
  geom_histogram (positi )
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.


print

formatC
