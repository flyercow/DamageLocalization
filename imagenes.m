function varargout = imagenes(varargin)
% IMAGENES M-file for imagenes.fig
%      IMAGENES, by itself, creates a new IMAGENES or raises the existing
%      singleton*.
%
%      H = IMAGENES returns the handle to a new IMAGENES or the handle to
%      the existing singleton*.
%
%      IMAGENES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGENES.M with the given input arguments.
%
%      IMAGENES('Property','Value',...) creates a new IMAGENES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imagenes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imagenes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imagenes

% Last Modified by GUIDE v2.5 14-Jun-2014 11:35:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagenes_OpeningFcn, ...
                   'gui_OutputFcn',  @imagenes_OutputFcn, ...
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

%------------------------------------------------------------------------


% --- Executes just before imagenes is made visible.
function imagenes_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imagenes (see VARARGIN)

% Choose default command line output for imagenes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imagenes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imagenes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)

inf=get(hObject,'Value');
gos=get(hObject,'String');

switch inf

case 1
axes(handles.axes1)
background = imread('A_Modelo1_Viga_biempotrada.jpg');
axis off;
imshow(background);
set(handles.txt1,'string',['The model consists on a IPE-80 profile wiht both ends clamped, 5 meters long, divided into twenty-five 20 cm long elements. Introduce damage location between 1 and 25.']);
modelo=1;

case 2
axes(handles.axes1)
background = imread('A_Modelo2_Viga_biapoyada.jpg');
axis off;
imshow(background);
set(handles.txt1,'string',['The model consists on a IPE-80 profile wiht both ends fixed, 5 meters long, divided into twenty-five 20 cm long elements. Introduce damage location between 1 and 25.']);
modelo=2;

case 3
axes(handles.axes1)
background = imread('A_Modelo3_Viga_empotrada_apoyada.jpg');
axis off;
imshow(background);
set(handles.txt1,'string',['The model consists on a IPE-80 profile, with one end fixed and the other one clamped, 5 meters long, divided into twenty-five 20 cm long elements. Introduce damage location between 1 and 25.']);
modelo=3;

case 4
axes(handles.axes1)
background = imread('A_Modelo4_Viga_voladizo.jpg');
axis off;
imshow(background);
set(handles.txt1,'string',['The model consists on a IPE-80 profile cantilever beam, 5 meters long, divided into twenty-five 20 cm long elements. Introduce damage location between 1 and 25.']);
modelo=4;

case 5
axes(handles.axes1)
background = imread('A_Modelo5_celosia.jpg');
axis off;
imshow(background);
set(handles.txt1,'string',['The model consists on a planar truss formed by 44 bars divided into ten 3 meters width modules. Steel bars are have a 64.5 cm2 cross-section. Introduce damage location between 1 and 44.']);
modelo=5;

end

handles.modelo=modelo;
guidata(hObject,handles);


% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipanel3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
metodo=1;
handles.metodo=metodo;
guidata(hObject,handles);
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

% Metodo1=handles.metodo1;
% Metodo2=handles.metodo2;
% Metodo3=handles.metodo3;
% Metodo4=handles.metodo4;
% Metodo5=handles.metodo5;
% Metodo6=handles.metodo6;

    if handles.togglebuttonfrec==1
        A_Metodo1_Variacion_frecuencias_naturales;
    end
    
    if handles.togglebuttonmod==1
        A_Metodo2_Variacion_modos;
    end
    
    if handles.togglebutton8==1
        A_Metodo3_Matriz_MAC;
    end
    
    if handles.togglebutton9==1
        A_Metodo4_Variacion_curvatura_modos;
    end
    
    if handles.togglebutton10==1
        A_Metodo5_Variacion_matriz_flexibilidad;
    end
    
    if handles.togglebutton11==1
        A_Metodo6_DLV;
    end
    damage
    

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close all;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebuttonfrec.
function togglebuttonfrec_Callback(hObject, eventdata, handles)

metodo1=get(hObject,'Value');
handles.togglebuttonfrec=metodo1;
guidata(hObject,handles);



% hObject    handle to togglebuttonfrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebuttonfrec


% --- Executes on button press in togglebuttonmod.
function togglebuttonmod_Callback(hObject, eventdata, handles)

metodo2=get(hObject,'Value');
handles.togglebuttonmod=metodo2;
guidata(hObject,handles);


% hObject    handle to togglebuttonmod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebuttonmod







% --- Executes during object creation, after setting all properties.
function uipanel7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton8.
function togglebutton8_Callback(hObject, eventdata, handles)
metodo3=get(hObject,'Value');
handles.togglebutton8=metodo3;
guidata(hObject,handles);

% hObject    handle to togglebutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton8


% --- Executes on button press in togglebutton9.
function togglebutton9_Callback(hObject, eventdata, handles)
metodo4=get(hObject,'Value');
handles.togglebutton9=metodo4;
guidata(hObject,handles);


% hObject    handle to togglebutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton9


% --- Executes on button press in togglebutton10.
function togglebutton10_Callback(hObject, eventdata, handles)
metodo5=get(hObject,'Value');
handles.togglebutton10=metodo5;
guidata(hObject,handles);

% hObject    handle to togglebutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton10


% --- Executes on button press in togglebutton11.
function togglebutton11_Callback(hObject, eventdata, handles)
metodo6=get(hObject,'Value');
handles.togglebutton11=metodo6;
guidata(hObject,handles);



% hObject    handle to togglebutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton11


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)

handles.slider2=get(hObject,'Value');
handles.slider2=handles.slider2*100;
handles.slider2=round(handles.slider2);
set(handles.text6,'String',handles.slider2);
guidata(hObject,handles);
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)
Val=get(hObject,'String'); %Almacenar valor ingresado
NewVal = str2double(Val); %Transformar a formato double
handles.edit3=NewVal; %Almacenar en identificador
guidata(hObject,handles); %Salvar datos de la aplicación

% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
handles.slider3=get(hObject,'Value');
handles.slider3=handles.slider3*100;
handles.slider3=round(handles.slider3);
set(handles.text7,'String',handles.slider3);
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
ruido=get(hObject,'Value');
handles.radiobutton1=ruido;
guidata(hObject,handles);
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes during object creation, after setting all properties.
function togglebutton8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


