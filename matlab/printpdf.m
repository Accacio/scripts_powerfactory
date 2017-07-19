
figure 
plot(simulation_data.All_calculations.b_tnow_in_s,simulation_data.C_2_29_MT_ind.m_Qsum_bus1_in_Mvar)
n_title='$\pi^{test}$'
title(n_title,'interpreter','latex')


set(gcf, 'PaperPosition', [0 0 8 8]) 
set(gca,'FontSize',10) 
set(gcf, 'PaperSize', [8 8]) 
saveas(gcf,['' regexprep(n_title,{' ';':';'\';'/';'?';'"';'<';'>';'|'},'_') '.pdf'])