	# Chapter 3
	library(tidyverse)


# Object Browser
#   . Open/Close                                         \ro
#   . Expand (all lists)                                 \r=
#   . Collapse (all lists)                               \r-
#   . Toggle (cur)                                     Enter
# -----------------------------------------------------------

# tib <- read.csv(file ="data/internetusers.csv", header = TRUE, sep = ";", fill = TRUE)
setwd("/Users/andreas/terminal/github/Rstats-tools-projects/009-2022-08-30-albert-rapp-r-tutorial")
tib <- read_csv2(file ="data/internetusers.csv")
head(tib)
tib$Countries[1:236]

country_filter <- c(
  "Germany",
  "Australia",
  "United States",
  "Russian Federation",
  "Afghanistan"
)

(tib_filtered <- tib %>% 
  filter(Countries %in% country_filter))

range(tib[,-1])

tib_filtered_rearranged <- tib_filtered %>% 
  pivot_longer(
    cols = -Countries,
    names_to = "year",
    values_to = "percentage"
      ) %>% 
  mutate(year = as.numeric(year))
tib_filtered_rearranged



tib_filtered_rearranged %>%
		mutate(centry = round(year / 10), d=0) %>%
		filter(Countries == "Germany") %>%
	count(centry)

tib_filtered_rearranged %>%
	count(year) %>%
#	group_by(Countries) %>%
	print(n=30)


tib_filtered_rearranged %>% 
  ggplot(aes(year, percentage, col = Countries))+
  geom_point() +
  geom_line() +
  coord_cartesian(ylim = c(0,100))

# # tidy data is:
# Each variable has its own column.
# Each observation has its own row.
# Each value has its own cells.

# animation to show wide and long data: 
# https://github.com/gadenbuie/tidyexplain/blob/main/images/tidyr-spread-gather.gif


---
  
# 3.2 Access to Tibbles
  
dummy <- tibble(
  variable1 = c(100, 200, 300, 500, 234),
  name2 = c(2, 4, 6, 8, 10),
  column3 = c(1, 1, 1, 1, 1)
)
dummy

# tibble specifies columnwise
# tribble specifies rowwise

dummy <- tribble(
  ~variable1, ~name2, ~column3,
  100, 2,  1,
  200, 4,  1,
  300, 6,  1,
  500, 8,  1,
  234, 10, 1
)
dummy

# some nice function on the tibble from dplyr are slice

slice(dummy, c(2,4,5))
slice_head(dummy, n=3)
head(dummy)
slice_max(dummy, variable1, n=2) # show rows with max values
slice_sample(dummy,n=2) # random 2 rows - changes every time

# tidyselect::language to see help
select(dummy, variable1)
select(dummy, c(variable1, name2))
pull(dummy,variable1) # outputs a vector in one row
dummy$variable1 # same as pull + what?
select(dummy, variable1, column3)
select(dummy, -variable1)

dummy[1,2]  # returns tibble
dummy[[1,2]] # returns vector
dummy[c(1,3),2:3]
dummy[[c(1,3),2:3]]


# 3.3 Mutate tibbles
 
  
   
dplyr::mutate(dummy, FourthName = variable1 + name2)
dummy
dummy <- mutate(
  dummy,
  Fourth = variable1 + name2,
  Fifth = 2 * Fourth
)

# same function, but piped

dummy <- dummy %>% 
  mutate(
    Fourth = variable1 + name2,
    Fifth = 2 * Fourth
  )

dummy %>%  
  mutate(across(.cols = variable1:column3, .fns = as.factor))

dummy %>%
	slice_head(n=3)

# =======
tribble(
  ~a, ~b,
  1, 3,
  2, 4,
  3, 5
) %>%
  mutate(minimum = min(a, b))

# why do we get "wrong" min values, we took the wrong funtion or did not
# understad how R handles this tibble. For the calculation it sends out all the
# numbers as a factor. The right function on tibble is "pmin".


tribble(
  ~a, ~b,
  1, 3,
  2, 4,
  3, 5
) %>%
  mutate(minimum = pmin(a, b))

# 3.3.2 Small Case Study

(tib <- cars %>% as_tibble())

t_pr <- 1.5
mu <- 0.7
g <- 32.17405
# (
#  tib %>% mutate(
# 		CalcDist = speed * t_pr + speed * speed / 2 * mu * g * 3600 / 5280
#  )
# )

tib_model <- tibble(
		    ftps = 1:50,
		    mpg = ftps * 3600 / 5280,
		    dist_model =  ftps * t_pr + ftps^2 / (2 * mu * g)
		    )

