-- Create stored procedure ComputeAverageScoreForUser
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE num_corrections INT;

    -- Compute total score for the user
    SELECT SUM(score) INTO total_score
    FROM corrections
    WHERE user_id = user_id;

    -- Compute number of corrections for the user
    SELECT COUNT(*) INTO num_corrections
    FROM corrections
    WHERE user_id = user_id;

    -- Compute and store the average score
    IF num_corrections > 0 THEN
        UPDATE users
        SET average_score = total_score / num_corrections
        WHERE id = user_id;
    ELSE
        UPDATE users
        SET average_score = 0
        WHERE id = user_id;
    END IF;
END //

DELIMITER ;
