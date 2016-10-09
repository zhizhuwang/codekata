个人阅读的Deep Learning方向的paper整理，分了几部分吧，但有些部分是有交叉或者内容重叠，也不必纠结于这属于DNN还是CNN之类，个人只是大致分了个类。目前只整理了部分，剩余部分还会持续更新。




一 RNN

1 Recurrent neural network based language model

  RNN用在语言模型上的开山之作




2 Statistical Language Models Based on Neural Networks

  Mikolov的博士论文，主要将他在RNN用在语言模型上的工作进行串联




3 Extensions of Recurrent Neural Network Language Model

  开山之作的延续，RNN网络的一些改进，如通过类别信息去降低模型的参数




4 A guide to recurrent neural networks and backpropagation

  RNN网络的介绍以及优化算法，是了解RNN网络的好文章




5 Training Recurrent Neural Networks

  Ilya Sutskever的博士论文，RNN网络的训练一直是个难点，介绍RNN网络的训练优化方法




6 Strategies for Training Large Scale Neural Network Language Models

  介绍训练RNN网络训练语言模型的一些Trick




7 Recurrent Neural Networks for Language Understanding

  RNN网络语义理解方面的工作




8 Empirical Evaluation and Combination of Advanced Language Modeling Techniques

  介绍一些语言模型联合技术的一些经验，其中有RNN语言模型与其他模型combinine的工作




9 Speech Recognition with Deep Recurrent Neural Networks

  RNN网络用在语音识别方面的工作




10 A Neural Probabilistic Language Model

  不是RNN，Yoshua Bengio早期将神经网络用于训练语言模型的工作，也算是为后续的RNN用于语言模型铺好了基础。




11 On the diffculty of training Recurrent Neural Networks

  介绍了RNN网络训练的难点，比如消失的梯度，以及提出的一些解决方法




12 Subword Language Modeling with Neural Networks

   词级的语言模型由于OOV问题对新词不适应，而字符级的语言模型虽然能克服这种问题，但是模型训练的复杂度要提升，

   为了将两种特性结合提出了子词级的RNN语言模型训练，文中还利用k-means对模型参数进行了压缩处理。




13 Performance Analysis of Neural Networks in Combination with N-Gram Language Models

   关于N-gram和神经网络语言模型联合模型的性能分析，从实验的角度分析性能会提升




14 Recurrent Neural Network based Language Modeling in Meeting Recognition

   利用RNN与N-gram结合，重估得分提升语音识别系统性能




二 DNN

1 A practical guide to training restricted Boltzmann machines

  介绍RBM以及训练RBM时的N多trick,如果要实现RBM算法，这篇文章必看




2 A fast learning algorithm for deep belief nets

  Hinton的经典之作，Deep Learning的开山之作，算是Deep Learning爆发的起点




3 A Learning Algorithm for Boltzmann Machines

  85年较老的介绍如何Boltzmann训练算法




4 Greedy Layer-Wise Training of Deep Networks

  可以看作Yoshua Bengio对06年Hinton工作的延续和总结，与06年的文章很具有互补性，是入门Deep Learning的必备文章

  文章中也介绍了一些trick,如如何处理第一层节点为实值的情况等等




5 Large Scale Distributed Deep Networks

  google的Jeffrey Dean小组工作，DistBelief框架的提出，主要介绍了google如何采用分布式以及模型切分处理深度网络，加速其训练效果。




6 Context Dependent Pretrained Deep Neural Networks fo Large Vocabulary Speech Recognition

  微软在语音上的成功应用，语音识别系统相对错误率降了20%多，算是Deep Learning在工业界第一个成功案例，其影响轰动一时。




7 Deep Belief Networks for phone recognition

  Hinton小组将DNN用于语音上的早期工作，是微软工作的基础




8 Application Of Pretrained Deep Neural Networks To Large Vocabulary Speech Recognition

  DNN在大词汇量会话语音识别工作，里面有一些Voice Search和Youtube上的实验报道




