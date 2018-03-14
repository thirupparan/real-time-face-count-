function [] = Login

%% Creat Figure
base_color = (rand(1,3)+rand(1,3))./2;
set(0,'units','pixels');
position = get(0,'screensize');
height = 150;
width = 400;
cdata = generate_cdata(height,width,base_color);

fig = figure('Name','Login',...
    'Numbertitle','off',...
    'Position',[(position(3)/2)-(width/2) (position(4)/2)-(height/2) width height],...
    'Resize','off',...
    'Menubar','none');
%% Creat Axes
axe = axes('Parent',fig,...
    'Units','pixels',...
    'Position',[0 0 width height],...
    'Xcolor','w',...
    'Ycolor','w',...
    'FontSize',12,...
    'Fontname','Cambria',...
    'Xtick',[],...
    'Ytick',[]);

imshow(cdata);

text(30,40,'User ID     : ',...
    'FontSize',12,...
    'Fontname','Cambria',...
    'Color','w');

text(30,80,'Password : ',...
    'FontSize',12,...
    'Fontname','Cambria',...
    'Color','w');
%% Creat Pushbutton
temp1 = getframe(axe,[300 15 80 30]);

uicontrol('Style','pushbutton',...
    'Units','pixel',...
    'Position',[300 15 80 30],...
    'Foregroundcolor','w',...
    'FontSize',12,...
    'Fontname','Cambria',...
    'Fontweight','bold',...
    'String','Login',...
    'Cdata',temp1.cdata,...
    'Callback',@pus1_callback);

    function [] = pus1_callback(varargin)
        ID = get(edit1,'string');
        PW = get(edit2,'UserData');
        if strcmp(ID,'thirupparan') && strcmp(PW,'thiru1234')
            msgbox('Login Sucessful');
            count();
            close(fig);
        else
            errordlg('Invalid ID or Password');
        end
    end

%% Creat Edit Boxes

edit1 = uicontrol('Style','edit',...
    'Units','pixel',...
    'Position',[125 100 200 18],...
    'HorizontalAlignment','left',...
    'Foregroundcolor','w',...
    'FontSize',12,...
    'Fontname','Cambria',...
    'Fontweight','bold',...
    'Backgroundcolor',base_color.*135/400);

edit2 = uicontrol('Style','edit',...
    'Units','pixel',...
    'Position',[125 60 200 18],...
    'HorizontalAlignment','left',...
    'Foregroundcolor','w',...
    'FontSize',16,...
    'Fontname','Cambria',...
    'Fontweight','bold',...
    'Backgroundcolor',base_color.*235/400,...
    'KeyPressFcn',@edit2_keypressfcn);

    function [] = edit2_keypressfcn(varargin)
        password = get(edit2,'userdata');
        key = get(fig,'currentkey');
        switch key
            case 'backspace'
                password = password(1:end-1); 
                SizePass = size(password); 
                if SizePass(2) > 0
                    asterisk(1,1:SizePass(2)) = '�';
                    set(edit2,'String',asterisk) 
                else
                    set(edit2,'String','')
                end
                set(edit2,'Userdata',password) %
            case 'escape'
            case 'insert'
            case 'delete'
            case 'home'
            case 'pageup'
            case 'pagedown'
            case 'end'
            case 'rightarrow'
            case 'downarrow'
            case 'leftarrow'
            case 'uparrow'
            case 'shift'
            case 'return'
            case 'alt'
            case 'control'
            case 'windows'
            otherwise
                password = [password get(fig,'currentcharacter')];
                SizePass = size(password); 
                if SizePass(2) > 0
                    asterisk(1:SizePass(2)) = '*'; 
                    set(edit2,'string',asterisk) 
                else
                    set(edit2,'String','');
                end
                set(edit2,'Userdata',password) ;
        end
    end
%% Normailed Figure
set(axe,'Units','Normalized',...
    'Handlevisibility','off');
%% Cdata
    function cdata = generate_cdata(height,width,base_color)
        cdata = zeros(height,width,3);
        [height width page] = size(cdata);
        for i = 1:height
            color = base_color.*(i/height);
            for j = 1:page
                cdata(i,:,j) = color(j);
            end
        end
    end
end