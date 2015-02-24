%% Set up utilities
addpath('/Users/valentinp/Research/MATLAB/export_fig'); %Use Oliver Woodford's awesome export_fig package to get trimmed PDFs
fontSize = 14;

%% Plot KITTI training
%0005,0046, 0015
fileName = '2011_09_26_drive_0005_sync_paths.mat';

data = load(['../plots/' fileName]);
figure
for p_i = 1:size(p_wcam_hist,3)
    h1 = plot(data.p_wcam_hist(1,:,p_i),data.p_wcam_hist(3,:,p_i), '--b', 'LineWidth', 2);
    hold on;
end
h2 = plot(data.p_wcam_w_gt(1,:),data.p_wcam_w_gt(3,:), '-k', 'LineWidth', 2);
%stitle(sprintf('Training Runs \n %s', fileName), 'Interpreter', 'none')
xlabel('x [m]')
ylabel('z [m]')
xlim([-25 10])
set(gca, 'FontSize', fontSize);

f = strsplit(fileName, '.');
fileTitle = f{1};
legend([h1, h2], {'Training Runs', 'Ground Truth Path'});
grid on;

export_fig(gcf, sprintf('%s.pdf', fileTitle), '-transparent');

%% 0046

fileName = '2011_09_26_drive_0046_sync_paths.mat';
data = load(['../plots/' fileName]);
figure
for p_i = 1:size(p_wcam_hist,3)
    h1 = plot(data.p_wcam_hist(1,:,p_i),data.p_wcam_hist(3,:,p_i), '--b', 'LineWidth', 2);
    hold on;
end
h2 = plot(data.p_wcam_w_gt(1,:),data.p_wcam_w_gt(3,:), '-k', 'LineWidth', 2);
%stitle(sprintf('Training Runs \n %s', fileName), 'Interpreter', 'none')
xlabel('x [m]')
ylabel('z [m]')
xlim([-15 0])

set(gca, 'FontSize', fontSize);

f = strsplit(fileName, '.');
fileTitle = f{1};
legend([h1, h2], {'Training Runs', 'Ground Truth Path'});
grid on;
export_fig(gcf, sprintf('%s.pdf', fileTitle), '-transparent');

%% 0015

fileName = '2011_09_26_drive_0015_sync_paths.mat';
data = load(['../plots/' fileName]);
figure
for p_i = 1:size(p_wcam_hist,3)
    h1 = plot(data.p_wcam_hist(1,:,p_i),data.p_wcam_hist(3,:,p_i), '--b', 'LineWidth', 2);
    hold on;
end
h2 = plot(data.p_wcam_w_gt(1,:),data.p_wcam_w_gt(3,:), '-k', 'LineWidth', 2);
%stitle(sprintf('Training Runs \n %s', fileName), 'Interpreter', 'none')
xlabel('x [m]')
ylabel('z [m]')
%xlim([-15 0])

set(gca, 'FontSize', fontSize);

f = strsplit(fileName, '.');
fileTitle = f{1};
legend([h1, h2], {'Training Runs', 'Ground Truth Path'});
grid on;
export_fig(gcf, sprintf('%s.pdf', fileTitle), '-transparent');

%% Run Comparisons

%%  City
kittiRun = '2011_09_29_drive_0071_sync';
dataNom = load(['../trials/' kittiRun '_nominal.mat']);
dataAgg = load(['../trials/' kittiRun '_aggressive.mat']);
dataProbe = load(['../trials/' kittiRun '_probe.mat']);


hgt = plot(dataNom.p_camw_w_gt(1,:),dataNom.p_camw_w_gt(3,:), '-k', 'LineWidth', 2);
hold on;
hnom = plot(dataNom.p_camw_w(1,:),dataNom.p_camw_w(3,:), '-.r', 'LineWidth', 2);
hagg = plot(dataAgg.p_camw_w(1,:),dataAgg.p_camw_w(3,:), '--g', 'LineWidth', 2);
hprobe = plot(dataProbe.p_camw_w(1,:),dataProbe.p_camw_w(3,:), '-b', 'LineWidth', 2);
xlabel('x [m]')
ylabel('z [m]')
set(gca, 'FontSize', fontSize);
f = strsplit(fileName, '.');
fileTitle = f{1};
legend([hnom, hagg,hprobe, hgt], {'Nominal', 'Aggressive', 'Probe', 'Ground Truth'}, 'Location', 'NorthEast');
grid on;
export_fig(gcf, sprintf('%s_comparison.pdf', kittiRun), '-transparent');



%% Residential
kittiRun = '2011_09_30_drive_0027_sync';
dataNom = load(['../trials/' kittiRun '_nominal.mat']);
dataAgg = load(['../trials/' kittiRun '_aggressive.mat']);
dataProbe = load(['../trials/' kittiRun '_probe.mat']);

figure
hgt = plot(dataNom.p_camw_w_gt(1,:),dataNom.p_camw_w_gt(3,:), '-k', 'LineWidth', 2);
hold on;
hnom = plot(dataNom.p_camw_w(1,:),dataNom.p_camw_w(3,:), '-.r', 'LineWidth', 2);
hagg = plot(dataAgg.p_camw_w(1,:),dataAgg.p_camw_w(3,:), '--g', 'LineWidth', 2);
hprobe = plot(dataProbe.p_camw_w(1,:),dataProbe.p_camw_w(3,:), '-b', 'LineWidth', 2);
xlabel('x [m]')
ylabel('z [m]')
set(gca, 'FontSize', fontSize);
f = strsplit(fileName, '.');
fileTitle = f{1};
legend([hnom, hagg,hprobe, hgt], {'Nominal', 'Aggressive', 'Probe', 'Ground Truth'}, 'Location', 'NorthEast');
grid on;
export_fig(gcf, sprintf('%s_comparison.pdf', kittiRun), '-transparent');

%% Road


