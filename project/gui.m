function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 02-Jun-2020 20:08:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

opts = detectImportOptions('covid_data.xlsx');
opts.SelectedVariableNames = [2 3 4]; 
[day, month, year] = readvars('covid_data.xlsx',opts);
str = sprintf('%d-%d-%d', day(1), month(1), year(1));
set(handles.date_txt, 'String', str);
v1=1;
v2=2;

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonUpdateData.
function buttonUpdateData_Callback(hObject, eventdata, handles)
% hObject    handle to buttonUpdateData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_data
complexData


% --- Executes on selection change in statsMenu.
function statsMenu_Callback(hObject, eventdata, handles)
% hObject    handle to statsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject, 'String'));
val = contents(get(hObject, 'Value'))
if(strcmp(val, "Countries with most cases"))
    plot_top10cases
elseif(strcmp(val, "Countries with most fatalities"))
    plot_top10deaths
elseif(strcmp(val, "Countries with most cases per 1000"))
    plot_top10casesPer1000
elseif(strcmp(val, "Countries with least cases per 1000"))
    plot_low10casesPer1000
elseif(strcmp(val, "Countries with most fatalities per 1000"))
    plot_top10deathsPer1000
elseif(strcmp(val, "Countries with least fatalities per 1000"))
    plot_low10deathsPer1000
end
% Hints: contents = cellstr(get(hObject,'String')) returns statsMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from statsMenu


% --- Executes during object creation, after setting all properties.
function statsMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in corelation1.
function corelation1_Callback(hObject, eventdata, handles)
% hObject    handle to corelation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns corelation1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from corelation1


% --- Executes during object creation, after setting all properties.
function corelation1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to corelation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in corelation2.
function corelation2_Callback(hObject, eventdata, handles)
% hObject    handle to corelation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns corelation2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from corelation2


% --- Executes during object creation, after setting all properties.
function corelation2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to corelation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in drawCorrelation.
function drawCorrelation_Callback(hObject, eventdata, handles)
% hObject    handle to drawCorrelation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
v1 = get(handles.corelation1,'Value');
v2 = get(handles.corelation2,'Value');
switch v1
    case 1
        val1=15;
    case 2
        val1=13;
    case 3
        val1=14;
end
switch v2
    case 1
        val2=8;
    case 2
        val2=9;       
    case 3
        val2=10;      
    case 4
        val2=12;        
    case 5
        val2=11;
end
val1
val2
names1 = get(handles.corelation1,'String');
names2 = get(handles.corelation2,'String');
correlations(val1, val2, names1(v1), names2(v2))
axes(handles.axes1, 'RESET');




% --- Executes on button press in heatmapButton.
function heatmapButton_Callback(hObject, eventdata, handles)
% hObject    handle to heatmapButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
heatmap;

