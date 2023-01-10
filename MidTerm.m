xzfunction varargout = MidTerm(varargin)
% MIDTERM MATLAB code for MidTerm.fig
%      MIDTERM, by itself, creates a new MIDTERM or raises the existing
%      singleton*.
%
%      H = MIDTERM returns the handle to a new MIDTERM or the handle to
%      the existing singleton*.
%
%      MIDTERM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MIDTERM.M with the given input arguments.
%
%      MIDTERM('Property','Value',...) creates a new MIDTERM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MidTerm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MidTerm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MidTerm

% Last Modified by GUIDE v2.5 06-Sep-2021 14:00:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MidTerm_OpeningFcn, ...
                   'gui_OutputFcn',  @MidTerm_OutputFcn, ...
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


% --- Executes just before MidTerm is made visible.
function MidTerm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MidTerm (see VARARGIN)

% Choose default command line output for MidTerm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MidTerm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MidTerm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = imread('honda.jpg');
axes(handles.axes1)
imshow(f),title('Input Image');
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
set(handles.popupmenu1,'enable','on');

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
switch get(handles.popupmenu1,'Value')
    case 1
        set(handles.slider1,'visible','off');
        f = imread('honda.jpg');
        f = im2double(f(:,:,1));
        nnf=imnoise(f,'gaussian');
        h=(1/9)*ones(3,3);
        for i=1:size(f,1)-2
            for j=1:size(f,2)-2
            w=nnf(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
            g(i,j)=sum(sum(w.*h)); % average filter
            end
        end
        g=mat2gray(g);
        axes(handles.axes2),imshow(g),title('Output Image');
     
    case 2
        set(handles.slider1,'visible','off');
        f = imread('honda.jpg');
        f = im2double(f(:,:,1));
        nf=imnoise(f,'salt & pepper');
        for i=1:size(f,1)-2
            for j=1:size(f,2)-2
            w=nf(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
            g2(i,j)=median(median(w)); % median filter
            end
        end
        g2=mat2gray(g2);
        axes(handles.axes2)
        imshow(g2),title('Output Image');
        
     case 3
        set(handles.slider1,'visible','off');
        f = imread('honda.jpg');
        f=im2double(f(:,:,1));
        nf=imnoise(f,'salt & pepper');
        for i=1:size(f,1)-2
            for j=1:size(f,2)-2
            w=nf(i:i+2,j:j+2); % i,j=1  f(1:3,1:3)
            g2(i,j)=max(max(w)); 
            end
        end
        g2=mat2gray(g2);
        axes(handles.axes2)
        imshow(g2),title('Output Image');
        
    case 4
        set(handles.slider1,'visible','on');
        
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
set(handles.slider1,'visible','on');
        r = im2double(handles.red);
        g = im2double(handles.green);
        b = im2double(handles.blue);
        f = (r+g+b)/3;
        f = mat2gray(f);
        

        for i=1:size(f,1)
            for j=1:size(f,2)
              if f(i,j)> get(handles.slider1,'Value')
            g(i,j)=1;
              else
            g(i,j)=0;
              end
            end
        end
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
