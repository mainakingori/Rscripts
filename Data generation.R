# Generate two samples of body mass measurements of male peregrines
y10 <- rnorm(n=10, mean=600, sd=30) # Sample of 10 birds
y1000 <- rnorm(n =1000, mean=600, sd=30) # Sample of 1000 birds
# Plot data
xlim=c(450, 750)
par(mfrow, c(2,1))
hist(y10, col=("grey", xlim, main=('Body mass (g) of 10 male peregrines')
hist(y1000, col = 'grey', xlim = xlim, main = ' Body mass (g) of
     1000 male peregrines')