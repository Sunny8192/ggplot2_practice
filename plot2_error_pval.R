library(ggplot2)
library(ggprism)


# 1. load the data
df_raw = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug.csv")
df_stat = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/mouse_drug_stat.csv")
save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"

# 2. bar plot
df_raw_day1 = df_raw[which(df_raw$day == 1),]
df_stat_day1 = df_stat[which(df_stat$day == 1),]

barplot_day1 = ggplot(df_stat_day1, aes(x=group, y=weight_mean)) + 
    geom_col(aes(fill=group), width=0.8) + 
    geom_errorbar(aes(ymin=weight_mean-weight_std, ymax=weight_mean+weight_std, color=group), 
                  width=0.3, linewidth=1) + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, family="Arial"),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        axis.title.x=element_blank(),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial")
    ) + 
    scale_fill_manual("Group", values=c("black", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_color_manual("Group", values=c("black", "#CF1212"), labels=c("Control", "Drug")) + 
    scale_x_discrete("Group", expand=c(0.65, 0), labels=c("Control", "Drug")) + 
    scale_y_continuous("Weight (g)", expand=c(0, 0.5), breaks=seq(0, 50, 5), 
                       limits=c(NA, 42))

# add the p_value
t_test_results = t.test(weight ~ group, data=df_raw_day1)
p_value = t_test_results$p.value

p_value = signif(p_value, digits=4)

t_test_p_val = data.frame(group1="ctrl", group2="drug", label=p_value)

barplot_day1 = barplot_day1 + add_pvalue(t_test_p_val, y.position=40, bracket.size=0.8, 
                                         tip.length=0.02, label.size=4.5,
                                         fontfamily="Arial")

ggsave("barplot_day1_error.png", path=save_path, width=7.5, height=10, 
       units="cm", dpi=600, plot=barplot_day1)


# Practice

# plot day 3, and adjust the figure, such as p_value_position














