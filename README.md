# A Twice Denoising Autoencoder Framework for Random Seismic Noise Attenuation
by [Zhangquan Liao](https://github.com/ZACKLEON), Yong Li, En xia, Yingtian Liu, Rui Hu
## Abstract
Many seismic denoising algorithms are easily trapped in the dilemma of signal leaking and noise remaining. 
But between the two situations, more complex and common situations happens that both signal leaking and noise remaining exist. 
We have presented a denoising framework for random seismic noise attenuation to mitigate the dilemma and achieve a better denoising performance. 
The framework consists of a denoising autoencoder (DAE) and data generator. 
he DAE attenuates random noise without ground truth and works with a vectoring patching technique to reduce time complexity. In the data generator, local correlation is first developed to nonlinear local correlation to detect and extract the signal leakage with noise components suppressed. 
Then, the extracted signal leakage is compensated back to the DAE output in a supersaturated way to generate a new record. 
After that, DAE is used again to suppress the remaining noise in the new record. 
The supersaturated compensation of the first signal leakage counteracts the signal leakage of the second DAE noise attenuation. 
Formally, the proposed framework can be implemented like a nonlinear geological inversion by thinking of the data generator as the forward operator.

## Notice
The implementation of this code is based on python and matlab. The used environment is python3.8, tensorflow2.2, and matlab202b.
There are two things to note when running this code. 
1. You need to install matlab engine in the corresponding python environment, and then "import matlab" and "import.engine". 
2. The absolute paths in "patching.m", "unpatching.m", and "nlcc.m" need to be set correctly according to your device.

Once you have done this, you can run "TDAE.ipynb" in the jupyter notebook

It is important that yc_patch.m, yc_patch_inv.m, yc_patch3d.m, and yc_patch3d_inv.m come from "Fast dictionary learning for noise attenuation of multidimensional seismicdata", and introduced in detail in [https://github.com/chenyk1990/reproducible_research](https://github.com/chenyk1990/reproducible_research)
