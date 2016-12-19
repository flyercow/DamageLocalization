function varargout = dsfahdz(varargin)
% DSFAHDZ M-file for dsfahdz.fig
%      DSFAHDZ, by itself, creates a new DSFAHDZ or raises the existing
%      singleton*.
%
%      H = DSFAHDZ returns the handle to a new DSFAHDZ or the handle to
%      the existing singleton*.
%
%      DSFAHDZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSFAHDZ.M with the given input arguments.
%
%      DSFAHDZ('Property','Value',...) creates a new DSFAHDZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dsfahdz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dsfahdz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dsfahdz

% Last Modified by GUIDE v2.5 22-Apr-2014 17:42:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dsfahdz_OpeningFcn, ...
                   'gui_OutputFcn',  @dsfahdz_OutputFcn, ...
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


% --- Executes just before dsfahdz is made visible.
function dsfahdz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dsfahdz (see VARARGIN)

% Choose default command line output for dsfahdz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dsfahdz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dsfahdz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)

die=get(hObject,'Value');
handles.die=die;
if handles.die==1
    metodo1=1;
else
    metodo1=0;
end
handles.metodo1=metodo1;
guidata(hObject,handles);

% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)

die2=get(hObject,'Value');
handles.die2=die2;
if handles.die2==1
    metodo2=1;
else
    metodo2=0;
end
handles.metodo2=metodo2;
guidata(hObject,handles);
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)

inf=get(hObject,'Value');
gos=get(hObject,'String');

switch inf

case 1
axes(handles.axes1)
background = imread('coche.jpg');
axis off;
imshow(background);
set(handles.text2,'string',['Esto es un coche.']);
modelo=1;

case 2
axes(handles.axes1)
background = imread('moto.jpg');
axis off;
imshow(background);
set(handles.text2,'string',['Esto es una moto.']);
modelo=2;

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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

if handles.metodo1==1
        A_Metodo1_Variacion_frecuencias_naturales;
end
    
if handles.metodo2==1
        A_Metodo2_Variacion_modos;
end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


