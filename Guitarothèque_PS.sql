USE [DB_Guitarotheque]
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuitariste]    Script Date: 15/02/2024 11:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ALTER PROCEDURE [dbo].[DeleteGuitariste]
CREATE PROCEDURE [dbo].[DeleteGuitariste]
    @id INT
AS
BEGIN
    -- Vérifier s'il existe des associations dans la table MM_Guitariste_Guitare
    IF EXISTS (SELECT 1 FROM MM_Guitariste_Guitare WHERE Id_Guitaristes = @id)
    BEGIN
        -- Supprimer les associations dans la table MM_Guitariste_Guitare
        DELETE FROM MM_Guitariste_Guitare WHERE Id_Guitaristes = @id;
    END

    -- Supprimer le guitariste dans la table Guitaristes
    DELETE FROM Guitaristes WHERE Id_Guitaristes = @id;
END