ggplot() + 
	geom_point(data = tib, aes(speed, dist)) +
	geom_line(data = tib_model, aes(ftps, dist_model), col = "Red") +
	xlim(c(0,35)) +
	labs(
	     x = "Speed (in mph)",
	     y = "Distance to brake",
	     title = "brake experiment vs. calc"
	     )

error <- tib %>% 
	mutate(
	       speed_ftps = speed * 5280 / 3600,
	       dist_model = speed_ftps * t_pr + speed_ftps^2 / (2 * mu * g),
	       sqError = (dist - dist_model)^2,
	       absError = sqrt(sqError),
	       absError2 = abs(dist - dist_model)
)
error
( MSE <- error %>% pull(sqError) %>% mean())
(RMSE <- sqrt(MSE))
(MAE <- error %>% pull(absError) %>% mean())



## copy-pasta to get tib2007 once more into here

library(gapminder)

(tib <- gapminder)

tib_2007 <- tib %>%
	filter( year == 2007)

tib_2007 %>% pull(lifeExp) %>% median()
summary(tib_2007)
summarise(tib_2007,
	  mean_lifeExp = mean(lifeExp),
	  median_lifeExp = median(lifeExp),
	  lowerQ = quantile(lifeExp,0.25),
	  higherQ = quantile(lifeExp, 0.75)
)

tib_2007 %>%
	summarise(
		  across(.cols = lifeExp:gdpPercap, .fns = mean)
		  )

tib_2007 %>%
	group_by(continent) %>%
	summarise(n = n())

table(tib_2007$continent)

tib_2007 %>%
	count(continent)

tib_2007 %>%
	group_by(continent) %>% 
	summarise(
		  mean = mean(lifeExp),
		  lowerQ = quantile(lifeExp, 0.25),
		  higherQ = quantile(lifeExp, 0.75),
		  n = n()
		  )

summary_evolution <- gapminder::gapminder %>%
  group_by(continent, year) %>% 
  summarise(
    mean = mean(lifeExp),
    lowerQuartile = quantile(lifeExp, 0.25),
    upperQuartile = quantile(lifeExp, 0.75),
    .groups = "drop"
  )
summary_evolution

ggplot(data = summary_evolution, mapping = aes(x = year, y= mean)) +
  geom_point() +
  geom_line() + 
  facet_wrap(vars(continent))


ggplot(data = summary_evolution,
       mapping = aes(x = year, y= mean, color = continent)) +
#  geom_point() +
  geom_ribbon(aes(ymin = lowerQuartile, ymax = upperQuartile, fill = continent, alpha = 0.1)) +
  geom_line() + 
  facet_grid(cols = vars(continent))


# 3.4.2 Remaining Groupings




  # if you group your data, that grouping stays until you drop the group. 


summary_evolution <- gapminder::gapminder %>%
	group_by(continent, year) %>%
	summarise(
	  mean = mean(lifeExp),
	  lowerQuartile = quantile(lifeExp, 0.25),
	  upperQuartile = quantile(lifeExp, 0.75),

	)

summary_evolution %>%
	slice(1)

tib_2007 %>%
	group_by(continent) %>%
	slice_min(lifeExp)

summary_evolution %>% 
	mutate(newCol = mean(lowerQuartile)) %>%
	slice(1) %>%
	select(-lowerQuartile, -upperQuartile)

# install.packages("nycflights13")
library(nycflights13)
flights

(flights_selection <- flights %>%
 select(year:dep_time, origin, dest))

flights_selection
airports
origin_join <- left_join(flights_selection, airports, by = c("origin"="faa"))
origin_join %>% slice(2)
dest_join <- origin_join %>%
	left_join(airports, by = c("dest" = "faa"))

dest_join %>% slice(3)
dest_join <- dest_join %>%
	rename(
	       OriginF = name.x,
	       DestinationF = name.y
	       )
dest_join

delays <- flights %>% select(year:dep_delay)

delays %>% 
	mutate(across( .fns = is.na)) %>%
	summarise(across( .fns = sum))

delays_departed <- delays %>% drop_na(dep_time)
delays_departed

