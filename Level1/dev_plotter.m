% Input range
x = 0:0.000030517578125:0.003;

% Square root function
sqrt = sqrt(x);

% Linear approximation
approx = zeros(size(x));
approx(x > 0 & x <= 0.000030517578125) = 192 * x(x > 0 & x <= 0.000030517578125);
approx(x > 0.000030517578125 & x <= 0.00018310546) = 48 * x(x > 0.000030517578125 & x <= 0.00018310546) + 0.00509643555;
approx(x > 0.00018310546 & x <= 0.00030517578) = 32 * x(x > 0.00018310546 & x <= 0.00030517578) + 0.00796508789;
approx(x > 0.00030517578 & x <= 0.00048828125) = 26 * x(x > 0.00030517578 & x <= 0.00048828125) + 0.009765625;
approx(x > 0.00048828125 & x <= 0.00073242187) = 20 * x(x > 0.00048828125 & x <= 0.00073242187) + 0.0126953125;
approx(x > 0.00073242187 & x <= 0.00122070312) = 16 * x(x > 0.00073242187 & x <= 0.00122070312) + 0.015625;
approx(x > 0.00122070312 & x <= 0.0021972656) = 12 * x(x > 0.00122070312 & x <= 0.0021972656) + 0.0205078125;
approx(x > 0.00219726562) = 10 * x(x > 0.00219726562) + 0.0249023438;

% Error calculation
error = abs(sqrt - approx);

% Maximum error and corresponding x
[max_error, idx_max] = max(error);
x_max_error = x(idx_max);

% Plotting square root and approximation
figure; % First figure
plot(x, sqrt, 'b-', 'LineWidth', 1.5);
hold on;
plot(x, approx, 'r-', 'LineWidth', 1.5);
plot(x_max_error, sqrt(idx_max), 'ko', 'MarkerSize', 8, 'LineWidth', 2);
title('Square Root Function and Linear Approximation');
xlabel('Input (x)');
ylabel('Output');
legend('Square Root', 'Approximation', 'Max Error', 'Location', 'southeast');
grid on;

% Plotting error in a separate figure
figure; % Second figure
plot(x, error, 'k-', 'LineWidth', 1.5);
hold on;
plot(x_max_error, max_error, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
title('Error Between Square Root and Approximation');
xlabel('Input (x)');
ylabel('Error');
legend('Error', 'Max Error', 'Location', 'northwest');
grid on;

% Display maximum error in the error plot
text(x_max_error, max_error, ...
    sprintf('Max Error: %.4f at x = %.2f', max_error, x_max_error), ...
    'HorizontalAlignment', 'left', 'VerticalAlignment', 'top', ...
    'FontSize', 10, 'Interpreter', 'none');