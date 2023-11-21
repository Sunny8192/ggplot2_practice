library(ggplot2)


# 1. load the data
# df_raw = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug.csv")
# df_stat = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug_stat.csv")
# save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"

df_raw = read.csv("F:\\PhD_PQS\\ggplot_tutorial\\mouse_drug.csv")
df_stat = read.csv("F:\\PhD_PQS\\ggplot_tutorial\\mouse_drug_stat.csv")
save_path = "F:\\PhD_PQS\\ggplot_tutorial"

# 2. line plot
lineplot = ggplot(df_stat, aes(x=day, y=weight_mean)) + 
    geom_point(aes(color=group), size=1) + 
    geom_line(aes(color=group), linewidth=0.5) + 
    # geom_errorbar(aes(ymin=weight_mean-weight_std, ymax=weight_mean+weight_std, color=group), 
    #               width=0.3, linewidth=0.5) + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, family="Arial"),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial")
    ) + 
    scale_fill_manual("Group", values=c("black", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_color_manual("Group", values=c("black", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_x_continuous("Day", breaks=seq(0, 7, 1)) + 
    scale_y_continuous("Weight (g)", expand=c(0, 0), breaks=seq(0, 50, 5), 
                       limits=c(0, 40))



ggsave("lineplot.png", path=save_path, width=7.5, height=10, 
       units="cm", dpi=600, plot=lineplot)


# Practice

# 1. change the step of the y-axis: seq(0, 40, 10)

# 2. change the legend position to right, and adjust the size of the size of figure

# 3. add error bar