9 An Empirical Study of Learning Rates in Deep Neural Networks for Speech Recognition

  google的DNN-HMM语音识别系统上学习率的一些调参经验




10 Acoustic Modeling using Deep Belief Networks

  Hinton小组早期在语音上的工作，主要是介绍如何将DNN运用于声学模型训练




11 Deep Neural Networks for Acoustic Modeling in Speech Recognition

  微软、google、IBM等几家工业界巨头对DNN在语音识别上的一些共同观点




12 Deep Belief Networks Using Discriminative Features for Phone Recognition

  Hinton小组和IBM的对于采用一些区分性特征训练DNN网络的工作，采用LDA降维到40维




13 A Comparison of Deep Neural Network Training Methods for Large Vocabulary Speech Recognition

  DNN实验方面的对比，比如采用不同的预训练方式：区分性预训练和DBN生成式预训练方式对比，以及神经元非线性的改变




14 Asynchronous Stochastic Gradient Desent for DNN Training

  中科院的文章，异步式的GPU并行训练，思想基本跟DistBelief差不多，只不过硬件换成了GPU，模型没有做切分




15 Improving Deep Neural Networks For LVCSR using Rectified Linear Units and Dropout

   利用ReLU和Dropout技术提升DNN-HMM系统




16 Improving the speed of neural networks on CPUs

   google加速神经网络前向传播速度的工作，如利用定点计算、SIMD技术等




17 Improved Bottleneck Features Using Pretrained Deep Neural Networks

   微软DNN-HMM系统的相关工作




18 Improved feature processing for Deep Neural Networks

  利用特征处理技术提升DNN-HMM系统，具体的是对13维MFCC特征拼接9帧，进行LDA-MLLT变换，最后

  也可加入SAT模块得到处理过的40维特征，作为DNN-HMM系统




19 Improving neural networks by preventing co-adaptation of feature detectors

  主要讲了Dropout技术和其实验比较结果分析，把Dropout看做模型平均化结果




20 Exploiting Sparseness in Deep Neural Networks fo Large Vocabulary Speech Recognition

   采用soft regularization和convex constraint的手段使DNN模型更加的稀疏化，稀疏化的目的是

   减小模型复杂度，提升计算速度和模型的泛化能力

  

21 Feature Learning in Deep Neural Networks Studies on Speech Recognition Tasks

   主要从Feature Learning的角度讨论DNN网络，讨论了为何DNN网络deeper更佳，为什么DNN能学出更鲁邦的特征等等。




22 Improving Neural Networks with Dropout

   Hinton学生Nitish Srivastava的硕士论文，主要讨论了Droput技术在神经网络的作用。




23 Learning Features from Music Audio with Deep Belief Networks

   DNN深度网络在音乐分类的应用，特征为MFCC，类别为hiphop、blues等曲风类型




24 Low-Rank Matrix Factorization for Deep Neural Network Training with High-Dimensional Output Targets

   IBM方面的工作，利用低秩矩阵分解的技术解决DNN分类层权重参数过多的问题




25 Multilingual Training of Deep Neural Networks

   DNN多语言方面的应用，调优的时候只调分类层参数即可




26 A Cluster-Based Multiple Deep Neural Networks Method for Large Vocabulay Continuous Speech Recognition

   利用类别信息分数据训练，然后将所有数据训练出的小模型信息整合进了贝叶斯框架，加速了整个训练过程，但精度会损失，解码

   也会变慢




27 Restructuring of Deep Neural Network Acoustic Models with Singular Value 

   提出采用SVD技术对权重矩阵进行压缩，减少模型的复杂度




28 Sparse Feature Learning for Deep Belief Networks

   Marc’Aurelio Ranzato提出的一种unsupervised feature learning的方式，这种训练的优势在于低维特性和稀疏特性，

   文中对比了RBM和PCA方法。




