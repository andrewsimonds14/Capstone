function nopassMLbrainmets = importSurvivalData(workbookFile, sheetName, dataLines)
%IMPORTFILE1 Import data from a spreadsheet
%  NOPASSMLBRAINMETS = IMPORTFILE1(FILE) reads data from the first
%  worksheet in the Microsoft Excel spreadsheet file named FILE.
%  Returns the data as a table.
%
%  NOPASSMLBRAINMETS = IMPORTFILE1(FILE, SHEET) reads from the specified
%  worksheet.
%
%  NOPASSMLBRAINMETS = IMPORTFILE1(FILE, SHEET, DATALINES) reads from
%  the specified worksheet for the specified row interval(s). Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  nopassMLbrainmets = importfile1("C:\Users\Simon\Documents\MATLAB\survivalAnalysis\nopassMLbrainmets.xlsx", "Sheet1", [2, 170]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 07-Nov-2020 21:50:01

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 2
    dataLines = [2, 170];
end

%% Setup the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 12);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = "A" + dataLines(1, 1) + ":L" + dataLines(1, 2);

% Specify column names and types
opts.VariableNames = ["Study", "FSRTcourse", "ofMets", "Ariacourse", "Age", "GenderM0F1", "AliveStatus0Dead1Alive", "DateofdeathorLastFU", "DateofBrainmetdiagnosis", "FSRTcompletiondate", "GTVVolumecc", "GTVEqRadiuscm"];
opts.VariableTypes = ["double", "double", "double", "categorical", "double", "double", "double", "datetime", "datetime", "datetime", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, "Ariacourse", "EmptyFieldRule", "auto");
opts = setvaropts(opts, "DateofdeathorLastFU", "InputFormat", "");
opts = setvaropts(opts, "DateofBrainmetdiagnosis", "InputFormat", "");
opts = setvaropts(opts, "FSRTcompletiondate", "InputFormat", "");

% Import the data
nopassMLbrainmets = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = "A" + dataLines(idx, 1) + ":L" + dataLines(idx, 2);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    nopassMLbrainmets = [nopassMLbrainmets; tb]; %#ok<AGROW>
end

end