summaries_delay <- delays_departed %>%
	group_by(year, month, day) %>%
	summarise(
		  min = min(dep_delay),
		  max = max(dep_delay),
		  upperQ = quantile(dep_delay, 0.75),
		  lowerQ = quantile(dep_delay, 0.25),
		  mean = mean(dep_delay),
		  median = median(dep_delay),
		  n = n(),
		  .groups = "drop"
		  ) %>%
	pivot_longer(
		     -(year:day),
		     values_to = "value",
		     names_to = "summary"
	) %>%
	mutate(date = lubridate::make_date(year, month, day))
summaries_delay

summaries_delay %>%
	filter(summary != "n") %>%
	ggplot(aes(x= date, y = value, col = summary)) +
	geom_line(show.legend = FALSE) +
	facet_wrap(vars(summary), scale = "free_y") +
	# free_y makes y/axis of facets variable 
	scale_x_date(date_labels = "%m")+
	labs(
	     x = "Month",
	     y = "Delay in min"
	     ) +
	theme_bw()


# Exersie further

# Order of summaries Copy 
summary_levels <- c(
  "min",
  "lowerQ",
  "median",
  "mean",
  "upperQ",
  "max"
)
summaries_delay %>%
  filter(summary != "n") %>%
  mutate(summary = factor(summary, levels = summary_levels)) %>%
  ggplot(aes(x = date, y = value, col = summary)) +
  geom_line(show.legend = F, alpha = 0.35) +
  geom_smooth(show.legend = F, se = F, span = 0.1, size = 1) +
  facet_wrap(vars(summary), scale = "free_y") +
  scale_x_date(date_labels = "%m") +
  labs(
    x = "Month",
	    y = "Delay (in min)" )+
  theme_bw()
	#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'


summaries_delay %>% 
	filter(!(summary %in% c("n", "min", "max", "mean"))) %>%
	ggplot(aes(x = date, y = value, col = summary))+
	geom_smooth(span = 0.1) +
	geom_hline(yintercept = 0, linetype = 2) +
	theme_bw() +
	theme(legend.position = "bottom") +
	labs(x = "Month", y = "Delay") +
	scale_x_date(
		     date_breaks = "1 month",
		     date_labels = "%m"
		     )


weather %>% 
print(n = 25)

weather %>% 
	mutate(across( .fns = is.na)) %>%
	summarise(across( .fns = sum))

# use also weather data to check if visibility of hourly weather data has influence on delays
visib_data <- weather %>%
	select(origin:hour, visib) 

flights_departed <- flights %>%
	select(year:dep_delay, hour, origin) %>%
	filter(!is.na(dep_time))

flights_visib <- left_join(
	flights_departed,
	visib_data)
)

flights_visib %>% 
	ggplot(aes(x = date, y = visib, col = summary))+
	geom_smooth(span = 0.1) +
	geom_hline(yintercept = 0, linetype = 2) +
	theme_bw() +
	theme(legend.position = "bottom") +
	labs(x = "Month", y = "Delay") +
	scale_x_date(
		     date_breaks = "1 month",
		     date_labels = "%m"
		     )


flights_visib %>%
	mutate(across(.fns = is.na)) %>%
	summarise(across(.fns = sum))

flights_visib2 <- flights_visib %>%
	drop_na(visib)

flights_visib <- flights_visib %>%
	filter(!is.na(visib))

avg_delays <- flights_visib %>%
	group_by(visib, origin) %>%
	summarise(avg_delay = median(dep_delay), .groups = "drop")
avg_delays

avg_delays %>%
	ggplot(aes(x = visib, y = avg_delay, col = origin)) +
	geom_point()

avg_delays %>% 
	ggplot() +
	geom_point(
	  aes(x = visib, y = avg_delay, col = origin)
	) +
	geom_smooth(
	  aes(x = visib, y = avg_delay),
	  method = "lm",
	  col = "black"
	) + 
	labs(
	  x = "Visibilitz (in miles)",
	  y = "Average Delay (in minutes)"
	  )
	
# 3.7 Exercises
?tidyselect::language 

df <- gapminder::gapminder

# all variables that start with "c"
df %>% select(starts_with("c"))

# whose variables start with "c" or end with "p"
( df %>% select(starts_with("c") | ends_with("p")))

# contain "t"
( df %>% select(contains("t")) )

# which are of type factor 
( df %>% select(where(is.factor)) )

# which are not of type factor 
( df %>% select(!where(is.factor)) )

df
# GDP between 600 and 2000
( df %>% filter(., gdpPercap < 2000 & gdpPercap > 600) )

# life Expec below 60 in 1990
( df %>% filter(
	year > 1990 & year < 2000,
	lifeExp < 60 ) )

# America Countries whose names start with "U" before 1980

	