29 Training products of experts by minimizing contrastive

   Hinton提出的PoE模型，文中讨论了如何训练PoE模型，RBM模型也是一种特殊的PoE模型，RBM的训练也是从此演化而来，如果

   要理解CD算法原理，这篇文章必读。




30 Understanding How Deep Belief Networks Perform Acoustic Modelling

   文中主要讨论了DBN模型为什么在声学模型训练会取得较好系统性能的几个方面，但是没有理论上的支持.




31 Pipelined Back-Propagation for Context-Dependent Deep Neural Networks

   采用多GPU技术pipelined方式并行训练网络，文中还提到了一些并行措施，如数据并行化、模型并行化




32 Recent Advances in Deep Learning for Speech Research at Microsoft

   文章主要介绍了微软在Deep Learning方面工作的进展，如回归原始特征，多任务特征学习、DNN模型的自适应等等




32 Rectified Linear Units Improve Restricted Boltzmann Machines

   介绍ReLU技术在RBM模型上的运用，即非线性层的替换。




33 Reducing the Dimensionality of Data with Neural Networks

   Hinton发表在science上的文章，主要介绍了如何利用神经网络进行非线性降维，文中对比了PCA线性降维技术




34 Data Normalization in the Learning of Restricted Boltzmann Machines

   RBM训练方面数据处理的小trick,对数据进行零均值化处理使RBM训练更鲁邦。




35 Connectionist Probability Estimators in HMM Speech Recognition

   早期神经网络运用于声学模型训练的方法，其实也是现在DNN-HMM工作的基础




36 Deep Learning for Robust Feature Generation in Audio-Visual Emotion Recognition

   Deep Learning在视听系统情感分析的运用，文中提出了多种视觉信号与听觉信号混合训练模型




37 Improving Training Time of Deep Belief Networks Through Hybrid Pre-Training And Larger Batch Sizes

   采用混合式的预训练方式，即生成式预训练和区分式预训练相结合方式，文中还认为加大minbatch的尺寸可以增加数据并行化粒度




38 Training Restricted Boltzmann Machines using Approximations to the Likelihood Gradient

   提出训练RBM的新算法PCD，与CD算法不同的是全程只有一条马尔科夫链，参数更新时不用重启一条新的马尔科夫链，当然这么做的一个

   假设前提是参数更新时，模型的改变不是很大，文中也提到了采用小的学习率。




39 Classification using Discriminative Restricted Boltzmann Machines

   区分性DRBM的提出，相比于生成式模型RBM优化的是p(x,y)函数，区分性DRBM优化的是p(y|x)函数，而这里的y是标签，文中还提出了混合版本。




40 Learning Multiple Layers of Features from Tiny Images

   Hinton学生Alex Krizhevsky的硕士论文，主要是DNN工作的一些串联




41 Making Deep Belief Networks Effective for Large Vocabulary Continuous Speech Recognition

   讨论如何有效训练DNN，侧重于如何并行训练方面




42 Optimization Techniques to Improve Training Speed of Deep Neural Networks for Large Speech Tasks

   IBM的Tara N. Sainath小组DNN工作上的一些技巧总结，侧重于如何提升并行化力度技巧和减少模型参数，IBM主要利用对分类层做低秩矩阵分解。

   而CNN虽然是DNN的演化版本，参数量相对较小，但是目前语音识别中最好的CNN效果跟参数量相近的DNN效果差不多。




43 Parallel Training of Neural Networks for Speech Recognition

   神经网络并行化训练方面的工作，文中的工作主要分为两部分：多线程多核的并行化和基于SIMD的GPU并行化。




44 Accurate and Compact Large Vocabulary Speech Recognition on Mobile Devices

   google在移动端语音识别实践性的工作，特别是DNN和LM的优化，DNN的优化方面主要包括定点计算、SIMD加速、Batch lazy计算和frame skipping技术

   语言模型方面也做一定的压缩技巧。参考价值较大的实战性文章。




