function varargout = mygui2(varargin)
% MYGUI2 MATLAB code for mygui2.fig
%      MYGUI2, by itself, creates a new MYGUI2 or raises the existing
%      singleton*.
%
%      H = MYGUI2 returns the handle to a new MYGUI2 or the handle to
%      the existing singleton*.
%
%      MYGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI2.M with the given input arguments.
%
%      MYGUI2('Property','Value',...) creates a new MYGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mygui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mygui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mygui2

% Last Modified by GUIDE v2.5 16-Aug-2021 15:20:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mygui2_OpeningFcn, ...
                   'gui_OutputFcn',  @mygui2_OutputFcn, ...
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


% --- Executes just before mygui2 is made visible.
function mygui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mygui2 (see VARARGIN)

% Choose default command line output for mygui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mygui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mygui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = imread('honda.jpg');
axes(handles.axes1)
imshow(f);
handles.image = f;
handles.red = f(:,:,1);
handles.green = f(:,:,2);
handles.blue = f(:,:,3);
r = im2double(f(:,:,1));
g = im2double(f(:,:,2));
b = im2double(f(:,:,3));
f = (r+g+b)/3;
handles.gray = f;

guidata(hObject,handles);
set(handles.radiobutton1,'enable','on');
set(handles.radiobutton2,'enable','on');
set(handles.radiobutton3,'enable','on');
set(handles.radiobutton4,'enable','on');
set(handles.popupmenu1,'enable','on');
set(handles.listbox1,'String','Hello. This is my first guide lesson.');

% if (get(handles.radiobutton1,'Value')==1)
%     axes(handles.axes2),imshow(handles.red)
% elseif (get(handles.radiobutton2,'Value')==1)
%     axes(handles.axes2),imshow(handles.green)
% elseif (get(handles.radiobutton3,'Value')==1)
%     axes(handles.axes2),imshow(handles.blue)
% elseif (get(handles.radiobutton4,'Value')==1)
%     r = im2double(handles.red);
%     g = im2double(handles.green);
%     b = im2double(handles.blue);
%     i = (r+g+b)/3;
%     axes(handles.axes2),imshow(i)
% end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
axes(handles.axes1),imshow(handles.red)

% if (get(handles.radiobutton1,'Value')==1)
%     axes(handles.axes1),imshow(handles.red)
% elseif (get(handles.radiobutton2,'Value')==1)
%     axes(handles.axes1),imshow(handles.green)
% elseif (get(handles.radiobutton3,'Value')==1)
%     axes(handles.axes1),imshow(handles.blue)
% elseif (get(handles.radiobutton4,'Value')==1)
%     r = im2double(handles.red);
%     g = im2double(handles.green);
%     b = im2double(handles.blue);
%     i = (r+g+b)/3;
%     axes(handles.axes1),imshow(i)
% end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
axes(handles.axes1),imshow(handles.green)

% if (get(handles.radiobutton1,'Value')==1)
%     axes(handles.axes1),imshow(handles.red)
% elseif (get(handles.radiobutton2,'Value')==1)
%     axes(handles.axes1),imshow(handles.green)
% elseif (get(handles.radiobutton3,'Value')==1)
%     axes(handles.axes1),imshow(handles.blue)
% elseif (get(handles.radiobutton4,'Value')==1)
%     r = im2double(handles.red);
%     g = im2double(handles.green);
%     b = im2double(handles.blue);
%     i = (r+g+b)/3;
%     axes(handles.axes1),imshow(i)
% end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
axes(handles.axes1),imshow(handles.blue)

% if (get(handles.radiobutton1,'Value')==1)
%     axes(handles.axes1),imshow(handles.red)
% elseif (get(handles.radiobutton2,'Value')==1)
%     axes(handles.axes1),imshow(handles.green)
% elseif (get(handles.radiobutton3,'Value')==1)
%     axes(handles.axes1),imshow(handles.blue)
% elseif (get(handles.radiobutton4,'Value')==1)
%     r = im2double(handles.red);
%     g = im2double(handles.green);
%     b = im2double(handles.blue);
%     i = (r+g+b)/3;
%     axes(handles.axes1),imshow(i)
% end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
r = im2double(handles.red);
g = im2double(handles.green);
b = im2double(handles.blue);
i = (r+g+b)/3;
axes(handles.axes1),imshow(i)

% if (get(handles.radiobutton1,'Value')==1)
%     axes(handles.axes1),imshow(handles.red)
% elseif (get(handles.radiobutton2,'Value')==1)
%     axes(handles.axes1),imshow(handles.green)
% elseif (get(handles.radiobutton3,'Value')==1)
%     axes(handles.axes1),imshow(handles.blue)
% elseif (get(handles.radiobutton4,'Value')==1)
%     r = im2double(handles.red);
%     g = im2double(handles.green);
%     b = im2double(handles.blue);
%     i = (r+g+b)/3;
%     i = mat2gray(i);
%     axes(handles.axes1),imshow(i)
% end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(handles.popupmenu1,'Value')
    case 1
        set(handles.listbox1,'String','Thresholding is selected');
        set(handles.slider1,'visible','on');
        set(handles.edit1,'visible','off');    
%         r = im2double(handles.red);
%         g = im2double(handles.green);
%         b = im2double(handles.blue);
%         f = (r+g+b)/3;
%         f = mat2gray(f);
%         T = get(hObject,'Value')/255
%         g = im2bw(f,get(handles.slider1,'Value')); % thresholding
%         axes(handles.axes2),imshow(g)
    case 2
        set(handles.listbox1,'String','Negative is selected');
        set(handles.slider1,'visible','off');
        set(handles.edit1,'visible','off');
        r = im2double(handles.red);
        g = im2double(handles.green);
        b = im2double(handles.blue);
        f = (r+g+b)/3;
        f = mat2gray(f);
        g = imadjust(f, [0 1], [1 0]); % [min max] [min max]
        axes(handles.axes2),imshow(g)
        
    case 3
        set(handles.listbox1,'String','Averaging is selected');
        set(handles.slider1,'visible','off');
        set(handles.edit1,'visible','off');
        h = (1/25)*ones(5,5);
        g = conv2(handles.gray,h);
        g = mat2gray(g);
        axes(handles.axes2),imshow(g)
        
    case 4
        set(handles.listbox1,'String','Edge Detection is selected');
        set(handles.slider1,'visible','off');
        set(handles.edit1,'visible','off');
        hx = ones(3,3);hx(:,2) = 0; hx(:,3) = -1;
        hy = hx';
        gx = abs(conv2(handles.gray,hx));
        gy = abs(conv2(handles.gray,hy));
        g = mat2gray(gx+gy);
        axes(handles.axes2),imshow(g)
        
    case 5
        set(handles.listbox1,'String','Rotation is selected');
        set(handles.slider1,'visible','off');
        set(handles.edit1,'visible','on');
        
        
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
        set(handles.listbox1,'String','Thresholding is selected');
        set(handles.slider1,'visible','on');
        r = im2double(handles.red);
        g = im2double(handles.green);
        b = im2double(handles.blue);
        f = (r+g+b)/3;
        f = mat2gray(f);
        t = get(handles.slider1,'Value');
        g = im2bw(f,get(handles.slider1,'Value')/255); % thresholding
        axes(handles.axes2),imshow(g)


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
ang = str2double(get(hObject,'String'))
g = imrotate(handles.gray,ang);
axes(handles.axes2),imshow(g)

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
