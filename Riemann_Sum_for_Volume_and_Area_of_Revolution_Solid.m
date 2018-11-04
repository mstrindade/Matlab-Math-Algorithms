% Define your function and enjoy the animation!
f = @(x) abs(cos(x.^3)); a = 0; b = 2; maxanim = 50;

for D = 1: maxanim
    
    % Ploting the function.
    dx = (b-a)/D; clf, hold on, grid on, t = a:0.0001:b; X = a:dx:b;
    plot3(t,zeros(length(t),1),f(t),'LineWidth',3,'Color','r');
    
    for i = 1:D
        
        % Volume.
        %[x,y,z] = cylinder([f(X(i)+dx/2) f(X(i)+dx/2)],50);
        %circle(X(i),0,0,f(X(i)+dx/2)); circle(X(i)+dx,0,0,f(X(i)+dx/2));
         
        % Area.
        [x,y,z] = cylinder([f(X(i)) f(X(i)+dx)],50);              
             
        
        z(1,:) = z(1,:)+(i-1)*dx; z(2,:) = z(1,:)+dx;
        view([1,-3,1]), surf(z,x,y,'FaceAlpha',1,'EdgeColor','none')
        
    end
    
    % Animation.    
    refreshdata, drawnow, pause(5/D), if D~=maxanim, clf, end

end

function h = circle(cx,cy,cz,r)
    hold on, th = 0:pi/50:2*pi; 
    x = cx*ones(length(th),1); 
    y = r * cos(th) + cy; 
    z = r * sin(th) + cz;
    h = fill3(x, y, z,[1,204/255,0]);
end