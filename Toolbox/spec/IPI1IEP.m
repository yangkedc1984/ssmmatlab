function ser = IPI1IEP
% [M]=textread('IPI1975a2017.csv','%f','delimiter',',','headerlines',0);
M = load(fullfile('data', 'IPI1975a2017.dat'));
% M=flipud(M);
% M=M(36*12+1:end-1,:);%quitamos enero de 2018 y nos quedamos 2011-2017%
ser.bg_year = 2011;
ser.bg_per = 1;
ser.freq = 12;
n = size(M, 1); % Longitud de las series
%Ahora viene la serie explicativa, el IEP
% [N]=textread('IndiceEntradaPedidosIndustria2002a2017.csv','%f','delimiter',',','headerlines',0);
N = load(fullfile('data', 'IEP2002a2017.dat'));
% N=flipud(N);
% N=N(9*12+1:end,:);%nos quedamos 2011-2017%
ser.ninput = 1; % Hay 1 serie explicativa
%[yx]=diffest(M,N,12,0,1,1,0,0)
%y=yx(:,1);
%y=y-mean(y);
%x=yx(:,2);
%x=x-mean(x);
ser.Yin = N; % Serie explicativa (IEP) diferenciada y sin media
ser.yor = M; % Serie explicada (IPI) diferenciada y sin media
ser.nlagtf = -1; % Nro. retardos para ident. automatica determinado por el programa
% ser.maxndtf=13;
% ser.maxddtf=0;
ser.tfident = 1; % Se hace identificacion automatica
% ser.delay=0;
% ser.ar=0;
% ser.ma=9;
ser.autmid = 1;
ser.pr = 1; %Se crea informe-resumen
ser.gft = 1; %Se hacen gráficos
%ser.dr=0;
%ser.fixdif=1;
ser.prelivar = 0;
ser.npr = 4;
ser.modpred.pred = [113.9012; 113.1563; 124.8174; 114.1715];
ser.modinput.mod = 1;
p1 = [-1, 1];
p2 = [-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
q1 = [0.3203, -1.0722, 1];
q2 = [-0.6043, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
p12 = conv(p1, p2);
q12 = conv(q1, q2);
ser.modinput.phi = p12;
ser.modinput.theta = q12;
ser.modinput.sigma2 = 4.6532^2;
%ser.maxndtf=3;
%ser.maxddtf=3;
ser.ds = 1;
ser.fixdif = 0;
