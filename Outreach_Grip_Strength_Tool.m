% Outreach User Input
% Created by Dan Gibbons
% Research Technician - NYIT

% Under Michael Granatosky, PhD - NYIT

clear;
clc;
close all;

HumanData
LemurData

global AppHandler;
AppHandler.all_input_filled = false;
AppHandler.user_mode = 0;
% Import base data sets
AppHandler.LemurDataTable = LemurDataTable;
AppHandler.HumanDataTable = HumanDataTable;
AppHandler.FinalOutputFilled = 0;

% Download lemur images
AppHandler.Photo_catta = imread('Rachel-Hudson-catta-worship.png');
AppHandler.Photo_cheirogaleus = imread('Rachel-Hudson-cheirogaleus-major.png');
AppHandler.Photo_collared = imread('Rachel-Hudson-female-collared-lemur.png');
AppHandler.Photo_danfoss = imread('Rachel-Hudson-Danfoss-Mouse-Lemur.png');
AppHandler.Photo_flavifrons = imread('Rachel-Hudson-female-flavifrons.png');
AppHandler.Photo_aye_aye = imread('Rachel-Hudson-Illustration-aye-aye.png');
AppHandler.Photo_crowned = imread('Rachel-Hudson-male-crowned-lemur.png');
AppHandler.Photo_mongoose = imread('Rachel-Hudson-mongoose-lemur-female.png');
AppHandler.Photo_red_bellied = imread('Rachel-Hudson-Lorenz-von-Liburnau’s-Woolly-Lemur.png');
AppHandler.Photo_ruffed = imread('Ruffed lemur.png');
AppHandler.Photo_sifaka = imread('Sifaka.png');

% Create the base figure to anchor the application to
AppHandler.fig = uifigure('Name','Outreach Graphing Tool');
AppHandler.fig.Position = [20 60 1300 800];

% Ask user for Individual (+1) or Classroom (-1) Mode
AppHandler.Mode_Question_Display = uilabel(AppHandler.fig,"Text",'Do you want "Individual" or "Classroom" mode?');
AppHandler.Mode_Question_Display.Position = [300, 530, 600, 40];
AppHandler.Mode_Question_Display.FontName = "Arial Black";
AppHandler.Mode_Question_Display.FontSize = 20;

% Create Individual Mode Button
AppHandler.loadIndividualModeButton = uibutton(AppHandler.fig,"Text","Individual Mode",'ButtonPushedFcn',@(src,event)LoadIndividualMode);
AppHandler.loadIndividualModeButton.FontName = "Helvetica";
AppHandler.loadIndividualModeButton.FontSize = 16;
AppHandler.loadIndividualModeButton.Position = [500, 470, 150, 30];
% Create Classroom Mode Button
AppHandler.loadClassroomModeButton = uibutton(AppHandler.fig,"Text","Classroom Mode",'ButtonPushedFcn',@(src,event)LoadClassroomMode);
AppHandler.loadClassroomModeButton.FontName = "Helvetica";
AppHandler.loadClassroomModeButton.FontSize = 16;
AppHandler.loadClassroomModeButton.Position = [500, 420, 150, 30];

