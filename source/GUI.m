function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
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
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 14-Feb-2022 00:03:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
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
startingFolder = 'F:/';
if ~exist(startingFolder, 'dir')
  % If that folder doesn't exist, just start in the current folder.
  startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
  % User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName);
a = imread(fullFileName);
axes(handles.axes1);
imshow(a);
setappdata(0, 'image1', a);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
startingFolder = 'F:/';
if ~exist(startingFolder, 'dir')
  % If that folder doesn't exist, just start in the current folder.
  startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
  % User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName);
a = imread(fullFileName);
axes(handles.axes2);
imshow(a);
setappdata(0, 'image2', a);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
[~,~,z] = size(image);
axes(handles.axes3);
if z == 1
    a = myimhist(image);
    a.FaceColor = 'black';
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image2');
[~,~,z] = size(image);
axes(handles.axes4);
if z == 1
    a = myimhist(image);
    a.FaceColor = 'black';
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image3');
[~,~,z] = size(image);
axes(handles.axes6);
if z == 1
    a = myimhist(image);
    a.FaceColor = 'black';
end


% --- Executes on button press in contrast_enhancment.
function contrast_enhancment_Callback(hObject, eventdata, handles)
% hObject    handle to contrast_enhancment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
image = contrast_enhancment(image);
axes(handles.axes5);
imshow(image);
setappdata(0, 'image3', image);

% --- Executes on button press in histogram_equalization.
function histogram_equalization_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_equalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
image = histogram_eq(image);
axes(handles.axes5);
imshow(image);
setappdata(0, 'image3', image);

% --- Executes on button press in histogram_specification.
function histogram_specification_Callback(hObject, eventdata, handles)
% hObject    handle to histogram_specification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
spec = getappdata(0, 'image2');
[~,~,z] = size(image);
[~,~,c] = size(spec);
axes(handles.axes5);
if z > 1 && c > 1
    r1=image(:,:,1);
    g1=image(:,:,2);
    b1=image(:,:,3);
    r2=spec(:,:,1);
    g2=spec(:,:,2);
    b2=spec(:,:,3);
    a=histogram_spec(r1,r2);
    b=histogram_spec(g1,g2);
    c=histogram_spec(b1,b2);
    d=cat(3,a,b,c);
    imshow(d);
elseif z == 1 && c == 1
    a=histogram_spec(image,spec);
    d=cat(3,a);
    imshow(d);
else
    d = image;
end
setappdata(0, 'image3', d);

% --- Executes on button press in ghist1.
function ghist1_Callback(hObject, eventdata, handles)
% hObject    handle to ghist1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
[~,~,z] = size(image);
axes(handles.axes3);
if z > 1
    greenChannel = image(:,:,2);
    a = myimhist(greenChannel);
    a.FaceColor = 'green';
end

% --- Executes on button press in bhist1.
function bhist1_Callback(hObject, eventdata, handles)
% hObject    handle to bhist1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
[~,~,z] = size(image);
axes(handles.axes3);
if z > 1
    blueChannel = image(:,:,3);
    a = myimhist(blueChannel);
    a.FaceColor = 'blue';
end

% --- Executes on button press in rhist1.
function rhist1_Callback(hObject, eventdata, handles)
% hObject    handle to rhist1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image1');
[~,~,z] = size(image);
axes(handles.axes3);
if z > 1
    redChannel = image(:,:,1);
    a = myimhist(redChannel);
    a.FaceColor = 'red';
end

% --- Executes on button press in rhist2.
function rhist2_Callback(hObject, eventdata, handles)
% hObject    handle to rhist2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image2');
[~,~,z] = size(image);
axes(handles.axes4);
if z > 1
    redChannel = image(:,:,1);
    a = myimhist(redChannel);
    a.FaceColor = 'red';
end

% --- Executes on button press in bhist2.
function bhist2_Callback(hObject, eventdata, handles)
% hObject    handle to bhist2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image2');
[~,~,z] = size(image);
axes(handles.axes4);
if z > 1
    blueChannel = image(:,:,3);
    a = myimhist(blueChannel);
    a.FaceColor = 'blue';
end

% --- Executes on button press in ghist2.
function ghist2_Callback(hObject, eventdata, handles)
% hObject    handle to ghist2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image2');
[~,~,z] = size(image);
axes(handles.axes4);
if z > 1
    greenChannel = image(:,:,2);
    a = myimhist(greenChannel);
    a.FaceColor = 'green';
end

% --- Executes on button press in bhist3.
function bhist3_Callback(hObject, eventdata, handles)
% hObject    handle to bhist3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image3');
[~,~,z] = size(image);
axes(handles.axes6);
if z > 1
    blueChannel = image(:,:,3);
    a = myimhist(blueChannel);
    a.FaceColor = 'blue';
end

% --- Executes on button press in ghist3.
function ghist3_Callback(hObject, eventdata, handles)
% hObject    handle to ghist3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image3');
[~,~,z] = size(image);
axes(handles.axes6);
if z > 1
    greenChannel = image(:,:,2);
    a = myimhist(greenChannel);
    a.FaceColor = 'green';
end

% --- Executes on button press in rhist3.
function rhist3_Callback(hObject, eventdata, handles)
% hObject    handle to rhist3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getappdata(0, 'image3');
[~,~,z] = size(image);
axes(handles.axes6);
if z > 1
    redChannel = image(:,:,1);
    a = myimhist(redChannel);
    a.FaceColor = 'red';
end
