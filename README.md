# Branch Prediction Implementation: Perceptron and Bi-Mode Predictors
This repository contains the implementation of two branch prediction mechanisms: Perceptron-based prediction and Bi-mode prediction. These implementations are located in the src/bp directory and include the following files:

	•	bimodal.cc and bimodal.h: These files contain the implementation of the bi-mode branch predictor. 
                    The bi-mode predictor aims to enhance prediction accuracy by dividing the branch space into strongly
		    	taken and strongly not-taken components.
	•	perceptron.cc and perceptron.h: These files implement the perceptron-based branch predictor.
                    The perceptron predictor uses a machine-learning-inspired approach to improve prediction by 
			considering multiple branch histories simultaneously.

The predictors are integrated into the branch prediction pipeline and provide mechanisms to track and report branch prediction accuracy and misprediction statistics. This project is designed to evaluate the trade-offs between different prediction algorithms in terms of accuracy and hardware complexity.
