
figure 
plot(all_data.All_____calculations.b___tnow_____in_____s,...
    all_data.C_____2____29_____MT_____ind.m___Psum___bus1_____in_____MW,...
    all_data.All_____calculations.b___tnow_____in_____s,...
    all_data.C_____2____29_____MT_____ind.m___Qsum___bus1_____in_____Mvar)
n_title='Puissance Active et Reactive de la Charge C2.29 MT';
title(n_title,'interpreter','latex')
legend('Puissance Active','Puissance Reactive')

set(gcf, 'PaperPosition', [0 0 8 8]) 
set(gca,'FontSize',8) 
set(gcf, 'PaperSize', [8 8]) 
saveas(gcf,['' regexprep(n_title,{'\.';' ';':';'\';'/';'?';'"';'<';'>';'|'},'_') '.pdf'])


%%
figure 
plot(all_data.All_____calculations.b___tnow_____in_____s,...
    all_data.N21______N21_____DG.m___u1_____in_____p__u__,...
    all_data.All_____calculations.b___tnow_____in_____s,...
    all_data.N23______N23_____DG.m___u1_____in_____p__u__,...
    all_data.All_____calculations.b___tnow_____in_____s,...
    all_data.N29______N29_____DG.m___u1_____in_____p__u__)
n_title='Tension des Bus N21 N23 et N29';
title(n_title,'interpreter','latex')
legend('N21','N23','N29')

set(gcf, 'PaperPosition', [0 0 8 8]) 
set(gca,'FontSize',8) 
set(gcf, 'PaperSize', [8 8]) 
saveas(gcf,['' regexprep(n_title,{'\.';' ';':';'\';'/';'?';'"';'<';'>';'|'},'_') '.pdf'])


