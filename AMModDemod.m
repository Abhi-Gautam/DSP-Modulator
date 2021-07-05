function varargout = AMModDemod_Demo1(varargin)
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Developed By  Abhishek Gautam
%
%%%%%%%%%%%%%%%%%%%
%%
% AMMODDEMOD_DEMO1 M-file for AMModDemod_Demo1.fig
%      AMMODDEMOD_DEMO1, by itself, creates a new AMMODDEMOD_DEMO1 or raises the existing
%      singleton*.
%
%      H = AMMODDEMOD_DEMO1 returns the handle to a new AMMODDEMOD_DEMO1 or the handle to
%      the existing singleton*.
%
%      AMMODDEMOD_DEMO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AMMODDEMOD_DEMO1.M with the given input arguments.
%
%      AMMODDEMOD_DEMO1('Property','Value',...) creates a new AMMODDEMOD_DEMO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AMModDemod_Demo1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AMModDemod_Demo1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AMModDemod_Demo1

% Last Modified by GUIDE v2.5 19-May-2021 13:23:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AMModDemod_Demo1_OpeningFcn, ...
                   'gui_OutputFcn',  @AMModDemod_Demo1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before AMModDemod_Demo1 is made visible.
function AMModDemod_Demo1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AMModDemod_Demo1 (see VARARGIN)

% Choose default command line output for AMModDemod_Demo1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AMModDemod_Demo1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AMModDemod_Demo1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

vm=get(handles.slider1,'value'); % Amplitude of Modulating Signal

fm=get(handles.slider2,'value'); % Frequency of Modulating Signal

handles.ejex=0:1/1000:1;
axes(handles.axes1)
set(handles.text3,'string',vm);

set(handles.text4,'string',fm);

% axes(handles.axes1)
v_m=vm*cos(2*pi*fm*handles.ejex); % Modulating Signal Waveform

