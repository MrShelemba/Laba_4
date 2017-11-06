%=== Завдання #4.1 ===
% Завантаження сигналу ЕКГ з перешкодою (файл ecg2x60.dat) 
ecg = load('ecg2x60.dat');

%=== Завдання #4.2 ===
% Фільтрація сигналу адаптивним фільтром
fs = 200; f = 60;
t = (0:length(ecg)-1)/fs;
d = [cos(2*pi*f*t); sin(2*pi*f*t)]; % опорний сигнал
mu = 0.1;
[y, e, b] = lms60(ecg, d, mu);

% Графіки результату фільтрації
figure(26)
subplot(3, 1, 1); plot(t, ecg), grid on;
title('Сигнал ЕКГ з шумом'); ylabel('Амплітуда');
subplot(3, 1, 2); plot(t, e); grid on;
title('Адаптивно відфільрований сигнал ЕКГ'); ylabel('Амплітуда');
subplot(3, 1, 3); plot(t, y); grid on;
title('Вихідний сигнал адаптивного фільтра');
xlabel('Відліки'); ylabel('Амплітуда');

% АЧХ адаптивного фільтру
a = 1;
n = 512; % кількість точок, що розраховуються
figure(27)
[h, f] = freqz(b, a, n);
mag = abs(h);
plot(f/(2*pi)*fs, mag), grid on;
title('АЧХ адаптивного фільтру'); 
xlabel('Відліки'); ylabel('Підсилення');

