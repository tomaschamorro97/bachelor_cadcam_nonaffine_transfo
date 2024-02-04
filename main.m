%Tomás Chamorro Pareja
%201610011014
%13/08/2020

clc
clear all
close all

% Define world coordinate system
WORLD = eye(4);
WORLD_SIZE = 10;


xmin = -WORLD_SIZE;
xmax = WORLD_SIZE;
ymin = - WORLD_SIZE;
ymax = WORLD_SIZE;
zmin = -WORLD_SIZE;
zmax = WORLD_SIZE;

%figure(1)
%axis([xmin xmax ymin ymax zmin zmax]);

%% Create Basic Rectangle
origin = [0;0];
dx = 3;
dy = 3;
rectangle = rectangle_2D(origin, dx, dy );

figure(1)
hold on
plot(rectangle(1,:),rectangle(2,:), '-*r');
axis([xmin xmax ymin ymax zmin zmax]);

%This function is used to divide the polygon into more points. '-*r'
%Indicates that the graphic should consist of points and not of a line
n=10;
resample = resample_polygon(rectangle, n);
plot(resample(1,:),resample(2,:), '-*r');

%Names points on the figure. '--p' denotes the string name
int_pt_labels_str(resample, 1, '-P' )

%%

%Opening of Figure 1
title('Non-Affine Function Preserving Origin and inverting Orientation')

%Plotea ejes
plt_axes_str(WORLD, WORLD_SIZE, 'k', 'b', 'r','XW','YW','ZW','OW');
axis([xmin xmax ymin ymax zmin zmax]);


%Orientation inversion and origin preservation

X = resample(1,:);
Y = resample(2,:);

%Transf 1
f1 = [(-(X.^2))./2;(X.*Y)]; %ESTA ES LA ORIGINAL, LA DE ABAJO ES DE PRUEBA
% f1 = [((X.^2)-(Y.^2));(2*X.*Y)]; THIS IS NOT A TRANSFORMATION

%Plotear los ejes
int_pt_labels(f1, 1);
plot(f1(1,:),f1(2,:),'m');

%Verificar jacobiano
determinant = [];
for i=1:size(f1,2)
    x = f1(1,i);
    y = f1(2,i);
    J = [-x 0;
        y x];
    determinant(1,i)=det(J);
end
%Aparte del display de abajo, podemos ver en el Workspace que el valor de
%f1 en la primeras coordenadas es 0,0, por lo que tambien se preserva el
%origen
disp('If det Jf>0, f1 preserves orientation. The determinant of Jf (each point of the function) is less than 0. The value of each determinant is:')
determinant

%----------------------------2nd Exercise----------------------
%% Preserve area, displace origin, and invert orientation. Illustrate the
% area preservation property.

%Origin is not preserved if we add an independet constant to the function f2 in each side, such that f2(0,0)
%is different than zero
%f(x,y)=(x+y^3,-y): To preserve area , and we use -y to invert orientation
%too, this function was taken  from the book


figure(2)
hold on

f2 = [1+X+(Y.^3);-Y-3];

%Opening of Figure 1
title('Non-Affine Function Preserve area, displace origin, and invert orientation')

%Plotea ejes y otra vez el rectangulo original para comparar con la
%transformación
plt_axes_str(WORLD, WORLD_SIZE, 'k', 'b', 'r','XW','YW','ZW','OW');
plot(resample(1,:),resample(2,:), '-*r');
int_pt_labels(f2, 1);
plot(f2(1,:),f2(2,:),'b');
plot(X,Y,'r');
int_pt_labels(resample, 1);
axis([xmin xmax ymin ymax zmin zmax]);


%Verificar jacobiano de nuevo
determinant2 = [];
for i=1:size(f2,2)
    x = f2(1,i);
    y = f2(2,i);
    J = [1 3*y^2;
        0 -1];
    determinant2(1,i)=det(J);
end
disp('The function preserves area if det(J) on each point is equals to 1 or -1, orientation is preserved. -1 means that the figure is being inverted')
disp('Origin is not preserved, as we can see in the value of f2 and in the figure')
determinant2

[A1,A21,CG_x1,CG_y1]=area_moments(f2');
[A2,A22,CG_x2,CG_y2]=area_moments(resample');


%----------------------3rd Exercise----------------------------
% preserve angle and invert orientation. Use the Moebius transformation in
% pages 29 and following, of book “Geometric Transformations in Computer
% Aided Geometric Design. Ruiz & Cadavid 2008 ISBN: 978-958-720-016-4”.

figure(3)
origin2 = [1;1];
rectangle2 = rectangle_2D( origin2, dx,dy );
resample2 = resample_polygon(rectangle2, n);

X2 = resample2(1,:);
Y2 = resample2(2,:);
%Mobius equation (book)
f3 = [X2./(X2.^2+Y2.^2);-(-Y2./(X2.^2+Y2.^2))];


plt_axes_str(WORLD, WORLD_SIZE, 'k', 'b', 'r','XW','YW','ZW','OW');
plot(resample2(1,:),resample2(2,:), '-*r');

%Plot f3
int_pt_labels(f3, 1);
plot(f3(1,:),f3(2,:),'m');
%Plots rectangle
plot(X2,Y2,'y');
int_pt_labels(resample2, 1);
axis([xmin xmax ymin ymax zmin zmax]);
determinant3 = [];
for i=1:size(f3,2)
    x = f3(1,i);
    y= f3(2,i);
    J=[(y^2-x^2)/(x^2+y^2)^2, (-2*y*x)/(x^2+y^2)^2;-((2*y*x)/(x^2+y^2)^2),-((y^2-x^2)/(x^2+y^2)^2)];
    angle_preservation = J*J'%Proving angle preservation. If the angle is preserved, these matrices
%being printed by the variable angle_preservation should give a diagonal matrix
    determinant3(1,i)=det(J);
end
%As the determinant is less than 0, orientation means that was inverted
determinant3