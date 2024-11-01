### 一个子节序问题引发的思考

---


最近碰到一个这样的问题，A节点向B节点发送消息，A和B属于不同的子节序。A在发送之前将消息转换为另一种子节序，A收到B发送过来的消息时，也需要先转换为自己的子节序。在这样的“约定”下，软件工作的不错。
但是随着时间的推移，问题出现了。由于硬件更新的原因，B节点更换了另外一种CPU，子节序也跟之前不一样了。A和B之间原本工作正常的软件失效了。
为了应对这个问题，有人想到的办法是，在A上进行判断，如果是以前的CPU就转换子节序，如果是新的CPU，就不转换子节序。    

问题看上去解决了，这是一个好的方法吗？试想，如果不同类型的节点数继续增长，软件中会出现越来越多的分支，用来判断不同的节点类型，以及相应的CPU类型。而且消息发送方的处理依赖于接受方的子节序类型，形成了不必要的耦合。

这不是一个好的设计。

实际上，现有的技术实现中已经有很好的解决方案。在TCP/IP网络中，所有的消息都以一种子节序传输，即**网络子节序**。不管是哪种子节序的主机，收到网络中的消息后都能正确处理，发送方和接收方都不关心对方的子节序。所以，对于上面提出的问题，也可以采用这个方法解决。
如果到这里结束也算完美了，可是当我们提出这个建议时，有人的回答却是这样的：为了不影响性能，不能这样干，转换子节序会影响软件的性能。我想这才是子节序问题背后更加深层次的问题，即**软件的性能问题**。

对于这个问题有以下几点值得我们思考：
   

 - 什么会影响软件的性能？
    在上面提到的这个案例中，收发消息的过程中，多调用几个子节序转换的函数会影响性能吗？
    
    顺便插播一个几年前的故事。我们在交流代码重构的过程中，在听到建议将现有的大函数重构成小函数时，一个资深的工程师马上反驳道，这样会增加函数调用的堆栈空间，降低性能。所以，函数调用层次的增加会影响性能吗？
  还有很多我们认为会降低软件性能的因素，在此不一一列举。这些观点的对与错，先不下定论，但可以提出几个问题供大家参考。
  
  - 首先，软件的性能是否经过量化，是否有具体的profiling数据？
  - 其次，基于具体的数据，分析性能的瓶颈在哪里？
  - 最后，是否针对性能的问题对症下药，有的放矢？
   
 - 软件设计的合理性是否更有价值？
   随着硬件的性能提升，有些软件代码对性能的影响越来越微乎其微，软件设计本身的简单性对于项目的成功具有更加有意义。
   一个设计良好、能够有效应对变化的软件，会成为项目遗留的正资产，为软件的重用、扩展提供更多的可能。
