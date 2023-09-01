SpikeGLX-MATLAB-SDK
===================

### What

The SDK lets MATLAB applications communicate with SpikeGLX phase30 versions
20220101 and later:

* Set/get parameters.
* Start/Stop runs.
* Start/stop writing.
* Fetch data in real time.
* Everything you need to integrate SpikeGLX into your workflow.

There's an included closed-loop latency test program; used to obtain these
results on an i7-8850H, 2.6 GHz laptop:

![MATLAB API Latency](MATLAB_latency.png)

>*Note: Low latency mode is available with SpikeGLX 20230815 and later.*

### Who

The SDK is developed by [Bill Karsh](https://www.janelia.org/people/bill-karsh)
of the [Tim Harris Lab](https://www.janelia.org/lab/harris-lab-apig) at
HHMI/Janelia Research Campus.

### Building in Windows

I build using MS Visual Studio C++ 2015, and MATLAB R2018b.

### Licensing

Use is subject to Janelia Research Campus Software Copyright 1.2 license terms:
[http://license.janelia.org/license](http://license.janelia.org/license).


_fin_