% Function for loading/building individual mode
function LoadIndividualMode(varargin)
    global AppHandler
    % Individual Mode (+1), 
    % Classroom Mode (-1)
    AppHandler.user_mode = 1; 
    AppHandler.Mode_Question_Display.Visible="off";
    AppHandler.loadIndividualModeButton.Visible="off";
    AppHandler.loadClassroomModeButton.Visible="off";
    
    % Display Title
    AppHandler.GUI_Title = uilabel(AppHandler.fig,"Text","How strong is YOUR force grip?");
    AppHandler.GUI_Title.Position = [475, 730, 600, 40];
    AppHandler.GUI_Title.FontName = "Arial Black";
    AppHandler.GUI_Title.FontSize = 30;
    AppHandler.GUI_Title.FontWeight = "Bold";

    fundedLabel = uilabel(AppHandler.fig,"Text","Funded By:");
    fundedLabel.Position = [175, 760, 200, 30];
    fundedLabel.FontName = "Arial";
    fundedLabel.FontSize = 16;
    
    uiimage(Parent=AppHandler.fig,Position=[25, 600, 200, 200],ImageSource="Picture1.png", ScaleMethod='scaledown');
    uiimage(Parent=AppHandler.fig,Position=[220, 600, 200, 200],ImageSource="Picture2.png", ScaleMethod='scaledown');

    presentedLabel = uilabel(AppHandler.fig,"Text","Presented By:");
    presentedLabel.Position = [1125, 775, 200, 30];
    presentedLabel.FontName = "Arial";
    presentedLabel.FontSize = 16;
    
    uiimage(Parent=AppHandler.fig,Position=[1050, 675, 100, 100],ImageSource="Picture3.png", ScaleMethod='scaledown');
    uiimage(Parent=AppHandler.fig,Position=[1175, 675, 100, 100],ImageSource="Picture4.png", ScaleMethod='scaledown');

    % % Create Enter Birthday Input
    AppHandler.birthdayLabel = uilabel(AppHandler.fig,"Text","Enter your birth year:");
    AppHandler.birthdayLabel.Position = [60, 600, 190, 22];
    AppHandler.birthdayLabel.FontName = "Helvetica";
    AppHandler.birthdayLabel.FontSize = 16;
    AppHandler.birthdayLabel.FontWeight = "Bold";
    AppHandler.birthYearInput = uieditfield(AppHandler.fig, "text","value","Birth Year here (e.g. 1994)");
    AppHandler.birthYearInput.Position = [60, 550, 200, 22];
    
    % Create Enter body weight Input
    AppHandler.bodyweightLabel = uilabel(AppHandler.fig,"Text","Enter your body weight:");
    AppHandler.bodyweightLabel.Position = [60, 500, 190, 22];
    AppHandler.bodyweightLabel.FontName = "Helvetica";
    AppHandler.bodyweightLabel.FontSize = 16;
    AppHandler.bodyweightLabel.FontWeight = "Bold";
    AppHandler.bodyweightInput = uieditfield(AppHandler.fig, "text","value","Body Weight here (in pounds)");
    AppHandler.bodyweightInput.Position = [60, 450, 200, 22];
    AppHandler.bodyweightPoundsLabel = uilabel(AppHandler.fig,"Text","(lbs)");
    AppHandler.bodyweightPoundsLabel.Position = [265, 450, 31, 22];
    
    
    % Create Enter Force Grip Input
    AppHandler.forcegripLabel = uilabel(AppHandler.fig,"Text","Enter your force grip number:");
    AppHandler.forcegripLabel.Position = [60, 400, 500, 22];
    AppHandler.forcegripLabel.FontName = "Helvetica";
    AppHandler.forcegripLabel.FontSize = 16;
    AppHandler.forcegripLabel.FontWeight = "Bold";
    AppHandler.forcegripInput = uieditfield(AppHandler.fig,"text","value","Force Grip here (in pounds)");
    AppHandler.forcegripInput.Position = [60, 360, 200, 22];
    AppHandler.forcegripPoundsLabel = uilabel(AppHandler.fig,"Text","(lbs)");
    AppHandler.forcegripPoundsLabel.Position = [265, 360, 31, 22];
    
    
    % Create Display Graphs Button
    AppHandler.calculateAndDisplay = uibutton(AppHandler.fig,"Text", "Calculate and Display Results","ButtonPushedFcn",@(src,event)CalculateDisplayData);
    AppHandler.calculateAndDisplay.Position = [60, 290, 250, 30];
    AppHandler.calculateAndDisplay.FontName = "Helvetica";
    AppHandler.calculateAndDisplay.FontSize = 16;
    AppHandler.calculateAndDisplay.FontWeight = "Bold";
    
    % Create Reset Button
    AppHandler.resetGUI = uibutton(AppHandler.fig,"Text","Reset", "ButtonPushedFcn", @(src,event)ResetGUI);
    AppHandler.resetGUI.Position = [60, 240, 100, 30];
    AppHandler.resetGUI.FontName = "Helvetica";
    AppHandler.resetGUI.FontSize = 16;
    AppHandler.resetGUI.FontWeight = "Bold";
    
    % Create Axes
    AppHandler.displayAxes_boxplot_Lemurs = uiaxes(AppHandler.fig);
    AppHandler.displayAxes_boxplot_Lemurs.Position = [420, 50, 840, 600];
    AppHandler.displayAxes_scatterplot_Ages = uiaxes(AppHandler.fig,'Position',[420, 50, 840, 600],'Visible','off');
    AppHandler.displayAxes_boxplot_Ages = uiaxes(AppHandler.fig,'Position',[420, 50, 840, 600],'Visible','off');
    AppHandler.displayAxes_1 = uiaxes(AppHandler.fig,'Position',[420, 50, 840, 200],'Visible','off');
    AppHandler.displayAxes_2 = uiaxes(AppHandler.fig,'Position',[420, 260, 840, 200],'Visible','off');
    AppHandler.displayAxes_3 = uiaxes(AppHandler.fig,'Position',[420, 480, 840, 200],'Visible','off');
    
    % Create Graph Switch Buttons
    AppHandler.graph_display_buttongroup = uibuttongroup(AppHandler.fig,"SelectionChangedFcn",@(src,event)SwitchVisibleGraph);
    AppHandler.graph_display_buttongroup.Position = [40, 50, 300, 150];
    AppHandler.graph_1_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_1_display.Text = "Vs Lemur";
    AppHandler.graph_1_display.Position = [20, 105, 100, 35];
    AppHandler.graph_2_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_2_display.Text = "Vs Age";
    AppHandler.graph_2_display.Position = [20, 57, 100, 35];
    AppHandler.graph_3_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_3_display.Text = "Vs Age Group";
    AppHandler.graph_3_display.Position = [20, 10, 100, 35];
    AppHandler.graph_all_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_all_display.Text = "Display All Graphs";
    AppHandler.graph_all_display.Position = [140, 10, 140, 130];

    developedLabel = uilabel(AppHandler.fig,"Text","Developed By: Dan Gibbons");
    developedLabel.Position = [40, 10, 250, 30];
    developedLabel.FontName = "Arial";
    developedLabel.FontSize = 16;
    
    % Load and Graph Base Data
    AppHandler.LemurDataPruned = table(AppHandler.LemurDataTable.Species_Real, AppHandler.LemurDataTable.BW_Grip);
    AppHandler.AgeScatterData = table(AppHandler.HumanDataTable.Age, AppHandler.HumanDataTable.Total_avg_percent_BW);
    AppHandler.AgeCategoriesData = table(AppHandler.HumanDataTable.Classification, AppHandler.HumanDataTable.Total_avg_percent_BW);
    AppHandler.Boxchart_Lemurs = boxchart(AppHandler.displayAxes_boxplot_Lemurs,categorical(AppHandler.LemurDataPruned.Var1), AppHandler.LemurDataPruned.Var2);
    xlabel(AppHandler.displayAxes_boxplot_Lemurs,"Type of Lemur","FontSize",20, "FontWeight","bold");
    AppHandler.displayAxes_boxplot_Lemurs.XLabel.FontSize = 15;
    ylabel(AppHandler.displayAxes_boxplot_Lemurs,"Grip Force in % Body Weight","FontSize",20, "FontWeight","bold");
    AppHandler.displayAxes_boxplot_Lemurs.YLabel.FontSize = 15;
    AppHandler.graph_1_display.Value=true;

    % Place Lemur Images on Lemur Graph
    hold(AppHandler.displayAxes_boxplot_Lemurs,'on')
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[0.25, 1.60],'YData',[135 185],'CData',flipud(AppHandler.Photo_aye_aye));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[1.25, 2.60],'YData',[-45 5],'CData',flipud(AppHandler.Photo_flavifrons));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[2.25, 3.60],'YData',[95 145],'CData',flipud(AppHandler.Photo_collared));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[3.25, 4.60],'YData',[-45 5],'CData',flipud(AppHandler.Photo_sifaka));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[4.15, 5.50],'YData',[100 150],'CData',flipud(AppHandler.Photo_crowned));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[5.15, 6.50],'YData',[155 205],'CData',flipud(AppHandler.Photo_cheirogaleus));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[6.45, 7.80],'YData',[10 60],'CData',flipud(AppHandler.Photo_danfoss));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[7.35, 8.70],'YData',[55 105],'CData',flipud(AppHandler.Photo_red_bellied));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[8.45, 9.70],'YData',[-35 25],'CData',flipud(AppHandler.Photo_mongoose));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[9.25, 10.60],'YData',[100 150],'CData',flipud(AppHandler.Photo_catta));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[10.25, 11.60],'YData',[-40 10],'CData',flipud(AppHandler.Photo_ruffed));

    % Display Mean Indicators on top of box plot
    mean_display = groupsummary(AppHandler.LemurDataPruned,"Var1",'mean',"Var2");
    mean_plot = plot(AppHandler.displayAxes_boxplot_Lemurs,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
    AppHandler.Leg_1 = legend(AppHandler.displayAxes_boxplot_Lemurs,["Grip Force","Mean Grip"],"Location","northwest");
%     a = get(gca,'XTickLabel');
%     set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
end

% Function for loading/building classroom mode
function LoadClassroomMode(varargin)
    global AppHandler
    AppHandler.ClassData={};
    AppHandler.user_mode = -1;
    AppHandler.Mode_Question_Display.Visible="off";
    AppHandler.loadIndividualModeButton.Visible="off";
    AppHandler.loadClassroomModeButton.Visible="off";
    

    % Create Variables for filling in later
    AppHandler.date_difference_years_rounded = [];
    AppHandler.users_bodyweight = [];
    AppHandler.users_forcegrip =[]; 

    % Create and Display Title
    AppHandler.GUI_Title = uilabel(AppHandler.fig,"Text","How strong is YOUR force grip?");
    AppHandler.GUI_Title.Position = [400, 730, 600, 40];
    AppHandler.GUI_Title.FontName = "Arial Black";
    AppHandler.GUI_Title.FontSize = 30;
    AppHandler.GUI_Title.FontWeight = "Bold";

    fundedLabel = uilabel(AppHandler.fig,"Text","Funded By:");
    fundedLabel.Position = [175, 760, 200, 30];
    fundedLabel.FontName = "Arial";
    fundedLabel.FontSize = 16;
    
    uiimage(Parent=AppHandler.fig,Position=[25, 600, 200, 200],ImageSource="Picture1.png", ScaleMethod='scaledown');
    uiimage(Parent=AppHandler.fig,Position=[220, 600, 200, 200],ImageSource="Picture2.png", ScaleMethod='scaledown');

    presentedLabel = uilabel(AppHandler.fig,"Text","Presented By:");
    presentedLabel.Position = [1125, 775, 200, 30];
    presentedLabel.FontName = "Arial";
    presentedLabel.FontSize = 16;
    
    uiimage(Parent=AppHandler.fig,Position=[1050, 675, 100, 100],ImageSource="Picture3.png", ScaleMethod='scaledown');
    uiimage(Parent=AppHandler.fig,Position=[1175, 675, 100, 100],ImageSource="Picture4.png", ScaleMethod='scaledown');

    % Create Classroom Name Input
    AppHandler.classnameLabel = uilabel(AppHandler.fig,"Text","Enter your class name:");
    AppHandler.classnameLabel.Position = [60, 590, 190, 22];
    AppHandler.classnameLabel.FontName = "Helvetica";
    AppHandler.classnameLabel.FontSize = 16;
    AppHandler.classnameLabel.FontWeight = "Bold";
    AppHandler.classnameInput = uieditfield(AppHandler.fig, "text","value","Class Name Here");
    AppHandler.classnameInput.Position = [60, 560, 200, 22];
    
    % Create Collect Data Button
    AppHandler.calculateAndDisplay = uibutton(AppHandler.fig,"Text", "Begin Collecting Data","ButtonPushedFcn",@(src,event)CollectClassroomData);
    AppHandler.calculateAndDisplay.Position = [60, 500, 250, 30];
    AppHandler.calculateAndDisplay.FontName = "Helvetica";
    AppHandler.calculateAndDisplay.FontSize = 16;
    AppHandler.calculateAndDisplay.FontWeight = "Bold";

    % Create Reset Button
    AppHandler.resetGUI = uibutton(AppHandler.fig,"Text","Reset", "ButtonPushedFcn", @(src,event)ResetGUI);
    AppHandler.resetGUI.Position = [140, 450, 100, 30];
    AppHandler.resetGUI.FontName = "Helvetica";
    AppHandler.resetGUI.FontSize = 16;
    AppHandler.resetGUI.FontWeight = "Bold";

    % Create Axes
    AppHandler.displayAxes_boxplot_Lemurs = uiaxes(AppHandler.fig);
    AppHandler.displayAxes_boxplot_Lemurs.Position = [420, 50, 840, 600];
    AppHandler.displayAxes_scatterplot_Ages = uiaxes(AppHandler.fig,'Position',[420, 50, 840, 600],'Visible','off');
    AppHandler.displayAxes_boxplot_Ages = uiaxes(AppHandler.fig,'Position',[420, 50, 840, 600],'Visible','off');
    AppHandler.displayAxes_1 = uiaxes(AppHandler.fig,'Position',[420, 50, 840, 200],'Visible','off');
    AppHandler.displayAxes_2 = uiaxes(AppHandler.fig,'Position',[420, 260, 840, 200],'Visible','off');
    AppHandler.displayAxes_3 = uiaxes(AppHandler.fig,'Position',[420, 480, 840, 200],'Visible','off');
    
    % Create Graph Switch Buttons
    AppHandler.graph_display_buttongroup = uibuttongroup(AppHandler.fig,"SelectionChangedFcn",@(src,event)SwitchVisibleGraph);
    AppHandler.graph_display_buttongroup.Position = [40, 50, 300, 150];
    AppHandler.graph_1_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_1_display.Text = "Vs Lemur";
    AppHandler.graph_1_display.Position = [20, 105, 100, 35];
    AppHandler.graph_2_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_2_display.Text = "Vs Age";
    AppHandler.graph_2_display.Position = [20, 57, 100, 35];
    AppHandler.graph_3_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_3_display.Text = "Vs Age Group";
    AppHandler.graph_3_display.Position = [20, 10, 100, 35];
    AppHandler.graph_all_display = uitogglebutton(AppHandler.graph_display_buttongroup);
    AppHandler.graph_all_display.Text = "Display All Graphs";
    AppHandler.graph_all_display.Position = [140, 10, 140, 130];

    developedLabel = uilabel(AppHandler.fig,"Text","Developed By: Dan Gibbons");
    developedLabel.Position = [40, 10, 250, 30];
    developedLabel.FontName = "Arial";
    developedLabel.FontSize = 16;

    % Load and Graph Base Data
    AppHandler.LemurDataPruned = table(AppHandler.LemurDataTable.Species_Real, AppHandler.LemurDataTable.BW_Grip);
    AppHandler.AgeScatterData = table(AppHandler.HumanDataTable.Age, AppHandler.HumanDataTable.Total_avg_percent_BW);
    AppHandler.AgeCategoriesData = table(AppHandler.HumanDataTable.Classification, AppHandler.HumanDataTable.Total_avg_percent_BW);
    AppHandler.Boxchart_Lemurs = boxchart(AppHandler.displayAxes_boxplot_Lemurs,categorical(AppHandler.LemurDataPruned.Var1), AppHandler.LemurDataPruned.Var2);
    xlabel(AppHandler.displayAxes_boxplot_Lemurs,"Type of Lemur","FontSize",20, "FontWeight","bold");
    AppHandler.displayAxes_boxplot_Lemurs.XLabel.FontSize = 15;
    ylabel(AppHandler.displayAxes_boxplot_Lemurs,"Grip Force in % Body Weight","FontSize",20, "FontWeight","bold");
    AppHandler.displayAxes_boxplot_Lemurs.YLabel.FontSize = 15;
    AppHandler.graph_1_display.Value=true;

    % Place Lemur Images on Lemur Graph 
    hold(AppHandler.displayAxes_boxplot_Lemurs,'on')
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[0.25, 1.60],'YData',[135 185],'CData',flipud(AppHandler.Photo_aye_aye));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[1.25, 2.60],'YData',[-45 5],'CData',flipud(AppHandler.Photo_flavifrons));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[2.25, 3.60],'YData',[95 145],'CData',flipud(AppHandler.Photo_collared));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[3.25, 4.60],'YData',[-45 5],'CData',flipud(AppHandler.Photo_sifaka));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[4.15, 5.50],'YData',[100 150],'CData',flipud(AppHandler.Photo_crowned));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[5.15, 6.50],'YData',[155 205],'CData',flipud(AppHandler.Photo_cheirogaleus));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[6.45, 7.80],'YData',[10 60],'CData',flipud(AppHandler.Photo_danfoss));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[7.35, 8.70],'YData',[55 105],'CData',flipud(AppHandler.Photo_red_bellied));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[8.45, 9.70],'YData',[-35 25],'CData',flipud(AppHandler.Photo_mongoose));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[9.25, 10.60],'YData',[100 150],'CData',flipud(AppHandler.Photo_catta));
    image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[10.25, 11.60],'YData',[-40 10],'CData',flipud(AppHandler.Photo_ruffed));

    % Display Mean Indicators on top of box plot
    mean_display = groupsummary(AppHandler.LemurDataPruned,"Var1",'mean',"Var2");
    mean_plot = plot(AppHandler.displayAxes_boxplot_Lemurs,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
    AppHandler.Leg_1 = legend(AppHandler.displayAxes_boxplot_Lemurs,["Grip Force","Mean Grip"],"Location","northwest");
end

function CalculateDisplayData(varargin)
    lb_to_kg = 0.45359237;
    global AppHandler
    input_validator = 0;
    AppHandler.ClassroomAgeArray = [];
    AppHandler.ClassroomWeight = [];
    AppHandler.ClassroomGripNum = [];
    try
        users_birthday = str2double(AppHandler.birthYearInput.Value);
        todays_date = datetime("today");
        todays_year = year(todays_date);
        if ~isnan(users_birthday) && users_birthday <= todays_year
            year_difference = todays_year - users_birthday;
            AppHandler.date_difference_years_rounded = year_difference;
            input_validator = input_validator + 1;
        else
            msgbox("Date Entered is Not Valid. Please fix and try again.","Date Error")
            return
        end
        if ((str2double(AppHandler.bodyweightInput.Value)) > 0 && (~isnan(str2double(AppHandler.bodyweightInput.Value))))
            AppHandler.users_bodyweight = str2double(AppHandler.bodyweightInput.Value) * lb_to_kg;
            input_validator = input_validator + 1;
        else
            msgbox("Body Weight entered is Not a Valid Number. Please fix and try again.","Body Weight Error")
            return
        end
        if ((str2double(AppHandler.forcegripInput.Value)) > 0 && (~isnan(str2double(AppHandler.forcegripInput.Value))))
            AppHandler.users_forcegrip = str2double(AppHandler.forcegripInput.Value) * lb_to_kg;
            input_validator = input_validator + 1;
        else
            msgbox("Force Grip entered is Not a Valid Number. Please fix and try again.","Force Grip Error")
            return
        end
        if input_validator == 3
            AppHandler.users_forcegrip = AppHandler.users_forcegrip/AppHandler.users_bodyweight * 100;
            AppHandler.all_input_filled = true;
            AppHandler.graph_1_display.Value=true;
            SwitchVisibleGraph();
        end
    catch
        msgbox("One of the inputs entered is Not a Valid Number. Please fix and try again.","Input Error")
    end
end

function CollectClassroomData(varargin)
    global AppHandler
    AppHandler.DataCollector = uifigure('Units','Pixels','Position',[535 440 500 300],...
    'Name','Classroom Data Collector','MenuBar','None');

    AppHandler.classroomDataRequestLabel = uilabel(AppHandler.DataCollector,"Text","Enter the following information...");
    AppHandler.classroomDataRequestLabel.Position = [130,220,500,100];
    AppHandler.classroomDataRequestLabel.FontName = "Arial Black";
    AppHandler.classroomDataRequestLabel.FontSize = 15;
    AppHandler.classroomDataRequestLabel.FontWeight = "Bold";

     % % Enter Birthday
    AppHandler.classroomBirthdayLabel = uilabel(AppHandler.DataCollector,"Text","Enter your birth year:");
    AppHandler.classroomBirthdayLabel.Position = [115, 200, 190, 22];
    AppHandler.classroomBirthdayLabel.FontName = "Helvetica";
    AppHandler.classroomBirthdayLabel.FontSize = 12;
    AppHandler.classroomBirthdayLabel.FontWeight = "Bold";
    AppHandler.classroomBirthYearInput = uieditfield(AppHandler.DataCollector, "text","value","Birth Year here (e.g. 1994)");
    AppHandler.classroomBirthYearInput.Position = [250, 200, 200, 22];

    % Enter body weight
    AppHandler.classroomBodyweightLabel = uilabel(AppHandler.DataCollector,"Text","Enter your body weight:");
    AppHandler.classroomBodyweightLabel.Position = [100, 150, 190, 22];
    AppHandler.classroomBodyweightLabel.FontName = "Helvetica";
    AppHandler.classroomBodyweightLabel.FontSize = 12;
    AppHandler.classroomBodyweightLabel.FontWeight = "Bold";
    AppHandler.classroomBodyweightInput = uieditfield(AppHandler.DataCollector, "text","value","Body Weight here (in pounds)");
    AppHandler.classroomBodyweightInput.Position = [250, 150, 200, 22];
    AppHandler.classroomBodyweightPoundsLabel = uilabel(AppHandler.DataCollector,"Text","(lbs)");
    AppHandler.classroomBodyweightPoundsLabel.Position = [460, 150, 31, 22];


    % Enter Force Grip Number
    AppHandler.classroomForcegripLabel = uilabel(AppHandler.DataCollector,"Text","Enter your force grip number:");
    AppHandler.classroomForcegripLabel.Position = [70, 100, 300, 22];
    AppHandler.classroomForcegripLabel.FontName = "Helvetica";
    AppHandler.classroomForcegripLabel.FontSize = 12;
    AppHandler.classroomForcegripLabel.FontWeight = "Bold";
    AppHandler.classroomForcegripInput = uieditfield(AppHandler.DataCollector,"text","value","Force Grip here (in pounds)");
    AppHandler.classroomForcegripInput.Position = [250, 100, 200, 22];
    AppHandler.classroomForcegripPoundsLabel = uilabel(AppHandler.DataCollector,"Text","(lbs)");
    AppHandler.classroomForcegripPoundsLabel.Position = [460, 100, 31, 22];

    % Submit Data
    AppHandler.classroomSubmitData = uibutton(AppHandler.DataCollector,"Text", "Submit your data","ButtonPushedFcn",@(src,event)SubmitClassroomData);
    AppHandler.classroomSubmitData.Position = [60, 50, 150, 30];
    AppHandler.classroomSubmitData.FontName = "Helvetica";
    AppHandler.classroomSubmitData.FontSize = 13;
    AppHandler.classroomSubmitData.FontWeight = "Bold";

    % % Submit Indicator Lamp
    AppHandler.lmp = uilamp(AppHandler.DataCollector, "Color","red","Position",[30,55,20,20]);

    % Reset for Next Student
    AppHandler.classroomNextData = uibutton(AppHandler.DataCollector,"Text", "Reset for next student","ButtonPushedFcn",@(src,event)ResetClassroomDataInput);
    AppHandler.classroomNextData.Position = [60, 10, 170, 30];
    AppHandler.classroomNextData.FontName = "Helvetica";
    AppHandler.classroomNextData.FontSize = 13;
    AppHandler.classroomNextData.FontWeight = "Bold";

    % Finish and Graph
    AppHandler.classroomFinishData = uibutton(AppHandler.DataCollector,"Text", ["Finish collecting", "data and graph"],"ButtonPushedFcn",@(src,event)FinishClassroomDataInput);
    AppHandler.classroomFinishData.Position = [340, 10, 150, 70];
    AppHandler.classroomFinishData.FontName = "Helvetica";
    AppHandler.classroomFinishData.FontSize = 13;
    AppHandler.classroomFinishData.FontWeight = "Bold";

end

function SubmitClassroomData(varargin)
    global AppHandler
    BirthYearIn = AppHandler.classroomBirthYearInput.Value;
    BodyWeightIn = AppHandler.classroomBodyweightInput.Value;
    ForceGripIn = AppHandler.classroomForcegripInput.Value;
    lb_to_kg = 0.45359237;
    input_validator = 0;
        users_birthday = str2double(BirthYearIn);
        todays_date = datetime("today");
        todays_year = year(todays_date);
        if ~isnan(users_birthday) && users_birthday <= todays_year
            year_difference = todays_year - users_birthday;
            AppHandler.date_difference_years_rounded = year_difference;
            input_validator = input_validator + 1;
        else
            msgbox("Date Entered is Not Valid. Please fix and try again.","Date Error")
            return
        end
        if ((str2double(BodyWeightIn)) > 0 && (~isnan(str2double(BodyWeightIn))))
             userBodyWeight = str2double(BodyWeightIn) * lb_to_kg;
             AppHandler.users_bodyweight = userBodyWeight;
            input_validator = input_validator + 1;
        else
            msgbox("Body Weight entered is Not a Valid Number. Please fix and try again.","Body Weight Error")
            return
        end
        if ((str2double(ForceGripIn)) > 0 && (~isnan(str2double(ForceGripIn))))
            tempforcegrip = str2double(ForceGripIn) * lb_to_kg;
        
            input_validator = input_validator + 1;
        else
            msgbox("Force Grip entered is Not a Valid Number. Please fix and try again.","Force Grip Error")
            return
        end
        if input_validator == 3
            AppHandler.lmp.Color = "Green";
            AppHandler.users_forcegrip = tempforcegrip/userBodyWeight * 100;
            AppHandler.all_input_filled = true;
            currentClassData={AppHandler.date_difference_years_rounded, AppHandler.users_bodyweight, AppHandler.users_forcegrip, AppHandler.classnameInput.Value};
            AppHandler.ClassData = [AppHandler.ClassData;currentClassData];
%             AppHandler.ClassData
        end
end

function ResetClassroomDataInput(varargin)
    global AppHandler
    AppHandler.classroomBirthYearInput.Value = ...
        "";
    % "Birth Year here (e.g. 1994)";
    AppHandler.classroomBodyweightInput.Value = ...
        "";
    % "Body Weight here (in pounds)";
    AppHandler.classroomForcegripInput.Value = ...
        "";
    % "Force Grip here (in pounds)";
    AppHandler.lmp.Color = "Red";
    AppHandler.all_input_filled = false;
end

function FinishClassroomDataInput(varargin)
    global AppHandler
    AppHandler.ClassDataTable = cell2table(AppHandler.ClassData,"VariableNames",["Age","Weight_kg","Total_avg_BW", "Classification"]);
    AppHandler.ClassDataTablePruned = table(AppHandler.ClassDataTable.Classification,AppHandler.ClassDataTable.Total_avg_BW);
    AppHandler.graph_1_display.Value=true;
    AppHandler.FinalOutputFilled = 1;
    SwitchVisibleGraph();
    close(AppHandler.DataCollector)
end

function SwitchVisibleGraph(varargin)
    global AppHandler
    selectedGraph = AppHandler.graph_display_buttongroup.SelectedObject.Text;
    try
        if isfield(AppHandler,'Leg_1') == 1
            set(AppHandler.Leg_1,'visible','off')
        end
        if isfield(AppHandler,'Leg_3') == 1
            set(AppHandler.Leg_3,'visible','off')
        end
    catch

    end
    switch selectedGraph
        case "Vs Lemur"
            AppHandler.displayAxes_1.Visible = "off";
            cla(AppHandler.displayAxes_1)
            AppHandler.displayAxes_2.Visible = "off";
            cla(AppHandler.displayAxes_2)
            AppHandler.displayAxes_3.Visible = "off";
            cla(AppHandler.displayAxes_3)
            AppHandler.displayAxes_boxplot_Lemurs.Visible = "on";
            cla(AppHandler.displayAxes_boxplot_Lemurs)
            AppHandler.displayAxes_scatterplot_Ages.Visible = "off";
            cla(AppHandler.displayAxes_scatterplot_Ages)
            AppHandler.displayAxes_boxplot_Ages.Visible = "off";
            cla(AppHandler.displayAxes_boxplot_Ages)
            AppHandler.Boxchart_Lemurs = boxchart(AppHandler.displayAxes_boxplot_Lemurs,categorical(AppHandler.LemurDataPruned.Var1), AppHandler.LemurDataPruned.Var2);
            xlabel(AppHandler.displayAxes_boxplot_Lemurs,"Type of Lemur","FontSize",20, "FontWeight","bold")
            set(AppHandler.displayAxes_boxplot_Lemurs.XLabel,"FontSize",15);
            ylabel(AppHandler.displayAxes_boxplot_Lemurs,"Grip Force in % Body Weight","FontSize",20, "FontWeight","bold")
            set(AppHandler.displayAxes_boxplot_Lemurs.YLabel,"FontSize",15);
            hold(AppHandler.displayAxes_boxplot_Lemurs,'on')
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[0.25, 1.60],'YData',[135 185],'CData',flipud(AppHandler.Photo_aye_aye));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[1.25, 2.60],'YData',[-45 5],'CData',flipud(AppHandler.Photo_flavifrons)); 
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[2.25, 3.60],'YData',[95 145],'CData',flipud(AppHandler.Photo_collared));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[3.25, 4.60],'YData',[-45 5],'CData',flipud(AppHandler.Photo_sifaka));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[4.15, 5.50],'YData',[100 150],'CData',flipud(AppHandler.Photo_crowned));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[5.15, 6.50],'YData',[155 205],'CData',flipud(AppHandler.Photo_cheirogaleus));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[6.45, 7.80],'YData',[10 60],'CData',flipud(AppHandler.Photo_danfoss));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[7.35, 8.70],'YData',[55 105],'CData',flipud(AppHandler.Photo_red_bellied));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[8.45, 9.70],'YData',[-35 25],'CData',flipud(AppHandler.Photo_mongoose));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[9.25, 10.60],'YData',[100 150],'CData',flipud(AppHandler.Photo_catta));
        image(AppHandler.displayAxes_boxplot_Lemurs,'XData',[10.25, 11.60],'YData',[-40 10],'CData',flipud(AppHandler.Photo_ruffed));

            if (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                unique_values = length(unique(AppHandler.LemurDataPruned.Var1));
                AppHandler.Plot_1_User = scatter(AppHandler.displayAxes_boxplot_Lemurs,unique_values+1, AppHandler.users_forcegrip,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
                AppHandler.Text_1_User = text(AppHandler.displayAxes_boxplot_Lemurs,unique_values+1.1,AppHandler.users_forcegrip+0.1,"You","Color",'r',"FontSize",20);
            elseif (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                AppHandler.Plot_1_Class = boxchart(AppHandler.displayAxes_boxplot_Lemurs,categorical(AppHandler.ClassDataTablePruned.Var1), AppHandler.ClassDataTablePruned.Var2);
            end
            
            
            if (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_boxplot_Lemurs,'on')
                mean_display = groupsummary(AppHandler.LemurDataPruned,"Var1",'mean',"Var2");
                mean_display_class = groupsummary(AppHandler.ClassDataTablePruned,"Var1",'mean',"Var2");
                mean_display=[mean_display;mean_display_class];
                mean_plot_class = plot(AppHandler.displayAxes_boxplot_Lemurs,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
                AppHandler.Leg_1 = legend(AppHandler.displayAxes_boxplot_Lemurs,["Grip Force","Class Grip Force","Mean Grip"],"Location","north");
            elseif (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                mean_display = groupsummary(AppHandler.LemurDataPruned,"Var1",'mean',"Var2");
                mean_plot = plot(AppHandler.displayAxes_boxplot_Lemurs,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
                AppHandler.Leg_1 = legend(AppHandler.displayAxes_boxplot_Lemurs,["Grip Force","User Grip Force","Mean Grip"],"Location","north");
            else
                mean_display = groupsummary(AppHandler.LemurDataPruned,"Var1",'mean',"Var2");
                mean_plot = plot(AppHandler.displayAxes_boxplot_Lemurs,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
                AppHandler.Leg_1 = legend(AppHandler.displayAxes_boxplot_Lemurs,["Grip Force","Mean Grip"],"Location","north");
            end
            
        case "Vs Age"
            AppHandler.displayAxes_1.Visible = "off";
            cla(AppHandler.displayAxes_1)
            AppHandler.displayAxes_2.Visible = "off";
            cla(AppHandler.displayAxes_2)
            AppHandler.displayAxes_3.Visible = "off";
            cla(AppHandler.displayAxes_3)
            AppHandler.displayAxes_boxplot_Lemurs.Visible = "off";
            cla(AppHandler.displayAxes_boxplot_Lemurs)
            AppHandler.displayAxes_scatterplot_Ages.Visible = "on";
            cla(AppHandler.displayAxes_scatterplot_Ages)
            AppHandler.displayAxes_boxplot_Ages.Visible = "off";
            cla(AppHandler.displayAxes_boxplot_Ages)
            AppHandler.Swarmchart_Ages = swarmchart(AppHandler.displayAxes_scatterplot_Ages,AppHandler.AgeScatterData.Var1, AppHandler.AgeScatterData.Var2, "filled",'MarkerEdgeColor','k','jitter','on', 'jitterAmount',0.5);
            hold(AppHandler.displayAxes_scatterplot_Ages,'on')

            % Trendline
            x1 = linspace(0,70);
            nans_1 = find(isnan(AppHandler.AgeScatterData.Var1));
            nans_2 = find(isnan(AppHandler.AgeScatterData.Var2));
            nans_total = cat(1,nans_1,nans_2);
            temp_x_data = AppHandler.AgeScatterData.Var1;
            temp_y_data = AppHandler.AgeScatterData.Var2;
            temp_x_data(nans_total) = [];
            temp_y_data(nans_total) = [];
            pfit = polyfit(temp_x_data,temp_y_data,2);
            y1 = polyval(pfit,x1);
            plot(AppHandler.displayAxes_scatterplot_Ages,x1,y1)

            xlabel(AppHandler.displayAxes_scatterplot_Ages,"Age in years","FontSize",20, "FontWeight","bold")
            set(AppHandler.displayAxes_scatterplot_Ages.XLabel,"FontSize",15);
            ylabel(AppHandler.displayAxes_scatterplot_Ages,"Grip Force in % Body Weight","FontSize",20, "FontWeight","bold")
            set(AppHandler.displayAxes_scatterplot_Ages.YLabel,"FontSize",15);
            set(AppHandler.displayAxes_scatterplot_Ages,"XTick",0:10:80)
            if (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                hold(AppHandler.displayAxes_scatterplot_Ages,'on')
                AppHandler.Plot_2_User = scatter(AppHandler.displayAxes_scatterplot_Ages,AppHandler.date_difference_years_rounded, AppHandler.users_forcegrip,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
                AppHandler.Text_2_User = text(AppHandler.displayAxes_scatterplot_Ages,AppHandler.date_difference_years_rounded+1, AppHandler.users_forcegrip+1,"You","Color",'r',"FontSize",20);
            elseif (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_scatterplot_Ages,'on')
                AppHandler.Plot_2_Class = scatter(AppHandler.displayAxes_scatterplot_Ages,AppHandler.ClassDataTable.Age,AppHandler.ClassDataTable.Total_avg_BW,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
            end

        case "Vs Age Group"
            AppHandler.displayAxes_1.Visible = "off";
            cla(AppHandler.displayAxes_1)
            AppHandler.displayAxes_2.Visible = "off";
            cla(AppHandler.displayAxes_2)
            AppHandler.displayAxes_3.Visible = "off";
            cla(AppHandler.displayAxes_3)
            AppHandler.displayAxes_boxplot_Ages.Visible = "on";
            cla(AppHandler.displayAxes_boxplot_Ages)
            AppHandler.displayAxes_scatterplot_Ages.Visible = "off";
            cla(AppHandler.displayAxes_scatterplot_Ages)
            AppHandler.displayAxes_boxplot_Lemurs.Visible = "off";
            cla(AppHandler.displayAxes_boxplot_Lemurs)
            AppHandler.Boxchart_Ages = boxchart(AppHandler.displayAxes_boxplot_Ages,categorical(AppHandler.AgeCategoriesData.Var1,["ELEMENTARY","MIDDLE","HIGHSCHOOL","ADULT"]), AppHandler.AgeCategoriesData.Var2);
            % hold on
            xlabel(AppHandler.displayAxes_boxplot_Ages,"Age groups","FontSize",20, "FontWeight","bold")
            set(AppHandler.displayAxes_boxplot_Ages.XLabel,"FontSize",15);
            ylabel(AppHandler.displayAxes_boxplot_Ages,"Grip Force in % Body Weight","FontSize",20, "FontWeight","bold")
            set(AppHandler.displayAxes_boxplot_Ages.YLabel,"FontSize",15);
            if (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                hold(AppHandler.displayAxes_boxplot_Ages,'on')
                unique_values = length(unique(AppHandler.AgeCategoriesData.Var1));
                AppHandler.Plot_3_User = scatter(AppHandler.displayAxes_boxplot_Ages,unique_values+1, AppHandler.users_forcegrip,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
                AppHandler.Text_3_User = text(AppHandler.displayAxes_boxplot_Ages,unique_values+1.1, AppHandler.users_forcegrip+0.1,"You","Color",'r',"FontSize",20);
            elseif (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_boxplot_Ages,'on')
                AppHandler.Plot_3_Class = boxchart(AppHandler.displayAxes_boxplot_Ages,categorical(AppHandler.ClassDataTablePruned.Var1), AppHandler.ClassDataTablePruned.Var2);
            end
            
            if (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_boxplot_Ages,'on')
                mean_display = groupsummary(AppHandler.AgeCategoriesData,"Var1",'mean',"Var2");
                mean_display_class = groupsummary(AppHandler.ClassDataTablePruned,"Var1",'mean',"Var2");
                mean_display=[mean_display;mean_display_class];
                mean_plot_class = plot(AppHandler.displayAxes_boxplot_Ages,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
                AppHandler.Leg_3 = legend(AppHandler.displayAxes_boxplot_Ages,["Grip Force","Class Grip Force","Mean Grip"],"Location","north");
            elseif (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                mean_display = groupsummary(AppHandler.AgeCategoriesData,"Var1",'mean',"Var2");
                mean_plot = plot(AppHandler.displayAxes_boxplot_Ages,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
                AppHandler.Leg_3 = legend(AppHandler.displayAxes_boxplot_Ages,["Grip Force","User Grip Force","Mean Grip"],"Location","north");
            else
                mean_display = groupsummary(AppHandler.AgeCategoriesData,"Var1",'mean',"Var2");
                hold(AppHandler.displayAxes_boxplot_Ages,'on')
                mean_plot = plot(AppHandler.displayAxes_boxplot_Ages,mean_display,"mean_Var2",'LineStyle','none','Marker','o','Color',[1,0,0]);
                AppHandler.Leg_3 = legend(AppHandler.displayAxes_boxplot_Ages,["Grip Force","Mean Grip"],"Location","north");
                
            end
            
        case "Display All Graphs"
            AppHandler.displayAxes_boxplot_Lemurs.Visible = "off";
            cla(AppHandler.displayAxes_boxplot_Lemurs)
            AppHandler.displayAxes_scatterplot_Ages.Visible = "off";
            cla(AppHandler.displayAxes_scatterplot_Ages)
            AppHandler.displayAxes_boxplot_Ages.Visible = "off";
            cla(AppHandler.displayAxes_boxplot_Ages)
            AppHandler.displayAxes_1.Visible = "on";
            AppHandler.displayAxes_2.Visible = "on";
            AppHandler.displayAxes_3.Visible = "on";
            boxchart(AppHandler.displayAxes_3,categorical(AppHandler.LemurDataPruned.Var1,["Fat-tailed dwarf lemur","Aye-aye","Collared brown lemur","Crowned lemur","Blue-eyed black lemur","Mongoose lemur","Mohol bushbaby","Ring-tailed lemur","Gray mouse lemur","Coquerel's sifaka","Ruffed lemur"]), AppHandler.LemurDataPruned.Var2);
            xlabel(AppHandler.displayAxes_3,"Type of Lemur","FontSize",15, "FontWeight","bold")
            ylabel(AppHandler.displayAxes_3,"Grip Force in % Body Weight","FontSize",13, "FontWeight","bold")
            if (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                hold(AppHandler.displayAxes_3,'on')
                unique_values = length(unique(AppHandler.LemurDataPruned.Var1));
                AppHandler.Plot_4_User = scatter(AppHandler.displayAxes_3,unique_values+1, AppHandler.users_forcegrip,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
                AppHandler.Text_4_User = text(AppHandler.displayAxes_3,unique_values+1.1,AppHandler.users_forcegrip+0.1,"You","Color",'r',"FontSize",20);
            elseif (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_3,'on')
                AppHandler.Plot_4_Class = boxchart(AppHandler.displayAxes_3,categorical(AppHandler.ClassDataTablePruned.Var1), AppHandler.ClassDataTablePruned.Var2);
            end
            swarmchart(AppHandler.displayAxes_2,AppHandler.AgeScatterData.Var1, AppHandler.AgeScatterData.Var2, "filled",'MarkerEdgeColor','k','jitter','on', 'jitterAmount',0.5);
            hold(AppHandler.displayAxes_2,'on')
            % Trendline
            x1 = linspace(0,70);
            nans_1 = find(isnan(AppHandler.AgeScatterData.Var1));
            nans_2 = find(isnan(AppHandler.AgeScatterData.Var2));
            nans_total = cat(1,nans_1,nans_2);
            temp_x_data = AppHandler.AgeScatterData.Var1;
            temp_y_data = AppHandler.AgeScatterData.Var2;
            temp_x_data(nans_total) = [];
            temp_y_data(nans_total) = [];
            pfit = polyfit(temp_x_data,temp_y_data,2);
            y1 = polyval(pfit,x1);
            plot(AppHandler.displayAxes_2,x1,y1)
            xlabel(AppHandler.displayAxes_2,"Age in years","FontSize",15, "FontWeight","bold")
            ylabel(AppHandler.displayAxes_2,"Grip Force in % Body Weight","FontSize",13, "FontWeight","bold")
            set(AppHandler.displayAxes_2,"XTick",0:10:80)
            if (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                hold(AppHandler.displayAxes_2,'on')
                AppHandler.Plot_5_User = scatter(AppHandler.displayAxes_2,AppHandler.date_difference_years_rounded, AppHandler.users_forcegrip,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
                AppHandler.Text_5_User = text(AppHandler.displayAxes_2,AppHandler.date_difference_years_rounded+1, AppHandler.users_forcegrip+1,"You","Color",'r',"FontSize",20);
            elseif (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_2,'on')
                AppHandler.Plot_5_Class = scatter(AppHandler.displayAxes_2,AppHandler.ClassDataTable.Age,AppHandler.ClassDataTable.Total_avg_BW,108,'MarkerEdgeColor','k',"MarkerFaceColor","r");
            end
            boxchart(AppHandler.displayAxes_1,categorical(AppHandler.AgeCategoriesData.Var1,["ELEMENTARY","MIDDLE","HIGHSCHOOL","ADULT"]), AppHandler.AgeCategoriesData.Var2);
            xlabel(AppHandler.displayAxes_1,"Age Groups","FontSize",15, "FontWeight","bold")
            ylabel(AppHandler.displayAxes_1,"Grip Force in % Body Weight","FontSize",13, "FontWeight","bold")
            if (AppHandler.all_input_filled == true && AppHandler.user_mode == 1)
                hold(AppHandler.displayAxes_1,'on')
                unique_values = length(unique(AppHandler.AgeCategoriesData.Var1));
                AppHandler.Plot_6_User = scatter(AppHandler.displayAxes_1,unique_values+1, AppHandler.users_forcegrip, 108, 'MarkerEdgeColor','k',"MarkerFaceColor","r");
                AppHandler.Text_6_User = text(AppHandler.displayAxes_1,unique_values+1.1, AppHandler.users_forcegrip+0.1,"You","Color",'r',"FontSize",20);
            elseif (AppHandler.FinalOutputFilled == 1 && AppHandler.user_mode == -1)
                hold(AppHandler.displayAxes_1,'on')
                AppHandler.Plot_6_Class = boxchart(AppHandler.displayAxes_1,categorical(AppHandler.ClassDataTablePruned.Var1), AppHandler.ClassDataTablePruned.Var2);
            end
    end
end

function ResetGUI(varargin)
    global AppHandler
    if AppHandler.user_mode == 1
        AppHandler.birthYearInput.Value = "";
        AppHandler.bodyweightInput.Value = "";
        AppHandler.forcegripInput.Value = "";
        AppHandler.graph_1_display.Value=true;
        try
            SwitchVisibleGraph();
        catch
            % Nothing
        end
        if AppHandler.all_input_filled == true
            try
            delete(AppHandler.Plot_1_User)
            catch
            end
            try
            delete(AppHandler.Text_1_User)
            catch
            end
            try
            delete(AppHandler.Plot_2_User)
            catch
            end
            try
            delete(AppHandler.Text_2_User)
            catch
            end
            try
            delete(AppHandler.Plot_3_User)
            catch
            end
            try
            delete(AppHandler.Text_3_User)
            catch
            end
            try
            delete(AppHandler.Plot_4_User)
            catch
            end
            try
            delete(AppHandler.Text_4_User)
            catch
            end
            try
            delete(AppHandler.Plot_5_User)
            catch
            end
            try
            delete(AppHandler.Text_5_User)
            catch
            end
            try
            delete(AppHandler.Plot_6_User)
            catch
            end
            try
            delete(AppHandler.Text_6_User)
            catch
            end
            AppHandler.all_input_filled = false;
        end
    elseif AppHandler.user_mode == -1
        AppHandler.FinalOutputFilled = 0;
        try
        delete(AppHandler.Plot_1_Class)
        catch
        end
        try
        delete(AppHandler.Plot_2_Class)
        catch
        end
        try
        delete(AppHandler.Plot_3_Class)
        catch
        end
        try
        delete(AppHandler.Plot_4_Class)
        catch
        end
        try
        delete(AppHandler.Plot_5_Class)
        catch
        end
        try
        delete(AppHandler.Plot_6_Class)
        catch
        end
        AppHandler.graph_1_display.Value=true;
        AppHandler.classnameInput.Value = "";
        try
            SwitchVisibleGraph();
        catch
            % Nothing
        end
        
    else
        % Nothing
    end
end