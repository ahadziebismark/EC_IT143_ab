-- Scalar Function: Calculate Player Efficiency 
CREATE FUNCTION dbo.fn_PlayerEfficiency
(
    @Points INT,
    @Assists INT,
    @Rebounds INT
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Efficiency FLOAT;
    SET @Efficiency = (@Points * 1.0 + @Assists * 1.5 + @Rebounds * 1.2) / 3;
    RETURN @Efficiency;
END;
GO

-- Audit Log Table (for Trigger)
CREATE TABLE PlayerStats_Log (
    LogID INT IDENTITY PRIMARY KEY,
    PlayerID INT,
    ActionType VARCHAR(10),
    ActionDate DATETIME
);
GO

-- Trigger: Log Inserts to PlayerStats
CREATE TRIGGER trg_LogInsert_PlayerStats
ON PlayerStats
AFTER INSERT
AS
BEGIN
    INSERT INTO PlayerStats_Log (PlayerID, ActionType, ActionDate)
    SELECT PlayerID, 'INSERT', GETDATE()
    FROM inserted;
END;
GO