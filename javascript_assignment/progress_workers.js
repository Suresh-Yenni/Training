function progress()
{
    if(!progress.width)
    {
        progress.width = 0;
        var execute = setInterval(fill, 300000);
        function fill()
        {
            if(progress.width > 99) clearInterval(execute);
            else{
                progress.width++;
                postMessage(progress.width)
            }
        }
    }
}

progress();