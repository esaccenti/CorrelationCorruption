
function X  = GenData_AdditiveNoise(X0,s2c_a,s2u_a)

%   Function to generate data with addtive error, correlated and
%   uncorrelated. Please see Equation (11) in
%
%   Edoardo Saccenti, Margriet H. W. B. Hendriks, Age K. Smilde
%   Corruption of the Pearson correlation coefficient by measurement error: 
%   estimation, bias, and correction under different error models
%   In press on Scientific Reports. Accessible on BioArXiv
%
%   
%   Contact: 
%   Edoardo Saccenti - Laboratory of Systems and Synthetic Biology 
%   Wageningen University & Research, Stippeneng 4, 6708 WE, Wageningen,
%   the Netherlands. Mail to: edoardo.saccenti@wur.nl
%   https://www.systemsbiology.nl/edoardo-saccenti/
%   
%   Input:
%
%   X0      Noise free data of of size Nobs x Nvar
%   s2c_a   Variance of the additive correlated noise (scalar) 
%   s2u_a   Variance of the additive UNcorrelated noise (1 x Nvar vector)
%
%   Output:
%
%   X       X0 with additive correlated and uncorrelated error added
%
%   Usage example:
%   
%   Generate error free data:
%   Nvar = 10;
%   Nobs = 100;
%   Mean = zeros(1,Nvar);
%   Sigma = eye(Nvar);
%   X = mvrand(Mean, Sigma,Nobs);
%    
%   Specify error vaiances:
%    
%   Variance of the correlated Additive component
%   s2c_a = 0.5;
% 
%    Variance(s) of the uncorrelated Additive component (here the same for all variables)
%    s2u_a = 0.5*ones(1,Nvar);
%    
%    X = GenData_AdditiveNoise(X0,s2c_a,s2u_a);

% coded by: Edoardo Saccenti (edoardo.saccenti@wur.nl)
% last modification: 11/December/2018
%
% Copyright (C) 2019  Wageningen University & Research
% Copyright (C) 2019  Edoardo Saccenti
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
   
%
%
%
%Initialized empty matrix
[Rep, Nvar]= size(X0);

X = NaN*ones(Rep,Nvar);

for i = 1 : Rep
    ec_a = randn(1,1)*sqrt(s2c_a(1));
    for j = 1 : Nvar
        
        % Generate uncorrelated noise: different for all
        % variables/observations
        eu_a = randn(1,1)*sqrt(s2u_a(j));
        
        % Sample from population. Uncorrelated variables
        x0 = X0(i,j);
        X(i,j) = x0 + eu_a + ec_a;
    end
end

end