plot(handles.ejex,v_m,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('MOD SIGNAL');
ylabel('Amplitude'); 
xlabel('Time (s)'); % Display Modulating Signal

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

vm=get(handles.slider1,'value');

fm=get(handles.slider2,'value');

handles.ejex=0:1/1000:1;
axes(handles.axes1)
set(handles.text3,'string',vm);

set(handles.text4,'string',fm);
% Plot the message Signal
% axes(handles.axes1)
v_m=vm*cos(2*pi*fm*handles.ejex);

plot(handles.ejex,v_m,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('Mod SIGNAL');
ylabel('Amplitude');
xlabel('Time (s)');

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

vc=get(handles.slider3,'value'); % Carrier Signal Amplitude
fc=get(handles.slider4,'value');  % Carrier Signal Frequency

handles.ejex=0:1/1000:1;
axes(handles.axes2)
set(handles.text12,'string',vc);
set(handles.text14,'string',fc);
% axes(handles.axes1)
v_c=vc*cos(2*pi*fc*handles.ejex); % Carrier signal Waveform
% Plot the Carrier Signal
plot(handles.ejex,v_c,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('CARRIER SIGNAL');
ylabel('Amplitude');
xlabel('Time (s)');
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');

handles.ejex=0:1/1000:1;
axes(handles.axes2)
set(handles.text12,'string',vc);
set(handles.text14,'string',fc);
% axes(handles.axes1)
v_c=vc*cos(2*pi*fc*handles.ejex); %Carrier Signal Waveform

plot(handles.ejex,v_c,'-','Color',[0 1 0]);
%y_c=cos(2*pi*100*handles.ejex);
% title('CARRIER SIGNAL');
ylabel('Amplitude');
xlabel('Time (s)'); %Display Carrier Signal
% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');
vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');
handles.ejex=0:1/1000:1;
% First we check which button is pressed DSB-FC, DSB-SC or SSB
% We make the AM wave calculation for that respective modulation.
% We plot the AM waveform then we calculate the various powers and
% Bandwidth using standard formulas.
if(togglebutton1_Callback(handles.togglebutton1, eventdata, handles) == 1)
    v_m=vm*cos(2*pi*fm*handles.ejex);
    v_c=vc*cos(2*pi*fc*handles.ejex);
    v_am=v_m.*v_c;
    axes(handles.axes3)

    plot(handles.ejex,v_am);
    powercarrier = rms(v_c);
    power = rms(v_am);
    powerside = power/2;
    bandwidth = 2*fm;
    set(handles.text22,'string',power);
    set(handles.text24,'string',powerside);
    set(handles.text25,'string',powercarrier);
    set(handles.text29,'string',bandwidth);

    title('AM Envelope');
    ylabel('Amplitude'); % Time Domain Representation Of AM Signal 
    xlabel('Time (s)');
elseif(togglebutton5_Callback(handles.togglebutton5, eventdata, handles) == 2)
    v_m=vm*cos(2*pi*fm*handles.ejex);
    v_c=vc*cos(2*pi*fc*handles.ejex);
    v_am= v_c + vm/2*(cos(2*pi*(fc-fm)*handles.ejex)+cos(2*pi*(fc+fm)*handles.ejex));
    axes(handles.axes3)

    plot(handles.ejex,v_am);
    powercarrier = rms(v_c);
    power = rms(v_am);
    powerside = (power-powercarrier)/2;
    bandwidth = 2*fm;
    set(handles.text22,'string',power);
    set(handles.text24,'string',powerside);
    set(handles.text25,'string',powercarrier);
    set(handles.text29,'string',bandwidth);

    title('AM Envelope');
    ylabel('Amplitude'); % Time Domain Representation Of AM Signal 
    xlabel('Time (s)');
elseif(togglebutton4_Callback(handles.togglebutton4, eventdata, handles) == 3)
    v_m=vm*sin(2*pi*fm*handles.ejex);
    v_c=vc*sin(2*pi*fc*handles.ejex);
    x1 = cos(2*pi*fc*handles.ejex).*cos(2*pi*fm*handles.ejex);
    x2 = sin(2*pi*fc*handles.ejex).*sin(2*pi*fm*handles.ejex);
    x3 = x1+x2;
    %x4 = x1-x2;
    v_am = vm*(x3);
    %SSBSC_usb = vm*(x4);
    axes(handles.axes3)

    plot(handles.ejex,v_am);
    powercarrier = rms(v_c);
    power = rms(v_am);
    powerside = power;
    bandwidth = fm;
    set(handles.text22,'string',power);
    set(handles.text24,'string',powerside);
    set(handles.text25,'string',powercarrier);
    set(handles.text29,'string',bandwidth);

    title('AM Envelope');
    ylabel('Amplitude'); % Time Domain Representation Of AM Signal 
    xlabel('Time (s)');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');

handles.ejex=0:1/1000:1;
vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');

% First we check which button is pressed DSB-FC, DSB-SC or SSB
% We make the FFT calculation for that respective modulation.
% We plot the FFT waveform of the respective AM Signal.
if(togglebutton1_Callback(handles.togglebutton1, eventdata, handles) == 1)
    v_m=vm*cos(2*pi*fm*handles.ejex);
    v_c=vc*cos(2*pi*fc*handles.ejex);
    v_am=v_m.*v_c;
    w=v_am;
    Ts=1/1000;
    N=256;
    y = fft(w(1:N)); % y contains 256 complex amplitudes
    m = abs(y); % m = magnitude of sinusoids
    % plot spectrum 0....fs/2
    ff=(-N/2:N/2-1)/(Ts*N);
    fws=fftshift(m);
    axes(handles.axes4)
    plot(ff,fws);
    xlabel('Frequency')
    ylabel('Magnitude');
    title('Spectrum of AM signal');
elseif(togglebutton5_Callback(handles.togglebutton5, eventdata, handles) == 2)
    v_m=vm*cos(2*pi*fm*handles.ejex);
    v_c=vc*cos(2*pi*fc*handles.ejex);
    v_am= v_c + vm/2*(cos(2*pi*(fc-fm)*handles.ejex)+cos(2*pi*(fc+fm)*handles.ejex));
    w=v_am;
    Ts=1/1000;
    N=256;
    y = fft(w(1:N)); % y contains 256 complex amplitudes
    m = abs(y); % m = magnitude of sinusoids
    % plot spectrum 0....fs/2
    ff=(-N/2:N/2-1)/(Ts*N);
    fws=fftshift(m);
    axes(handles.axes4)
    plot(ff,fws);
    xlabel('Frequency')
    ylabel('Magnitude');
    title('Spectrum of AM signal');
elseif(togglebutton4_Callback(handles.togglebutton4, eventdata, handles) == 3)
    v_m=vm*sin(2*pi*fm*handles.ejex);
    v_c=vc*sin(2*pi*fc*handles.ejex);
    x1 = cos(2*pi*fc*handles.ejex).*cos(2*pi*fm*handles.ejex);
    x2 = sin(2*pi*fc*handles.ejex).*sin(2*pi*fm*handles.ejex);
    x3 = x1+x2;
    %x4 = x1-x2;
    v_am = vm*(x3);
    %SSBSC_usb = vm*(x4);
    w=v_am;
    Ts=1/1000;
    N=256;
    y = fft(w(1:N)); % y contains 256 complex amplitudes
    m = abs(y); % m = magnitude of sinusoids
    % plot spectrum 0....fs/2
    ff=(-N/2:N/2-1)/(Ts*N);
    fws=fftshift(m);
    axes(handles.axes4)
    plot(ff,fws);
    xlabel('Frequency')
    ylabel('Magnitude');
    title('Spectrum of AM signal');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vm=get(handles.slider1,'value');
fm=get(handles.slider2,'value');
vc=get(handles.slider3,'value');
fc=get(handles.slider4,'value');
handles.ejex=0:1/1000:1;

v_m=vm*cos(2*pi*fm*handles.ejex);
v_c=vc*cos(2*pi*fc*handles.ejex);

v_am=v_m.*v_c;

y=v_am;
fs=1000; % Specify Sampling Freqency
x_out = demod(y,fc,fs,'am'); % Demodulate AM Signal

axes(handles.axes7)

plot(handles.ejex,x_out); % Dispaly AM Demodulator Output

if(togglebutton1_Callback(handles.togglebutton1, eventdata, handles) == 1)
    v_m=vm*cos(2*pi*fm*handles.ejex);
    v_c=vc*cos(2*pi*fc*handles.ejex);
    v_am=v_m.*v_c;
    y=v_am;
    fs=1000; % Specify Sampling Freqency
    x_out = demod(y,fc,fs,'amdsb-sc'); % Demodulate AM Signal
    %Using matlab inbuilt function for demodulating dsb-sc AM.
    axes(handles.axes7)
    plot(handles.ejex,x_out); % Dispaly AM Demodulator Output
    
elseif(togglebutton5_Callback(handles.togglebutton5, eventdata, handles) == 2)
    v_m=vm*cos(2*pi*fm*handles.ejex);
    v_c=vc*cos(2*pi*fc*handles.ejex);
    v_am= v_c + vm/2*(cos(2*pi*(fc-fm)*handles.ejex)+cos(2*pi*(fc+fm)*handles.ejex));
    y=v_am;
    fs=1000; % Specify Sampling Freqency
    x_out = demod(y,fc,fs,'amdsb-tc'); % Demodulate AM Signal
    %Using matlab inbuilt function for demodulating dsb-tc AM.
    axes(handles.axes7)
    plot(handles.ejex,x_out); % Dispaly AM Demodulator Output
elseif(togglebutton4_Callback(handles.togglebutton4, eventdata, handles) == 3)
    v_m=vm*sin(2*pi*fm*handles.ejex);
    v_c=vc*sin(2*pi*fc*handles.ejex);
    x1 = cos(2*pi*fc*handles.ejex).*cos(2*pi*fm*handles.ejex);
    x2 = sin(2*pi*fc*handles.ejex).*sin(2*pi*fm*handles.ejex);
    x3 = x1+x2;
    %x4 = x1-x2;
    v_am = vm*(x3);
    %SSBSC_usb = vm*(x4);
    y=v_am;
    fs=1000; % Specify Sampling Freqency
    x_out = demod(y,fc,fs,'amssb'); % Demodulate AM Signal
    %Using matlab inbuilt function for demodulating amssb AM.
    axes(handles.axes7)
    plot(handles.ejex,x_out); % Dispaly AM Demodulator Output
end


% --- Executes during object creation, after setting all properties.
function text19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% Reset every widget with initial value.
set(handles.slider1,'Value',0);
set(handles.slider2,'Value',0);
set(handles.slider3,'Value',0);
set(handles.slider4,'Value',0);
set(handles.text3,'String', '');
set(handles.text4,'String', '');
set(handles.text12,'String', '');
set(handles.text14,'String', '');
set(handles.text22,'String', '');
set(handles.text24,'String', '');
set(handles.text25,'String', '');
set(handles.text29,'String', '');
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');
cla(handles.axes4,'reset');
cla(handles.axes7,'reset');


% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton1.
function modChoice = togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    modChoice = 1;
elseif button_state == get(hObject,'Min')
    modChoice = 0;
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in togglebutton4.
function modChoice = togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    modChoice = 3;
elseif button_state == get(hObject,'Min')
    modChoice = 0;
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton4


% --- Executes on button press in togglebutton5.
function modChoice = togglebutton5_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
    modChoice = 2;
elseif button_state == get(hObject,'Min')
    modChoice = 0;
end
% Hint: get(hObject,'Value') returns toggle state of togglebutton5
