# EMG SIGNAL ANALYSIS
## Introduction
Electromyography (EMG) is a modern technological solution to treat
amputated patients who are in dire need of limbs in their day-to-day lives.
EMG is the recording of electrical signals of muscle tissue which are extracted
by inserting electrodes or sensors on the surface of the skin or directly into
the muscle. Any movement in the muscle will be recorded and a dataset is
created for analysing and implementing into robotic arms. The stronger the
contraction of muscles, the higher the voltage amplitude is recorded into the
systems.
Surface electrodes are the key in extracting raw data from the muscles
of the body. One of the disadvantages of using EMG is the noise generated is
difficult to remove. Many measures are being taken in order to minimize the
noise especially electrical noise picked up from surrounding power sources.
The noise due to electromagnetic radiation is also difficult to remove. Some
noise like generated inside the system cannot be removed hence the
experiments are done frequently to remove the error.
The raw data obtained from the electrodes or sensors is stored as a
dataset through which the signal is analysed carefully and removing
unnecessary noise through filters, calibrating properly to obtain the desired
results. After obtaining the results the dataset is trained using logistic
regression model so that any future input will give a response.
In medication, a prosthetic implant is a gadget that replaces a missing
body part, which might be lost through accidents, birth defects. Prostheses
are planned to reestablish the typical elements of the missing body part. This
project also aims to prototype this prosthetic limb in a cost efficient and a
better way using simple yet very powerful developing platform of MATLAB.

## Objective
● Processing the signal acquired from the EMG sensor using Fourier
Transform or, the design and application of digital filters with powerful
tools that MATLAB provides and then sending the processed signal to a
prosthetic arm's servo motors which should be able to replicate the
human arm with the best accuracy possible.\
● Here in the project we are using ready made dataset available from
online data banks .\
● Making a prosthetic/robotic arm to simulate a human using the filtered
EMG signals whose basic action is closing and opening of the fists to
hold objects.\
● This will help a lot of people to gain mobility and help them enjoy their
life like normal people.\
● Moreover we are implementing ML( Machine Learning) with Python for
the Data set training.\
● The main aim of using ML is to train data according to the input voltage
given i.e. when we give real time data the ML algorithm will detect the
further movement of the limb as per its training and will perform the
further movements.\
## Project Summary
### The purpose of this project is as follows:
1. To analyse the signals that we can be obtained from the EMG sensor.\
2. After the analysis of the signals from the plots of its fourier transform getting
the range of the noise frequencies in the input sensor signals.
3. Removing the noise signals from the input signals using bandpass filters.
4. Getting the output on the form of the movement in the stepper motor using
arduino uno board as the microcontroller\
5. Using the ML algorithm trying to train the Data Set to predict the movement of the
limb from the real time Data given.
