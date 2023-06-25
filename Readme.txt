本组使用了两种方法建立两种模型：一种是Simulink，一个是Simulink中的SimMechanics

其中：

Simulink文件夹：

ER_Simulink文件：本组主要程序，完成了：垂直上升即悬停、俯仰、偏航、水平飞行（假设A（详见报告））；
ER_level_flight2文件：完成了：水平飞行（假设C：实现不掉高补偿水平飞行）；
main文件：绘制静态轨迹图；
thrd_dyn_plot文件：绘制动态轨迹图；
drone程序：为thrd_dyn_plot文件提供无人机模型。

SimMechanics文件夹：

ER_SimMechanics文件：本组SimMechancis主程序，完成物理模型的垂直上升即悬停、俯仰、偏航、水平飞行运动；
matlab cx文件夹：为完成各运动的输入控制量。