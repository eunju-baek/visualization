#al = data.frame

library(dplyr)

#percnetile grouping

al <- al %>% mutate(percnetile = ntile(gps,100))

#summarise residual variance per variables

all <- al %>% group_by(percentile) %>% summarise_at(vars(a_alc:resi),var)

#From a_alc to resi means residuals columns each for GxE and GPS

al
# A tibble: 100 횞 12
   percentile a_alc gxe_alc a_tdi gxe_tdi a_walk gxe_walk a_mpa gxe_mpa a_vpa
        <int> <dbl>   <dbl> <dbl>   <dbl>  <dbl>    <dbl> <dbl>   <dbl> <dbl>
 1          1  6.15    5.79  5.97    5.62   5.78     5.67  5.82    5.66  5.86
 2          2  6.65    6.25  6.39    6.27   6.43     6.23  6.41    6.22  6.39
 3          3  7.68    7.15  7.44    7.15   7.34     7.15  7.18    7.12  7.21
 4          4  7.38    6.98  7.22    6.96   7.00     6.94  7.01    6.93  7.09
 5          5  7.98    7.46  7.72    7.48   7.53     7.48  7.59    7.48  7.60
 6          6  7.78    7.58  7.81    7.55   7.64     7.55  7.63    7.53  7.68
 7          7  7.58    7.23  7.33    7.27   7.30     7.23  7.32    7.22  7.35
 8          8  8.35    7.93  8.16    7.95   7.95     7.90  7.92    7.88  8.01
 9          9  8.09    7.77  7.88    7.81   7.72     7.72  7.81    7.74  7.88
10         10  8.39    7.88  8.00    7.89   8.10     7.91  7.99    7.86  7.97
# ??with 90 more rows, and 2 more variables: gxe_vpa <dbl>, resi <dbl>


#we need to transform as input data for variance scatter plot

all2 <- all %>% gather('gxe_alc','gxe_tdi','gxe_walk',,'gxe_mpa','resi',key='case',value='variance')

all2
# A tibble: 900 횞 4
   percentile gxe_vpa case  variables
        <int>   <dbl> <chr>     <dbl>
 1          1    5.68 a_alc      6.15
 2          2    6.22 a_alc      6.65
 3          3    7.16 a_alc      7.68
 4          4    6.96 a_alc      7.38
 5          5    7.48 a_alc      7.98
 6          6    7.54 a_alc      7.78
 7          7    7.22 a_alc      7.58
 8          8    7.91 a_alc      8.35
 9          9    7.76 a_alc      8.09
10         10    7.86 a_alc      8.39
# ??with 890 more rows

#Only two groups left for comparison

vpa <- all3[all2$case=="gxe_vpa"|all2$case=="resi",]
vpa <- data.frame(vpa)

ggplot(vpa,aes(x=percentile,y=variance,color=case,shape=case))+geom_point(size=4)+theme(legend.title=element_blank())+scale_color_manual(values=c('red','blue'))

