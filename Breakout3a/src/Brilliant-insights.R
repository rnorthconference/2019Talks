# Brilliant insights!



# I can tell the difference between any of the different iris species!


# What does my dataset look like?
print(iris)

# Oooh too much data to understand all at once.  Let's take the means
# of all of the dimensions for each type of iris:
df_iris <- dplyr::group_by(iris, Species)
dplyr::summarise_all(df_iris, mean)


# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Wow!  It looks like setosa has different Petal dimensions!
# Well, at least according to the mean values.  Wouldn't it be
# nice if we could just see the points and see if anything pops?
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!





# We can see the points!  Here we plot it!
ggplot2::ggplot(iris) +
    ggplot2::geom_point(ggplot2::aes(Petal.Width, Petal.Length, color=Species)) +
    ggplot2::ggtitle("Holy Smokes Would You Look at This!")

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Good grief!  Not only did the setosas look really different, but it looks like:
# 
# - you can distinguish between the versicolors and virginicas too!
# - We should look at some pictures and see if this makes sense:


# Here's a picture of a setosa: https://images.app.goo.gl/LdheUNmY4HkJheco7
# Here's a picture of a versicolor: https://images.app.goo.gl/SiHB9WBHpo1J3w1v6
# Here's a picture of a virginica: https://images.app.goo.gl/X4LCa5TGxaujvUJK9
#
# It's... obvious?
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
