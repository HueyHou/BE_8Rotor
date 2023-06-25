clc
syms

x = -XX(:,10);
y = -XX(:,11);
z = -XX(:,12);
phi = XX(:,7);
psai = XX(:,9);
theta = XX(:,8);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%仿真轨迹与绘制
clf
len = length(tout);
xmax = 0; ymax = 0; zmax = 0;
xmin = 0; ymin = 0; zmin = 0;
for i = 1:len
    figure(1);
    if(x(i)>=xmax)
        xmax = x(i);
    end
    if(y(i)>=ymax)
        ymax = y(i);
    end
    if(z(i)>=zmax)
        zmax = z(i);
    end
    if(x(i)<=xmin)
        xmin = x(i);
    end
    if(y(i)<=ymin)
        ymin = y(i);
    end
    if(z(i)<=zmin)
        zmin = z(i);
    end
    limitmin = min(xmin,ymin); limitmax = max(xmax,ymax);
    xlim([limitmin-2,limitmax+2]),ylim([limitmin-2,limitmax+2]),zlim([-1,zmax+5])
    grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%绘制八旋翼，并将八旋翼赋到动点上
    [point1_trans,point2_trans,point3_trans,point4_trans]=drone(phi(i),theta(i),psai(i));
    try
        delete(h1);delete(h2);delete(point);
        plot3([x(i-1),x(i)],[y(i-1),y(i)],[z(i-1),z(i)],'LineWidth',2)
    catch
    end
    h1 = plot3([x(i)+point1_trans(1),x(i)+point2_trans(1)],[y(i)+point1_trans(2),y(i)+point2_trans(2)],...
        [z(i)+point1_trans(3),z(i)+point2_trans(3)],'LineWidth',3,'Color','r');
    hold on;
    h2 = plot3([x(i)+point3_trans(1),x(i)+point4_trans(1)],[y(i)+point3_trans(2),y(i)+point4_trans(2)],...
        [z(i)+point3_trans(3),z(i)+point4_trans(3)],'LineWidth',3,'Color','b');
    set(gca,'ztick',0:20:z(i)+5)
    pause(0.05)
end

