
% (4,4) = grid(25)
for ip=1:length(periods)
phv_1(ip) = avgphv_aniso(ip).isophv(4,4);
phv_1_std(ip) = avgphv_aniso(ip).isophv_std(4,4)/sqrt(21);
aniso_strength_1(ip) = avgphv_aniso(ip).aniso_strength(4,4);
aniso_strength_1_std(ip) = avgphv_aniso(ip).aniso_strength_std(4,4)/sqrt(21);
aniso_azi_1(ip) = avgphv_aniso(ip).aniso_azi(4,4);
aniso_azi_1_std(ip) = avgphv_aniso(ip).aniso_azi_std(4,4)/sqrt(21);
end



figure(101)
clf
subplot(3,2,1)
plot(periods,phv_1,'xb','linewidth',2)
errorbar(periods,phv_1,phv_1_std,'xb', 'linewidth',1);
hold on
load pa5phvR

plot(2*pi./w, phv,'r')
hold on
%load age_52_110Myr_iso_DC
%plot(period,phv,'b')



xlim([10 110]);
ylim([4.0 4.2]);

ylabel('Phase Velocity (km/s)');



subplot(3,2,3)
plot(periods,aniso_strength_1*100,'xb','linewidth',2)
errorbar(periods,aniso_strength_1*100,aniso_strength_1_std*100,'xb', 'linewidth',1);
ylabel('amplitude');
xlim([10 110]);
ylim([0 4]);



subplot(3,2,5)
plot(periods,aniso_azi_1,'xb','linewidth',2)
errorbar(periods,aniso_azi_1,aniso_azi_1_std,'xb', 'linewidth',1);
ylabel('fast direction');
xlim([10 110]);
ylim([0 180]);
set(gca,'ytick',[0 45 90 135 180])
xlabel('Period (s)')
psfile = ['azimutah_aniso.ps']
print('-dpsc2',psfile)
