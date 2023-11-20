library(ggplot2)
library(ggprism)


# 1. load the data
df_raw = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug.csv")
df_stat = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug_stat.csv")
save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"

# 2. histogram plot
df_raw_ctrl_day1 = df_raw[which((df_raw$day == 1) & (df_raw$group == "ctrl")), ]

mean_weight = mean(df_raw_ctrl_day1$weight)

histplot_ctrl = ggplot(df_raw_ctrl_day1, aes(x=weight)) + 
    geom_histogram(binwidth=1, color="black", fill="grey", boundary = 0) + 
    geom_vline(xintercept=mean(mean_weight), linetype=2, color="red") + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, family="Arial"),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial")
    ) + 
    scale_x_continuous("Weight (g)", breaks=seq(0, 26, 1)) + 
    scale_y_continuous("Count", expand=c(0, 0), breaks=seq(0, 20, 5), 
                       limits=c(0, 20))


save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"
ggsave("histplot_ctrl.png", path=save_path, width=10, height=10, 
       units="cm", dpi=600, plot=histplot_ctrl)

# 3. density plot
histplot_ctrl_density = ggplot(df_raw_ctrl_day1, aes(x=weight, y=after_stat(density))) + 
    geom_histogram(binwidth=2, color="black", fill="grey", boundary=0) + 
    geom_density(linewidth=0.5, color="blue", linetype=2) + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, family="Arial"),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial")
    ) + 
    scale_x_continuous("Weight (g)", breaks=seq(0, 30, 2)) + 
    scale_y_continuous("Density (%)", expand=c(0, 0), breaks=seq(0, 2, 0.03), 
                       limits=c(0, 0.18))


ggsave("histplot_ctrl_density.png", path=save_path, width=10, height=10, 
       units="cm", dpi=600, plot=histplot_ctrl_density)


# Practice

# 1. add a mean line on the density in green

# 2. plot the drug_group on day 2