45 Cross-Language Knowledge Transfer Using Multilingual Deep Neural Network with Shared Hidden Layers

   DNN多语言的训练，所有语言共享相同隐层特征，而分类层面向不同语言，这种训练降低了3-5%左右，原因有点类似于transfer learning,

   不同语言之间的知识是可以transfer借鉴的。




46 Improving Wideband Speech Recognition using Mixed-Bandwidth Training Data in CD-DNN-HMM

   利用8-kHz和16-kHz做不同的频带的CD-DNN-HMM混合训练，其中比较重要的是如何设计不同频带的filter-bank对准问题，

   文中还有一些关于filter-bank的训练技巧，如是否采用动态特征和静态特征训练。




47 Robust Visual Recognition Using Multilayer Generative Neural Networks 

   Hinton学生Yichuan Tang的硕士论文，DNN视觉识别方面工作的串联




48 Deep Boltzmann Machines

   DBM模型开篇文章。




49 On Rectified Linear Units for Speech Processing

   ReLU在语音识别上的性能分析







三 CNN

1 Deep Convolutional Network Cascade for Facial Point Detection

  CNN用在人脸关键点检测工作




2 Applying Convolutional Neural Networks Concepts to Hybrid NN-HMM Model for Speech Recognition

  CNN运用于语音识别系统




3 ImageNet Classification with Deep Convolutional Neural Networks

  12年Hinton组在ImageNet竞赛上的CNN算法，不过细节不多，里面介绍了网络中使用的trick,特别是relu




4 Gradient-Based Learning Applied to Document Recognition

  Yann LeCun的经典文章，CNN开山之作，要了解CNN必先读这篇




5 A Theoretical Analysis of Feature Pooling in Visual Recognition

  Pooling在视觉识别中的原理分析以及视觉识别中的比如HOG、SIFT一些类似手段总结




6 What is the Best Multi-Stage Architecture for Object Recognition

  文中讨论了在OR问题上怎么样去设计多级结构以获取较好的识别性能，谈的更多地是模型架构上的问题，如通过怎么样的结构

  获取特征的不变性，怎么样去联合层级的信息，做视觉的应该好好看看这篇文章




7 Deep Convolutional Neural Networks for LVCSR

  CNN在LVCSR上实际运用




8 Learning Mid-Level Features For Recognition

  这篇论文视觉的应该看下，对当前视觉识别框架的分析以及框架个部分的关联，比如coding和pooling技术。




9 Convolutional Networks and Applications in Vision

  卷积网络在视觉应用的分析，做视觉的应该看看。文中认为分层的思想是视觉应用当中良好的内部表达。文中将卷积网络拆分成

  Filter Bank层、非线性层、pooling层进行分析。




10 Convolutional Neural Networks Applied to House Numbers Digit Classification

  卷积网络用在房屋数字分类的案例，文中采用了LP pooling技术，通过gaussian kernel产生增大stronger特征权重，抑制weaker特征权重的效应。




11 Visualizing and Understanding Convolutional Networks

   卷积网络特征可视化方面的工作，非常有意义的工作，通过Deconvnet的方式来可视化卷积网络层的特征，借助于这些特征可以帮助我们调整模型。




12 Stochastic Pooling for Regularization of Deep Convolutional Neural Networks

   提出随机pooling技术，不同于max pooling和average pooling，pooling的形式是随机化选择的，

   文章观点认为随机pooling技术类似于dropout一样做了正则化作用，等价于输入图像通过加噪声形成很多不同复制训练样本通过max pooling层，有效地防止过拟合




13 Adaptive Deconvolutional Networks for Mid and High Level Feature Learning

   中层、高层特征无监督的学习方法，通过Deconvolution方式进行重构学习出图像特征。




14 Best Practices for Convolutional Neural Networks Applied to Visual Document Analysis

   实践性的卷积网络方面工作，文中提到如何应对训练数据较少情况的方法可以参考下。




15 Multi-column Deep Neural Networks for Image Classification

   联合多个深度网络模型做平均化处理。




