DECLARE
@JobStatus INT
, @AttWarehouse UNIQUEIDENTIFIER = (
                                   SELECT TOP 1
                                        [S].[job_id]
                                     FROM
                                        [msdb]..[sysjobs] AS [S]
                                    WHERE
                                        [S].[name] = 'syspolicy_purge_history'
                                 )

SELECT
    @JobStatus = [run_status]
FROM
    [msdb]..[sysjobhistory]
WHERE
    [job_id] = @AttWarehouse
    --AND [run_status] = 4
PRINT @JobStatus
IF @JobStatus <> 4
BEGIN
    EXEC [msdb]..[sp_start_job]  @job_id = @AttWarehouse
END


