function generate_Engine1204_init_sldd()
%GENERATE_ENGINE1204_INIT_SLDD Export the current base workspace to SLDD.
%   Run this function in the same MATLAB session in which the Engine1204
%   parameters have already been created. The output file is
%   Engine1204_init.sldd in the same directory as this function.

    outputDir = fileparts(mfilename('fullpath'));
    dictionaryFile = fullfile(outputDir, 'Engine1204_init.sldd');

    if isfile(dictionaryFile)
        error('Engine1204:DictionaryExists', ...
            'Target data dictionary already exists: %s', dictionaryFile);
    end

    variableNames = evalin('base', 'who');
    if isempty(variableNames)
        error('Engine1204:EmptyBaseWorkspace', ...
            ['The MATLAB base workspace is empty. Run the Engine1204 ' ...
             'parameter initialization first.']);
    end

    temporaryFile = [tempname(outputDir), '.sldd'];
    dictionaryObject = Simulink.data.dictionary.create(temporaryFile);

    try
        [importedVariables, existingVariables, unsupportedVariables] = ...
            importFromBaseWorkspace(dictionaryObject, ...
            'varList', variableNames, ...
            'existingVarsAction', 'overwrite');

        if ~isempty(existingVariables)
            error('Engine1204:UnexpectedExistingVariables', ...
                'The new dictionary unexpectedly contains existing entries.');
        end

        if ~isempty(unsupportedVariables)
            error('Engine1204:UnsupportedVariables', ...
                'Unsupported workspace variables: %s', ...
                strjoin(unsupportedVariables, ', '));
        end

        saveChanges(dictionaryObject);
        close(dictionaryObject);
        dictionaryObject = [];

        [moveSucceeded, moveMessage] = movefile(temporaryFile, dictionaryFile);
        if ~moveSucceeded
            error('Engine1204:MoveFailed', ...
                'Failed to create the target dictionary: %s', moveMessage);
        end

        fprintf('Created data dictionary:\n  %s\n', dictionaryFile);
        fprintf('Imported variables: %d\n', numel(importedVariables));
    catch exception
        if ~isempty(dictionaryObject)
            try
                discardChanges(dictionaryObject);
                close(dictionaryObject);
            catch
                % Preserve the original exception.
            end
        end

        if isfile(temporaryFile)
            delete(temporaryFile);
        end

        rethrow(exception);
    end
end
