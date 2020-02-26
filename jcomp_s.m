clc
close all
clear
%% Reading the Data from .txt file
fq = 4000; 
%sampling frequency
%data1 = load("D:\Desktop\Fall Sem 2019\Signal Analysis and processiong\Project\emghealthy.txt");
data1 = load("D:\Desktop\Fall Sem 2019\Signal Analysis and processiong\Project\dataset4.txt");
figure; 
plot(data1(:,1), (data1(:,2)-mean(data1(:,2)))); 
xlabel('Time/s'); ylabel('Signal magnitude'); 
title('Raw Data from EMG - leg muscle(Tibialis)');set(gca,'FontSize',14);
%%  Performing Fast Fourier Transform and Shifting the Zero-component to center
shEMG1 = 1000.*data1(:,2); 
fft_sEMG1 = fft(shEMG1); 
fft_sEMG1 = fftshift(fft_sEMG1);
n = length(shEMG1);  
fq_axis = (-n/2:n/2-1)*fq/n; % zero-centered frequency range
abs_sEMG1_fft = abs(fft_sEMG1);
figure;  
plot(fq_axis, abs_sEMG1_fft ); axis([fq_axis(1) fq_axis(end) 0 50000]); 
xlabel('Frequency/Hz','fontsize', 14); ylabel('X(jw) magnitude'); 
title('Frequency Domain - leg muscle');
set(gca,'FontSize',14);

%% Generating the Band Pass Filter
high = 150;   
low = 1000;  
cutoff1 = round((2000-high)/(fq/length(shEMG1))); cutoff2 = round((2000-low)/(fq/length(shEMG1)));
cutoff3 = round((high+2000)/(fq/length(shEMG1))); cutoff4 = round((low+2000)/(fq/length(shEMG1)));
shEMG1 = data1(:,2); 
H = zeros(length(shEMG1),1);
H(cutoff2:cutoff1) = 1; 
H(cutoff3:cutoff4) = 1; 
figure; plot(fq_axis, H); xlabel('Freqeuncy/Hz'); ylabel('Amplitude');
title('Bandpass filter');set(gca,'FontSize',14);
%% Performing Bandpass filter opreation,inverse shifting and inverse Fourier transform
% leg muscle
ytt0=fft_sEMG1.*H;
ytt1 = ifftshift(ytt0); 
ytt1 = ifft(ytt1);
t = 1/fq*(1:length(ytt1));
figure;
plot(fq_axis, abs(ytt0),'r');xlabel('Frequency/Hz'); ylabel('Amplitude'); 
title('Signal after bandpass filter - leg muscle','fontsize', 14);
figure;
plot(t, real(ytt1),'r');xlabel('Time/s'); ylabel('Amplitude'); 
title('Signal after bandpass filter - leg muscle','fontsize', 14)
%%  Feature extraction with MAV and convolution. 
filter = ones(20,1);
filter = filter/length(filter);
% leg muscle
%MAV1 = zeros(length(ytt1),1);
var1 = zeros(length(ytt1),1); 
MAV1 = conv(abs(real(ytt1)),filter,'same');
figure;
plot(data1(:,1),MAV1,'linewidth',2); hold on; 
plot(data1(:,1),real(ytt1),'r'); 
legend('MAV','EMG signal', 'location', 'Northeast');
xlabel('Time/s'); ylabel('Signal Amplitude'); title('muscle'); grid on;
axis([0 round(max(data1(:,1))) min(real(ytt1)) max(real(ytt1))]);
set(gca,'FontSize',14);
hold off;
figure;
plot(data1(:,1),MAV1,'linewidth',2); 
xlabel('Time/s'); ylabel('Signal Amplitude'); title('muscle (MAV)');
%% Servo Motor Roatation
port = 'COM10';
board = 'Uno';
arduino_board = arduino(port, board, 'Libraries', 'Servo');

servo_motor = servo(arduino_board, 'D8');

MAV2=MAV1;
for i=1:length(MAV2)
    if MAV2(i)>=60
        MAV2(i)=60;
    end
    if MAV2(i)<=20
        MAV2(i)=0;
    end
end

for i=1:length(MAV2)data
    
    j=(MAV2(i)*0.556)/60;
   writePosition(servo_motor,j);

   current_position = readPosition(servo_motor);

   current_position = current_position * 180;   
   if(current_position>=140)
       fprintf('Ankle at full flex. \n')
   end
   if((current_position<140) && (current_position>0))
       fprintf('Ankle is flexing. \n')data
   end
   if(current_position==0)
       fprintf('Ankle is at rest. \n')data
   end                                                                                                                   
   fprintf('Curent position is %d\n', current_position);   


end

writePosition(servo_motor, 0);

