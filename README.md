# Nested Inequalities Climate-Economy (NICE) model

This repository contains source code for the NICE model presented in *Inequality, climate impacts on the future poor, and carbon prices, (Dennig et al., PNAS, 2015)*. The model is a modification of the RICE model by William Nordhaus and his collaborators, designed to analyse climate policy questions arising from socio-economic inequality within regions. It is written in the MATLAB programming language. See Dennig et al., PNAS, 2015 for a model description.

# Running NICE

Running the model requires MATLAB. Within that software, ensure that all of the files contained in this repository are included in the *path*. Executing either of the interface files:  
NICE_interface_global_carbon_price.m  
NICE_interface_regional_carbon_prices.m  

will result in the model being executed and the results saved to a variable called "results". 

Essentially any parameter of the model can be chosen to alter the instance of the model being run. A number of parameters relating to the distribution of damages and mitigation cost at a sub-regional level - the original focus of the model developers - are listed in the interface files and easily changed. 

# Issues 

If you encounter any issues operating the model, or require assistance identifying a problem or implementing a change, please contact Francis Dennig at fdennig@yale-nus.edu.sg
