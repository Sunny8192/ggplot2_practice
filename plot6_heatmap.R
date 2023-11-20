library(ggplot2)


# 1. load the data
df_heatmap = read.csv("/media/windows11/PhD_PQS/ggplot_tutorial/gene_interaction.csv")
save_path = "/media/windows11/PhD_PQS/ggplot_tutorial"

# 2. heatmap
gene_heatmap = ggplot(df_heatmap, aes(x=gene_A, y=gene_B)) + 
    geom_tile(aes(fill=score)) + 
    theme(
        panel.background=element_blank(),
        axis.line=element_line(color="black", linewidth=0.5),
        axis.text=element_text(color="black", size=10, face="italic", family="Arial"),
        axis.text.x=element_text(angle=30, vjust=0.6),
        axis.title=element_text(color="black", size=15, face="bold", family="Arial"),
        legend.position="right",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial"),
        legend.key.width=unit(0.4, units="cm"),
        legend.key.height=unit(1.2, units="cm"),
    ) + 
    scale_fill_gradient2("Score", low="#81D6F9", mid="white", high="#F9B281", midpoint=0, 
                         breaks=seq(-1, 1, 0.5), limits=c(-1, 1)) +
    scale_x_discrete("Gene A", expand=c(0.05, 0)) + 
    scale_y_discrete("Gene B", expand=c(0.05, 0))

ggsave("gene_heatmap.png", path=save_path, width=13, height=10, 
       units="cm", dpi=600, plot=gene_heatmap)


# Practice

# change the colour scheme that you like


# Advanced
gene_heatmap_ad = ggplot(df_heatmap, aes(x=gene_A, y=gene_B)) + 
    geom_tile(aes(fill=score)) + 
    theme(
        panel.border=element_rect(color="black", linewidth=0.5, fill=NA),
        axis.line=element_blank(),
        axis.text=element_text(color="black", size=10, face="italic", family="Arial"),
        axis.text.x=element_text(angle=30, vjust=0.6),
        axis.title=element_blank(),
        legend.position="bottom",
        legend.title=element_text(color="black", size=12, face="bold", family="Arial"),
        legend.text=element_text(color="black", size=12, family="Arial"),
        legend.key.width=unit(1.2, units="cm"),
        legend.key.height=unit(0.4, units="cm"),
    ) + 
    guides(fill=guide_colorbar(title.position="bottom", label.position="bottom", 
                               title.hjust=0.5, ticks=FALSE, frame.colour="black", 
                               frame.linewidth=0.4)) + 
    scale_fill_gradient2("Score", low="#81D6F9", mid="white", high="#F9B281", midpoint=0, 
                         breaks=seq(-1, 1, 0.5), limits=c(-1, 1)) +
    scale_x_discrete("Gene A", expand=c(0.05, 0)) + 
    scale_y_discrete("Gene B", expand=c(0.05, 0))

ggsave("gene_heatmap_ad.png", path=save_path, width=11, height=13, 
       units="cm", dpi=600, plot=gene_heatmap_ad)



