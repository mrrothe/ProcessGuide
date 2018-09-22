$('document').ready(function(){ // When page is finished loading execute function below..
    $.each(processnames,function(key,value){$('#processSelect').append($("<option></option>").attr("value",key).text(value));});  // For each value in processnames array; add an option to the dropdown
    $('#processSelect').change(function(){loadProcess($(this).val());}).change(); // add trigger to run loadProcess function when the dropdown is changed
});
function loadProcess(processID) {
    $('.question').text(processes[processID][0][1]); // Load first question text
    $('#answer_yes').attr('data-next',processes[processID][0][3]).text(processes[processID][0][2]); // Load first button 1 text
    $('#answer_no').attr('data-next',processes[processID][0][5]).text(processes[processID][0][4]); // Load first button 2 text
        if(processes[processID][0].length==2){ // If 0 buttons defined..
            $('#answer_yes').hide();
            $('#answer_no').hide();
        } else if(processes[processID][0].length==4) { // If 1 button defined..
            $('#answer_yes').show();
            $('#answer_no').hide();
        } else {  // If 2 buttons defined..
            $('#answer_yes').show();
            $('#answer_no').show();
        }
    $('.answer').unbind().click(function(){ // unbind previous events and add new click event
        processID= $('#processSelect').val(); // get process selected from dropdown
        var next=$(this).attr('data-next'); // get next button value
        if(processes[processID][next].length==2){ // If 0 buttons defined..
            $('#answer_yes').hide();
            $('#answer_no').hide();
        } else if(processes[processID][next].length==4) { // If 1 button defined..
            $('#answer_yes').show();
            $('#answer_no').hide();
        } else { // If 2 buttons defined..
            $('#answer_yes').show();
            $('#answer_no').show();
        }
        $('.question').html(processes[processID][next][1]); // Load question text
        $('#answer_yes').attr('data-next',processes[processID][next][3]).text(processes[processID][next][2]); // Load first button 1 text
        $('#answer_no').attr('data-next',processes[processID][next][5]).text(processes[processID][next][4]); // Load first button 2 text
    });
}