16 Differentiable Pooling for Hierarchical Feature Learning

   一种基于高斯方法的Differentiable Pooling提出，阅读这篇文章先要阅读13文章，相比max pooling、average pooling在运用

   Deconvolution方式进行重构会有一些优势。




17 Notes on Convolutional Neural Networks

   较为详细的卷积神经网络，包括梯度的计算等等。




18 Fast Inference in Sparse Coding Algorithms with Applications to Object Recognition

   非监督学习的算法PSD，在Sparse Coding框架的基础上，加了通过非线性变换后的基接近Sparse Coding的稀疏基的限制。

   优化目标函数的时候会先固定住一些参数，思想有点类似于坐标梯度下降算法。




19 Deep Neural Networks for Object Detection

   google用基于DNN（实际是CNN）regression做Object Detection，先析出mask,然后再精确定位。




20 Multi-GPU Training of ConvNets

   多GPU并行训练卷积网络的一些工程技巧




21 Flexible, High Performance Convolutional Neural Networks for Image Classification

   CNN采用GPU训练的实战性文章，算是早期文章。




22 Multi-digit Number Recognition from Street View Imagery using Deep Convolutional Neural Networks

   google街景数字图片识别，用CNN析出特征后转化为有序数字序列识别问题，传统的OCR数字识别一般是要做分割，

   而这里作为一个整体序列进行识别，文中还报道了提出模型在多种数据集下的识别率。训练的框架也是采用google的DistBelief框架。










四 其他

1 An Introduction to Deep Learning

  Deep Learning综述性的短文，比较简短，文中只是简单地提到了一些常用Deep Learning模型




2 The Difficulty of Training Deep Architectures and the Effect of Unsupervised Pre-Training

  文中主要讨论了深度结构训练的难点，从实验数据的角度分析了预训练的优势，文中有一个有趣的观点，讨论预训练的行为

  类似于正则化权重矩阵。




3 Why Does Unsupervised Pre-training Help Deep Learning

  文章讨论了无监督学习会帮助Deep Learning的几个方面，提出了Pre-training as a Regularizer的观点，从实验数据中分析，

  并没有理论的基础，这也是Deep Learning的现阶段最被人诟病的，没有完整的理论体系支撑。




4 Learning Deep Architectures for AI

  Yoshua Bengio在Deep Learning的综述文章，想要大概了解Deep Learning领域可以先看看这篇，可以扫着看。




5 Representation Learning A Review and New Perspectives

  Yoshua Bengio的在Representation Learning的综述性文章。




6 On Optimization Methods for Deep Learning

  文中讨论了Deep Learning的几种优化方式：SGD、L-BFGS、CG。实验对别了几种优化方式的优缺点。




7 Using Very Deep Autoencoders for Content-Based Image Retrieval

  用Autoencoder的中间节点表征图像全局特征，用于图像搜索。




8 Deep Learning For Signal And Information Processing

  2013年龙星机器学习邓力的讲课资料，主要侧重于deep learning在语音方面,比较详细。




9 On the Importance of Initialization and Momentum in Deep Learning

  介绍初始化和Momentum技术在deep learning方面的重要性，更多的是在实验分析上




10 Dropout Training as Adaptive Regularization

   文章从原理上分析dropout技术，等价于自适应的正则化技术




11 Deep learning via Hessian-free optimization

   目前大部分的Deep learning优化都是基于随机梯度优化算法，本文提出了一种基于Hessian-free的二阶优化算法。




12 Deep Stacking Networks For Information Retrival

  DSN网络用在信息检索方面的工作




13 Deep Convex Net: A Scalable Architecture for Speech Pattern Classification

  微软方面为了克服DNN并行化训练困难所设计出来的模型，在计算的scalability有很大优势




14 Parallel Training of Deep Stacking Networks

  DSN训练并行化




15 Scalable CALABLE Stacking and Learning for Building Deep Architectures

  DSN方面的关联文章，相关的几篇都可以联合起来一起看



  src: https://www.douban.com/note/382064119/