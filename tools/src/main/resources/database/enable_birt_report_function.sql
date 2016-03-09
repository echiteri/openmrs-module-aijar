DROP PROCEDURE IF EXISTS `getARTData`;
DROP PROCEDURE IF EXISTS `GetARTFollowupData0_24`;
DROP PROCEDURE IF EXISTS `GetARTFollowupData25_48`;
DROP PROCEDURE IF EXISTS `GetARTFollowupData49_72`;
DROP PROCEDURE IF EXISTS `getPreARTData`;
DROP PROCEDURE IF EXISTS `getPreARTFollowup`;
DROP PROCEDURE IF EXISTS `hmis106a1b`;

DROP FUNCTION IF EXISTS `get_adherence_Count`;
DROP FUNCTION IF EXISTS `get_adherenceType_Count`;
DROP FUNCTION IF EXISTS `getADHStatusTxt`;
DROP FUNCTION IF EXISTS `getAncNumberTxt`;
DROP FUNCTION IF EXISTS `getAppKeepTxt`;
DROP FUNCTION IF EXISTS `getArtBaseTransferDate`;
DROP FUNCTION IF EXISTS `getArtEligibilityAndReadyDate`;
DROP FUNCTION IF EXISTS `getArtEligibilityDate`;
DROP FUNCTION IF EXISTS `getArtEligibilityReasonTxt`;
DROP FUNCTION IF EXISTS `getArtRegCoded`;
DROP FUNCTION IF EXISTS `getArtRegCoded2`;
DROP FUNCTION IF EXISTS `getArtRegTxt`;
DROP FUNCTION IF EXISTS `getArtRegTxt2`;
DROP FUNCTION IF EXISTS `getArtRestartDate`;
DROP FUNCTION IF EXISTS `getArtStartDate`;
DROP FUNCTION IF EXISTS `getArtStartDate2`;
DROP FUNCTION IF EXISTS `getArtStartRegTxt`;
DROP FUNCTION IF EXISTS `getArtStopDate`;
DROP FUNCTION IF EXISTS `getArtStopDate1`;
DROP FUNCTION IF EXISTS `getArtStopReasonTxt`;
DROP FUNCTION IF EXISTS `getBaseWeightValue`;
DROP FUNCTION IF EXISTS `getCareEntryTxt`;
DROP FUNCTION IF EXISTS `getCd4BaseValue`;
DROP FUNCTION IF EXISTS `get_CD4_count`;
DROP FUNCTION IF EXISTS `getCd4SevereBaseValue`;
DROP FUNCTION IF EXISTS `getCD4Value`;
DROP FUNCTION IF EXISTS `getCodedDeathDate`;
DROP FUNCTION IF EXISTS `getCohortAllBefore10`;
DROP FUNCTION IF EXISTS `getCohortAllBefore11`;
DROP FUNCTION IF EXISTS `getCohortAllBefore12`;
DROP FUNCTION IF EXISTS `getCohortAllBefore15a`;
DROP FUNCTION IF EXISTS `getCohortAllBefore15b`;
DROP FUNCTION IF EXISTS `getCohortAllBefore16`;
DROP FUNCTION IF EXISTS `getCohortAllBefore3`;
DROP FUNCTION IF EXISTS `getCohortAllBefore4a`;
DROP FUNCTION IF EXISTS `getCohortAllBefore4b`;
DROP FUNCTION IF EXISTS `getCohortAllBefore5`;
DROP FUNCTION IF EXISTS `getCohortAllBefore6`;
DROP FUNCTION IF EXISTS `getCohortAllBefore7`;
DROP FUNCTION IF EXISTS `getCohortAllBefore9`;
DROP FUNCTION IF EXISTS `getCohortMonth`;
DROP FUNCTION IF EXISTS `get_cpt_receipt_status`;
DROP FUNCTION IF EXISTS `getCptStartDate`;
DROP FUNCTION IF EXISTS `getCptStatusTxt`;
DROP FUNCTION IF EXISTS `getDeathDate`;
DROP FUNCTION IF EXISTS `get_death_status`;
DROP FUNCTION IF EXISTS `getEddDate`;
DROP FUNCTION IF EXISTS `getEddEncounterId`;
DROP FUNCTION IF EXISTS `getEddEncounterId2`;
DROP FUNCTION IF EXISTS `getEddEncounterId3`;
DROP FUNCTION IF EXISTS `getEddEncounterId4`;
DROP FUNCTION IF EXISTS `getEncounterId`;
DROP FUNCTION IF EXISTS `getEncounterId2`;
DROP FUNCTION IF EXISTS `getEnrolDate`;
DROP FUNCTION IF EXISTS `getFirstArtStopDate`;
DROP FUNCTION IF EXISTS `getFlucStartDate`;
DROP FUNCTION IF EXISTS `get_followup_status`;
DROP FUNCTION IF EXISTS `get_followup_status2`;
DROP FUNCTION IF EXISTS `getFUARTStatus`;
DROP FUNCTION IF EXISTS `getFunctionalStatusTxt`;
DROP FUNCTION IF EXISTS `getFUStatus`;
DROP FUNCTION IF EXISTS `getINHStartDate`;
DROP FUNCTION IF EXISTS `getLastCd4SevereValue`;
DROP FUNCTION IF EXISTS `getLastCd4Value`;
DROP FUNCTION IF EXISTS `getLastEncounterDate`;
DROP FUNCTION IF EXISTS `getLastVisitDate`;
DROP FUNCTION IF EXISTS `get_lost_status`;
DROP FUNCTION IF EXISTS `getMonthCD4Value`;
DROP FUNCTION IF EXISTS `getMonthsOnCurrent`;
DROP FUNCTION IF EXISTS `getMonthsSinceStart`;
DROP FUNCTION IF EXISTS `getNumberDrugEncounter`;
DROP FUNCTION IF EXISTS `getNumberDrugSummary`;
DROP FUNCTION IF EXISTS `getNutritionalStatus`;
DROP FUNCTION IF EXISTS `getPatientIdentifierTxt`;
DROP FUNCTION IF EXISTS `getReferralText`;
DROP FUNCTION IF EXISTS `getReturnDate`;
DROP FUNCTION IF EXISTS `getReturnDate2`;
DROP FUNCTION IF EXISTS `get_scheduled_visits`;
DROP FUNCTION IF EXISTS `get_seen_status`;
DROP FUNCTION IF EXISTS `getStartEncounterId`;
DROP FUNCTION IF EXISTS `getSubstituteDate`;
DROP FUNCTION IF EXISTS `getSubstituteObsGroupId`;
DROP FUNCTION IF EXISTS `getSubstituteObsGroupId2`;
DROP FUNCTION IF EXISTS `getSubstituteReasonTxt`;
DROP FUNCTION IF EXISTS `getSwitchDate`;
DROP FUNCTION IF EXISTS `getSwitchObsGroupId`;
DROP FUNCTION IF EXISTS `getSwitchObsGroupId2`;
DROP FUNCTION IF EXISTS `getSwitchReasonTxt`;
DROP FUNCTION IF EXISTS `getTbRegNoTxt`;
DROP FUNCTION IF EXISTS `getTbStartDate`;
DROP FUNCTION IF EXISTS `get_tb_status`;
DROP FUNCTION IF EXISTS `getTbStatusTxt`;
DROP FUNCTION IF EXISTS `getTbStopDate`;
DROP FUNCTION IF EXISTS `getTransferInTxt`;
DROP FUNCTION IF EXISTS `getTransferOutDate`;
DROP FUNCTION IF EXISTS `get_transfer_status`;
DROP FUNCTION IF EXISTS `getWeightValue`;
DROP FUNCTION IF EXISTS `getWhoStageBaseTxt`;
DROP FUNCTION IF EXISTS `getWHOStageDate`;
DROP FUNCTION IF EXISTS `getWhoStageTxt`;


DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `getARTData`(IN start_year INT, IN start_month INT)
  BEGIN
    DECLARE bDone INT;

    DECLARE patient_id INT;

    DECLARE art_start_date DATE;

    DECLARE unique_id_number CHAR(15);

    DECLARE ti_emtct CHAR(10);

    DECLARE patient_clinic_id CHAR(12);

    DECLARE surname CHAR(40);
    DECLARE given_name CHAR(40);

    DECLARE sex CHAR(1);

    DECLARE age INT;

    DECLARE district CHAR(30);
    DECLARE sub_county CHAR(30);
    DECLARE village_cell CHAR(30);

    DECLARE function_status CHAR(30);

    DECLARE weight_muac CHAR(30);

    DECLARE who_stage INT;

    DECLARE cd4 INT;
    DECLARE viral_load INT;

    DECLARE cpt_start_date DATE;
    DECLARE cpt_stop_date DATE;

    DECLARE inh_start_date DATE;
    DECLARE inh_stop_date DATE;

    DECLARE tb_reg_no CHAR(15);
    DECLARE tb_start_date DATE;
    DECLARE tb_stop_date DATE;


    DECLARE preg1_edd CHAR(15);
    DECLARE preg1_anc CHAR(15);
    DECLARE preg1_infant CHAR(15);

    DECLARE preg2_edd CHAR(15);
    DECLARE preg2_anc CHAR(15);
    DECLARE preg2_infant CHAR(15);

    DECLARE preg3_edd CHAR(15);
    DECLARE preg3_anc CHAR(15);
    DECLARE preg3_infant CHAR(15);

    DECLARE preg4_edd CHAR(15);
    DECLARE preg4_anc CHAR(15);
    DECLARE preg4_infant CHAR(15);

    DECLARE original_regimen CHAR(15);

    DECLARE first_line_first CHAR(15);
    DECLARE first_line_second CHAR(15);


    DECLARE second_line_first CHAR(15);
    DECLARE second_line_second CHAR(15);

    DECLARE third_line_first CHAR(15);
    DECLARE third_line_second CHAR(15);

    DECLARE curs CURSOR FOR
      SELECT
        e.patient_id                                                                                                 AS 'patient_id',
        o.value_datetime                                                                                             AS 'art_start_date',
        getPatientIdentifierTxt(
            e.patient_id)                                                                                            AS 'unique_id_number',
        CONCAT(getTransferInTxt(e.patient_id), IF(getCareEntryTxt(e.patient_id) IN ('PMTCT', 'eMTCT'), 'eMTCT',
                                                  ''))                                                               AS 'ti_emtct',
        TIMESTAMPDIFF(YEAR, p.birthdate,
                      CURDATE())                                                                                     AS 'age',
        p.gender                                                                                                     AS 'sex',
        getFunctionalStatusTxt(e.patient_id,
                               o.value_datetime)                                                                     AS 'function_status',
        getBaseWeightValue(e.patient_id,
                           o.value_datetime)                                                                         AS 'weight_muac',
        getWhoStageBaseTxt(e.patient_id,
                           o.value_datetime)                                                                         AS 'who_stage',
        getCd4BaseValue(e.patient_id,
                        o.value_datetime)                                                                            AS 'cd4',
        getCptStartDate(
            e.patient_id)                                                                                            AS 'cpt_start_date',
        getTbRegNoTxt(
            e.patient_id)                                                                                            AS 'tb_reg_no',
        getTbStartDate(
            e.patient_id)                                                                                            AS 'tb_start_date',
        getTbStopDate(
            e.patient_id)                                                                                            AS 'tb_stop_date',
        getArtStartRegTxt(
            e.patient_id)                                                                                            AS 'original_regimen',
        getEddDate(getEddEncounterId(
                       e.patient_id))                                                                                AS 'preg1_edd',
        getAncNumberTxt(getEddEncounterId(
                            e.patient_id))                                                                           AS 'preg1_anc',
        getEddDate(getEddEncounterId2(
                       e.patient_id))                                                                                AS 'preg2_edd',
        getAncNumberTxt(getEddEncounterId2(
                            e.patient_id))                                                                           AS 'preg2_anc',
        getEddDate(getEddEncounterId3(
                       e.patient_id))                                                                                AS 'preg3_edd',
        getAncNumberTxt(getEddEncounterId3(
                            e.patient_id))                                                                           AS 'preg3_anc',
        getEddDate(getEddEncounterId4(
                       e.patient_id))                                                                                AS 'preg4_edd',
        getAncNumberTxt(getEddEncounterId4(
                            e.patient_id))                                                                           AS 'preg4_anc',
        CONCAT(getSwitchReasonTxt(getSwitchObsGroupId(e.patient_id)), '/',
               date_format(getSwitchDate(getSwitchObsGroupId(e.patient_id)),
                           '%e/%m/%y'))                                                                              AS 'first_line_first',
        CONCAT(getSwitchReasonTxt(getSwitchObsGroupId2(e.patient_id)), '/',
               date_format(getSwitchDate(getSwitchObsGroupId2(e.patient_id)),
                           '%e/%m/%y'))                                                                              AS 'first_line_second',
        CONCAT(getSubstituteReasonTxt(getSubstituteObsGroupId(e.patient_id)), '/',
               date_format(getSubstituteDate(getSubstituteObsGroupId(e.patient_id)),
                           '%e/%m/%y'))                                                                              AS 'second_line_first',
        CONCAT(getSubstituteReasonTxt(getSubstituteObsGroupId2(e.patient_id)), '/',
               date_format(getSubstituteDate(getSubstituteObsGroupId2(e.patient_id)),
                           '%e/%m/%y'))                                                                              AS 'second_line_second'
      FROM
        person p
        INNER JOIN
        encounter e ON (p.person_id = e.patient_id)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.concept_id IN (99160, 99161)
                  -- AND e.voided = 0
                  -- AND o.voided = 0
                  AND EXTRACT(YEAR_MONTH FROM o.value_datetime) =
                      EXTRACT(YEAR_MONTH FROM (MAKEDATE(start_year, 1) + INTERVAL start_month MONTH - INTERVAL 1 DAY))
        )
      ORDER BY o.value_datetime ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

    DROP TEMPORARY TABLE IF EXISTS artData;

    CREATE TEMPORARY TABLE IF NOT EXISTS artData
    (
      art_start_date     DATE,
      unique_id_number   CHAR(15),
      ti_emtct           CHAR(10),
      patient_clinic_id  CHAR(12),
      surname            CHAR(40),
      given_name         CHAR(40),
      sex                CHAR(1),
      age                INT,
      district           CHAR(30),
      sub_county         CHAR(30),
      village_cell       CHAR(30),
      function_status    CHAR(30),
      weight_muac        CHAR(30),
      who_stage          INT,
      cd4                INT,
      viral_load         INT,
      cpt_start_date     DATE,
      cpt_stop_date      DATE,
      inh_start_date     DATE,
      inh_stop_date      DATE,
      tb_reg_no          CHAR(15),
      tb_start_date      DATE,
      tb_stop_date       DATE,
      preg1_edd          CHAR(15),
      preg1_anc          CHAR(15),
      preg1_infant       CHAR(15),
      preg2_edd          CHAR(15),
      preg2_anc          CHAR(15),
      preg2_infant       CHAR(15),
      preg3_edd          CHAR(15),
      preg3_anc          CHAR(15),
      preg3_infant       CHAR(15),
      preg4_edd          CHAR(15),
      preg4_anc          CHAR(15),
      preg4_infant       CHAR(15),
      original_regimen   CHAR(15),
      first_line_first   CHAR(15),
      first_line_second  CHAR(15),
      second_line_first  CHAR(15),
      second_line_second CHAR(15),
      third_line_first   CHAR(15),
      third_line_second  CHAR(15)
    );

    OPEN curs;

    SET bDone = 0;

    REPEAT
      FETCH curs
      INTO
        patient_id,
        art_start_date,
        unique_id_number,
        ti_emtct,
        age,
        sex,
        function_status,
        weight_muac,
        who_stage,
        cd4,
        cpt_start_date,
        tb_reg_no,
        tb_start_date,
        tb_stop_date,
        original_regimen,
        preg1_edd,
        preg1_anc,
        preg2_edd,
        preg2_anc,
        preg3_edd,
        preg3_anc,
        preg4_edd,
        preg4_anc,
        first_line_first,
        first_line_second,
        second_line_first,
        second_line_second;
      IF (patient_id > 0 AND patient_id NOT IN (SELECT DISTINCT patient_id
                                                FROM artData))
      THEN
        SELECT
          middle_name,
          family_name
        INTO given_name, surname
        FROM person_name
        WHERE person_id = patient_id
        LIMIT 1;
        SELECT
          county_district,
          state_province,
          city_village
        INTO district, sub_county, village_cell
        FROM person_address
        WHERE person_id = patient_id
        LIMIT 1;
        INSERT INTO artData (
          art_start_date,
          unique_id_number,
          ti_emtct,
          given_name,
          surname,
          sex,
          age,
          district,
          sub_county,
          village_cell,
          function_status,
          weight_muac,
          who_stage,
          cd4,
          cpt_start_date,
          tb_reg_no,
          tb_start_date,
          tb_stop_date,
          original_regimen,
          preg1_edd,
          preg1_anc,
          preg2_edd,
          preg2_anc,
          preg3_edd,
          preg3_anc,
          preg4_edd,
          preg4_anc,
          first_line_first,
          first_line_second,
          second_line_first,
          second_line_second
        ) VALUES (
          art_start_date,
          unique_id_number,
          ti_emtct,
          given_name,
          surname,
          sex,
          age,
          district,
          sub_county,
          village_cell,
          function_status,
          weight_muac,
          who_stage,
          cd4,
          cpt_start_date,
          tb_reg_no,
          tb_start_date,
          tb_stop_date,
          original_regimen,
          preg1_edd,
          preg1_anc,
          preg2_edd,
          preg2_anc,
          preg3_edd,
          preg3_anc,
          preg4_edd,
          preg4_anc,
          first_line_first,
          first_line_second,
          second_line_first,
          second_line_second
        );
      END IF;
    UNTIL bDone END REPEAT;
    CLOSE curs;
    SELECT *
    FROM
      artData;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `GetARTFollowupData0_24`(IN start_year INT, IN start_month INTEGER)
  BEGIN
    DECLARE bDone INT;

    DECLARE patient INT;
    DECLARE x INT;
    DECLARE arvs_fu_status TEXT;
    DECLARE tb_status TEXT;
    DECLARE adh TEXT;
    DECLARE cpt TEXT;
    DECLARE adh_cpt_all TEXT;
    DECLARE adh_cpt TEXT;
    DECLARE fu TEXT;
    DECLARE arvs TEXT;
    DECLARE full_top TEXT;
    DECLARE enc INT;
    DECLARE real_date INT;

    DECLARE cs_1 INT;
    DECLARE cs_2 INT;
    DECLARE cs_3 INT;

    DECLARE w_1 DECIMAL;
    DECLARE w_2 DECIMAL;
    DECLARE w_3 DECIMAL;

    DECLARE cd4_1 DECIMAL;
    DECLARE cd4_2 DECIMAL;
    DECLARE cd4_3 DECIMAL;

    DECLARE vl_1 DECIMAL;
    DECLARE vl_2 DECIMAL;
    DECLARE vl_3 DECIMAL;

    DECLARE curs CURSOR FOR

      SELECT DISTINCT e.patient_id AS 'patient_id'

      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.concept_id IN (99160, 99161)
                  AND e.voided = 0
                  AND o.voided = 0 AND EXTRACT(YEAR_MONTH FROM o.value_datetime) = EXTRACT(YEAR_MONTH FROM (
        MAKEDATE(start_year, 1) + INTERVAL start_month MONTH - INTERVAL 1 DAY)))
      ORDER BY o.value_datetime ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

    DROP TEMPORARY TABLE IF EXISTS art_followup_data_0_24;

    CREATE TEMPORARY TABLE IF NOT EXISTS art_followup_data_0_24 (
      patient_id     INT,
      arvs_fu_status TEXT,
      tb_status      TEXT,
      adh_cpt        TEXT,
      cs_1           INT,
      cs_2           INT,
      cs_3           INT,
      w_1            DECIMAL,
      w_2            DECIMAL,
      w_3            DECIMAL,
      cd4_1          DECIMAL,
      cd4_2          DECIMAL,
      cd4_3          DECIMAL,
      vl_1           DECIMAL,
      vl_2           DECIMAL,
      vl_3           DECIMAL
    );

    OPEN curs;

    SET bDone = 0;

    REPEAT
      FETCH curs
      INTO patient;
      SET x = 0;
      SET arvs_fu_status = '';
      SET tb_status = '';
      SET adh = '';
      SET cpt = '';
      SET arvs = '';
      SET adh_cpt = '';
      WHILE x <= 12 DO
        SET real_date = (start_month + x);
        SET enc = getEncounterId(patient, start_year, real_date);
        SET fu = getFUARTStatus(patient, (MAKEDATE(start_year, 1) + INTERVAL real_date - 1 MONTH),
                                (MAKEDATE(start_year, 1) + INTERVAL real_date MONTH - INTERVAL 1 DAY));
        SET arvs = getArtRegTxt(enc);
        IF (arvs <> '' AND fu <> '')
        THEN
          SET full_top = CONCAT(arvs, '/', fu);
        ELSEIF arvs <> ''
          THEN
            SET full_top = arvs;
        ELSEIF fu <> ''
          THEN
            SET full_top = fu;
        END IF;

        SET arvs_fu_status = CONCAT_WS(',', COALESCE(arvs_fu_status, ''), COALESCE(full_top, ''));
        SET tb_status = CONCAT_WS(',', COALESCE(tb_status, ''), COALESCE(getTbStatusTxt(enc), ''));
        SET adh = getADHStatusTxt(patient, (MAKEDATE(start_year, 1) + INTERVAL real_date - 1 MONTH),
                                  (MAKEDATE(start_year, 1) + INTERVAL real_date MONTH - INTERVAL 1 DAY));
        SET cpt = getCptStatusTxt(enc);
        IF (adh <> '' AND cpt <> '')
        THEN
          SET adh_cpt_all = CONCAT(adh, '|', cpt);
        ELSEIF adh <> ''
          THEN
            SET adh_cpt_all = adh;
        ELSEIF cpt <> ''
          THEN
            SET adh_cpt_all = cpt;
        END IF;
        SET adh_cpt = CONCAT_WS(',', COALESCE(adh_cpt, ''), COALESCE(adh_cpt_all, ''));
        SET x = x + 1;
      END WHILE;
      IF (patient > 0)
      THEN
        INSERT INTO art_followup_data_0_24 (
          patient_id,
          arvs_fu_status,
          tb_status,
          adh_cpt,
          cs_1,
          cs_2,
          cs_3,
          w_1,
          w_2,
          w_3,
          cd4_1,
          cd4_2,
          cd4_3,
          vl_1,
          vl_2,
          vl_3
        ) VALUES (
          patient,
          SUBSTR(arvs_fu_status, 2),
          SUBSTR(tb_status, 2),
          SUBSTR(adh_cpt, 2),
          cs_1,
          cs_2,
          cs_3,
          w_1,
          w_2,
          w_3,
          cd4_1,
          cd4_2,
          cd4_3,
          vl_1,
          vl_2,
          vl_3
        );
      END IF;
    UNTIL bDone END REPEAT;

    CLOSE curs;

    SELECT *
    FROM
      art_followup_data_0_24;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `GetARTFollowupData25_48`(IN start_year INT, IN start_month INTEGER)
  BEGIN
    DECLARE bDone INT;

    DECLARE patient INT;
    DECLARE x INT;
    DECLARE arvs_fu_status TEXT;
    DECLARE tb_status TEXT;
    DECLARE adh TEXT;
    DECLARE cpt TEXT;
    DECLARE adh_cpt_all TEXT;
    DECLARE adh_cpt TEXT;
    DECLARE fu TEXT;
    DECLARE arvs TEXT;
    DECLARE full_top TEXT;
    DECLARE enc INT;
    DECLARE real_date INT;

    DECLARE cs_1 INT;
    DECLARE cs_2 INT;

    DECLARE w_1 DECIMAL;
    DECLARE w_2 DECIMAL;

    DECLARE cd4_1 DECIMAL;
    DECLARE cd4_2 DECIMAL;

    DECLARE vl_1 DECIMAL;
    DECLARE vl_2 DECIMAL;

    DECLARE curs CURSOR FOR
      SELECT e.patient_id AS 'patient_id'

      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.concept_id IN (99160, 99161)
                  AND e.voided = 0
                  AND o.voided = 0 AND EXTRACT(YEAR_MONTH FROM o.value_datetime) = EXTRACT(YEAR_MONTH FROM (
        MAKEDATE(start_year, 1) + INTERVAL start_month MONTH - INTERVAL 1 DAY)))
      ORDER BY o.value_datetime ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

    DROP TEMPORARY TABLE IF EXISTS art_followup_data_25_48;

    CREATE TEMPORARY TABLE IF NOT EXISTS art_followup_data_25_48 (

      patient_id     INT,
      arvs_fu_status TEXT,
      tb_status      TEXT,
      adh_cpt        TEXT,
      cs_1           INT,
      cs_2           INT,
      w_1            DECIMAL,
      w_2            DECIMAL,
      cd4_1          DECIMAL,
      cd4_2          DECIMAL,
      vl_1           DECIMAL,
      vl_2           DECIMAL
    );

    OPEN curs;

    SET bDone = 0;

    REPEAT
      FETCH curs
      INTO patient;
      SET x = 25;
      SET arvs_fu_status = '';
      SET tb_status = '';
      SET adh = '';
      SET cpt = '';
      SET arvs = '';
      SET adh_cpt = '';
      WHILE x <= 48 DO
        SET real_date = (start_month + x);
        SET enc = getEncounterId(patient, start_year, real_date);
        SET fu = getFUARTStatus(patient, (MAKEDATE(start_year, 1) + INTERVAL real_date - 1 MONTH),
                                (MAKEDATE(start_year, 1) + INTERVAL real_date MONTH - INTERVAL 1 DAY));
        SET arvs = getArtRegTxt(enc);
        IF (arvs <> '' AND fu <> '')
        THEN
          SET full_top = CONCAT(arvs, '/', fu);
        ELSEIF arvs <> ''
          THEN
            SET full_top = arvs;
        ELSEIF fu <> ''
          THEN
            SET full_top = fu;
        END IF;

        SET arvs_fu_status = CONCAT_WS(',', COALESCE(arvs_fu_status, ''), COALESCE(full_top, ''));
        SET tb_status = CONCAT_WS(',', COALESCE(tb_status, ''), COALESCE(getTbStatusTxt(enc), ''));
        SET adh = getADHStatusTxt(patient, (MAKEDATE(start_year, 1) + INTERVAL real_date - 1 MONTH),
                                  (MAKEDATE(start_year, 1) + INTERVAL real_date MONTH - INTERVAL 1 DAY));
        SET cpt = getCptStatusTxt(enc);
        IF (adh <> '' AND cpt <> '')
        THEN
          SET adh_cpt_all = CONCAT(adh, '|', cpt);
        ELSEIF adh <> ''
          THEN
            SET adh_cpt_all = adh;
        ELSEIF cpt <> ''
          THEN
            SET adh_cpt_all = cpt;
        END IF;
        SET adh_cpt = CONCAT_WS(',', COALESCE(adh_cpt, ''), COALESCE(adh_cpt_all, ''));
        SET x = x + 1;
      END WHILE;
      IF (patient > 0)
      THEN
        INSERT INTO art_followup_data_25_48 (
          patient_id,
          arvs_fu_status,
          tb_status,
          adh_cpt,
          cs_1,
          cs_2,
          w_1,
          w_2,
          cd4_1,
          cd4_2,
          vl_1,
          vl_2
        ) VALUES (
          patient,
          SUBSTR(arvs_fu_status, 2),
          SUBSTR(tb_status, 2),
          SUBSTR(adh_cpt, 2),
          cs_1,
          cs_2,
          w_1,
          w_2,
          cd4_1,
          cd4_2,
          vl_1,
          vl_2
        );
      END IF;
    UNTIL bDone END REPEAT;
    CLOSE curs;
    SELECT *
    FROM
      art_followup_data_25_48;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `GetARTFollowupData49_72`(IN start_year INT, IN start_month INTEGER)
  BEGIN
    DECLARE bDone INT;

    DECLARE patient INT;
    DECLARE x INT;
    DECLARE arvs_fu_status TEXT;
    DECLARE tb_status TEXT;
    DECLARE adh TEXT;
    DECLARE cpt TEXT;
    DECLARE adh_cpt_all TEXT;
    DECLARE adh_cpt TEXT;
    DECLARE fu TEXT;
    DECLARE arvs TEXT;
    DECLARE full_top TEXT;
    DECLARE enc INT;
    DECLARE real_date INT;

    DECLARE cs_1 INT;
    DECLARE cs_2 INT;

    DECLARE w_1 DECIMAL;
    DECLARE w_2 DECIMAL;

    DECLARE cd4_1 DECIMAL;
    DECLARE cd4_2 DECIMAL;

    DECLARE vl_1 DECIMAL;
    DECLARE vl_2 DECIMAL;
    DECLARE curs CURSOR FOR
      SELECT e.patient_id AS 'patient_id'

      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.concept_id IN (99160, 99161)
                  AND e.voided = 0
                  AND o.voided = 0 AND EXTRACT(YEAR_MONTH FROM o.value_datetime) = EXTRACT(YEAR_MONTH FROM (
        MAKEDATE(start_year, 1) + INTERVAL start_month MONTH - INTERVAL 1 DAY)))
      ORDER BY o.value_datetime ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

    DROP TEMPORARY TABLE IF EXISTS art_followup_data_49_72;

    CREATE TEMPORARY TABLE IF NOT EXISTS art_followup_data_49_72 (
      patient_id     INT,
      arvs_fu_status TEXT,
      tb_status      TEXT,
      adh_cpt        TEXT,
      cs_1           INT,
      cs_2           INT,
      w_1            DECIMAL,
      w_2            DECIMAL,
      cd4_1          DECIMAL,
      cd4_2          DECIMAL,
      vl_1           DECIMAL,
      vl_2           DECIMAL
    );

    OPEN curs;

    SET bDone = 0;

    REPEAT
      FETCH curs
      INTO patient;
      SET x = 49;
      SET arvs_fu_status = '';
      SET tb_status = '';
      SET adh = '';
      SET cpt = '';
      SET arvs = '';
      SET adh_cpt = '';
      WHILE x <= 72 DO
        SET real_date = (start_month + x);
        SET enc = getEncounterId(patient, start_year, real_date);
        SET fu = getFUARTStatus(patient, (MAKEDATE(start_year, 1) + INTERVAL real_date - 1 MONTH),
                                (MAKEDATE(start_year, 1) + INTERVAL real_date MONTH - INTERVAL 1 DAY));
        SET arvs = getArtRegTxt(enc);
        IF (arvs <> '' AND fu <> '')
        THEN
          SET full_top = CONCAT(arvs, '/', fu);
        ELSEIF arvs <> ''
          THEN
            SET full_top = arvs;
        ELSEIF fu <> ''
          THEN
            SET full_top = fu;
        END IF;

        SET arvs_fu_status = CONCAT_WS(',', COALESCE(arvs_fu_status, ''), COALESCE(full_top, ''));
        SET tb_status = CONCAT_WS(',', COALESCE(tb_status, ''), COALESCE(getTbStatusTxt(enc), ''));
        SET adh = getADHStatusTxt(patient, (MAKEDATE(start_year, 1) + INTERVAL real_date - 1 MONTH),
                                  (MAKEDATE(start_year, 1) + INTERVAL real_date MONTH - INTERVAL 1 DAY));
        SET cpt = getCptStatusTxt(enc);
        IF (adh <> '' AND cpt <> '')
        THEN
          SET adh_cpt_all = CONCAT(adh, '|', cpt);
        ELSEIF adh <> ''
          THEN
            SET adh_cpt_all = adh;
        ELSEIF cpt <> ''
          THEN
            SET adh_cpt_all = cpt;
        END IF;
        SET adh_cpt = CONCAT_WS(',', COALESCE(adh_cpt, ''), COALESCE(adh_cpt_all, ''));
        SET x = x + 1;
      END WHILE;
      IF (patient > 0)
      THEN
        INSERT INTO art_followup_data_49_72 (
          patient_id,
          arvs_fu_status,
          tb_status,
          adh_cpt,
          cs_1,
          cs_2,
          w_1,
          w_2,
          cd4_1,
          cd4_2,
          vl_1,
          vl_2

        ) VALUES (
          patient,
          SUBSTR(arvs_fu_status, 2),
          SUBSTR(tb_status, 2),
          SUBSTR(adh_cpt, 2),
          cs_1,
          cs_2,
          w_1,
          w_2,
          cd4_1,
          cd4_2,
          vl_1,
          vl_2
        );
      END IF;
    UNTIL bDone END REPEAT;
    CLOSE curs;
    SELECT *
    FROM
      art_followup_data_49_72;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `getPreARTData`(IN start_year INT)
  BEGIN

    DECLARE bDone INT;

    DECLARE date_enrolled_in_care DATE;

    DECLARE unique_id CHAR(25);

    DECLARE patient_id INT;

    DECLARE surname CHAR(50);
    DECLARE gn CHAR(50);

    DECLARE p_sex CHAR(40);

    DECLARE p_age INT;

    DECLARE district CHAR(30);
    DECLARE sub_county CHAR(30);
    DECLARE village_cell CHAR(30);

    DECLARE entry_point CHAR(15);

    DECLARE status_at_enrollment CHAR(10);

    DECLARE cpt_start_date DATE;
    DECLARE cpt_stop_date DATE;

    DECLARE inh_start_date DATE;
    DECLARE inh_stop_date DATE;

    DECLARE tb_reg_no CHAR(15);
    DECLARE tb_start_date DATE;
    DECLARE tb_stop_date DATE;

    DECLARE who_stage_1 DATE;
    DECLARE who_stage_2 DATE;
    DECLARE who_stage_3 DATE;
    DECLARE who_stage_4 DATE;


    DECLARE date_eligible_for_art DATE;

    DECLARE why_eligible CHAR(15);

    DECLARE date_eligible_and_ready_for_art DATE;

    DECLARE date_art_started DATE;

    DECLARE curs CURSOR FOR SELECT DISTINCT
                              getEnrolDate(e.patient_id)                  AS 'date_enrolled_in_care',
                              getPatientIdentifierTxt(e.patient_id)       AS 'unique_id',
                              e.patient_id                                AS 'patient_id',
                              getCareEntryTxt(e.patient_id)               AS 'entry_point',
                              getCptStartDate(e.patient_id)               AS 'cpt_start_date',
                              getINHStartDate(e.patient_id)               AS 'inh_start_date',
                              getTbRegNoTxt(e.patient_id)                 AS 'tb_reg_no',
                              getTbStartDate(e.patient_id)                AS 'tb_start_date',
                              getTbStopDate(e.patient_id)                 AS 'tb_stop_date',
                              getWHOStageDate(e.patient_id, 1)            AS 'who_stage_1',
                              getWHOStageDate(e.patient_id, 2)            AS 'who_stage_2',
                              getWHOStageDate(e.patient_id, 3)            AS 'who_stage_3',
                              getWHOStageDate(e.patient_id, 4)            AS 'who_stage_4',
                              getArtEligibilityDate(e.patient_id)         AS 'date_eligible_for_art',
                              getArtEligibilityReasonTxt(e.patient_id)    AS 'why_eligible',
                              getArtEligibilityAndReadyDate(e.patient_id) AS 'date_eligible_and_ready_for_art',
                              getArtBaseTransferDate(e.patient_id)        AS 'date_art_started'
                            FROM encounter e
                            WHERE e.voided = 0 AND YEAR(e.encounter_datetime) = start_year AND e.encounter_type = 1
                            ORDER BY e.encounter_datetime;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

    DROP TEMPORARY TABLE IF EXISTS artPreData;

    CREATE TEMPORARY TABLE IF NOT EXISTS artPreData (
      date_enrolled_in_care           DATE,
      unique_id                       CHAR(25),
      patient_id                      INT,
      surname                         CHAR(40),
      given_name                      CHAR(40),
      sex                             CHAR(40),
      age                             INT,
      district                        CHAR(30),
      sub_county                      CHAR(30),
      village_cell                    CHAR(30),
      entry_point                     CHAR(15),
      status_at_enrollment            CHAR(10),
      cpt_start_date                  DATE,
      cpt_stop_date                   DATE,
      inh_start_date                  DATE,
      inh_stop_date                   DATE,
      tb_reg_no                       CHAR(15),
      tb_start_date                   DATE,
      tb_stop_date                    DATE,
      who_stage_1                     DATE,
      who_stage_2                     DATE,
      who_stage_3                     DATE,
      who_stage_4                     DATE,
      date_eligible_for_art           DATE,
      why_eligible                    CHAR(15),
      date_eligible_and_ready_for_art DATE,
      date_art_started                DATE
    );

    OPEN curs;

    SET bDone = 0;

    REPEAT
      FETCH curs
      INTO date_enrolled_in_care, unique_id, patient_id, entry_point, cpt_start_date, inh_start_date, tb_reg_no, tb_start_date, tb_stop_date, who_stage_1, who_stage_2, who_stage_3, who_stage_4, date_eligible_for_art, why_eligible, date_eligible_and_ready_for_art, date_art_started;
      -- IF(patient_id > 0 AND patient_id not IN (select DISTINCT patient_id from artPreData)) THEN
      SELECT
        CONCAT(given_name, COALESCE(middle_name, '')),
        family_name
      INTO gn, surname
      FROM person_name
      WHERE person_id = patient_id
      LIMIT 1;
      SELECT
        pp.gender,
        TIMESTAMPDIFF(YEAR, pp.birthdate, CURDATE())
      INTO p_sex, p_age
      FROM person pp
      WHERE person_id = patient_id
      LIMIT 1;
      SELECT
        county_district,
        state_province,
        city_village
      INTO district, sub_county, village_cell
      FROM person_address
      WHERE person_id = patient_id
      LIMIT 1;
      INSERT INTO artPreData (
        date_enrolled_in_care,
        unique_id,
        patient_id,
        surname,
        given_name,
        sex,
        age,
        district,
        sub_county,
        village_cell,
        entry_point,
        status_at_enrollment,
        cpt_start_date,
        cpt_stop_date,
        inh_start_date,
        inh_stop_date,
        tb_reg_no,
        tb_start_date,
        tb_stop_date,
        who_stage_1,
        who_stage_2,
        who_stage_3,
        who_stage_4,
        date_eligible_for_art,
        why_eligible,
        date_eligible_and_ready_for_art,
        date_art_started
      ) VALUES (
        date_enrolled_in_care,
        unique_id,
        patient_id,
        surname,
        gn,
        p_sex,
        p_age,
        district,
        sub_county,
        village_cell,
        entry_point,
        status_at_enrollment,
        cpt_start_date,
        cpt_stop_date,
        inh_start_date,
        inh_stop_date,
        tb_reg_no,
        tb_start_date,
        tb_stop_date,
        who_stage_1,
        who_stage_2,
        who_stage_3,
        who_stage_4,
        date_eligible_for_art,
        why_eligible,
        date_eligible_and_ready_for_art,
        date_art_started
      );
      -- END IF;
    UNTIL bDone
    END REPEAT;
    CLOSE curs;
    SELECT DISTINCT *
    FROM artPreData;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `getPreARTFollowup`(IN start_year INTEGER)
  BEGIN

    DECLARE bDone INT;
    DECLARE patient_id INT;
    DECLARE fu_status TEXT;
    DECLARE fu_status_1 CHAR(20);
    DECLARE fu_status_2 CHAR(20);
    DECLARE fu_status_3 CHAR(20);
    DECLARE fu_status_4 CHAR(20);

    DECLARE nutritinal_status_1 CHAR(20);
    DECLARE nutritinal_status_2 CHAR(20);
    DECLARE nutritinal_status_3 CHAR(20);
    DECLARE nutritinal_status_4 CHAR(20);

    DECLARE tb_status TEXT;
    DECLARE cpt TEXT;
    DECLARE nutritinal_status TEXT;
    DECLARE x INT;
    DECLARE real_date INT;

    DECLARE curs CURSOR FOR SELECT DISTINCT e.patient_id AS 'patient_id'
                            FROM encounter e
                            WHERE e.voided = 0 AND YEAR(e.encounter_datetime) = start_year AND e.encounter_type = 1
                            ORDER BY e.encounter_datetime;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;

    DROP TEMPORARY TABLE IF EXISTS pre_art_followup_data;

    CREATE TEMPORARY TABLE IF NOT EXISTS pre_art_followup_data (
      patient_id        INT,
      fu_status         TEXT,
      tb_status         TEXT,
      cpt               TEXT,
      nutritinal_status TEXT
    )
      DEFAULT CHARSET = utf8;

    OPEN curs;

    SET bDone = 0;

    REPEAT
      FETCH curs
      INTO patient_id;
      SET x = 0;
      SET fu_status = '';
      SET tb_status = '';
      SET cpt = '';
      SET nutritinal_status = '';
      WHILE x < 4 DO
        SET real_date = (start_year + x);
        SET tb_status = CONCAT_WS(',', COALESCE(tb_status, ''),
                                  COALESCE(getTbStatusTxt(getEncounterId2(patient_id, real_date, 1)), ''),
                                  COALESCE(getTbStatusTxt(getEncounterId2(patient_id, real_date, 2)), ''),
                                  COALESCE(getTbStatusTxt(getEncounterId2(patient_id, real_date, 3)), ''),
                                  COALESCE(getTbStatusTxt(getEncounterId2(patient_id, real_date, 4)), ''));
        SET cpt = CONCAT_WS(',', COALESCE(cpt, ''),
                            COALESCE(getCptStatusTxt(getEncounterId2(patient_id, real_date, 1)), ''),
                            COALESCE(getCptStatusTxt(getEncounterId2(patient_id, real_date, 2)), ''),
                            COALESCE(getCptStatusTxt(getEncounterId2(patient_id, real_date, 3)), ''),
                            COALESCE(getCptStatusTxt(getEncounterId2(patient_id, real_date, 4)), ''));

        SET fu_status_1 = getFUStatus(patient_id, (MAKEDATE(real_date, 1)),
                                      (MAKEDATE(start_year, 1) + INTERVAL 1 QUARTER - INTERVAL 1 DAY));
        SET fu_status_2 = getFUStatus(patient_id, (MAKEDATE(real_date, 1) + INTERVAL 1 QUARTER),
                                      (MAKEDATE(real_date, 1) + INTERVAL 2 QUARTER - INTERVAL 1 DAY));
        SET fu_status_3 = getFUStatus(patient_id, (MAKEDATE(real_date, 1) + INTERVAL 2 QUARTER),
                                      (MAKEDATE(real_date, 1) + INTERVAL 3 QUARTER - INTERVAL 1 DAY));
        SET fu_status_4 = getFUStatus(patient_id, (MAKEDATE(real_date, 1) + INTERVAL 3 QUARTER),
                                      (MAKEDATE(real_date, 1) + INTERVAL 4 QUARTER - INTERVAL 1 DAY));

        SET nutritinal_status_1 = getNutritionalStatus(patient_id, (MAKEDATE(real_date, 1)),
                                                       (MAKEDATE(start_year, 1) + INTERVAL 1 QUARTER - INTERVAL 1 DAY));
        SET nutritinal_status_2 = getNutritionalStatus(patient_id, (MAKEDATE(real_date, 1) + INTERVAL 1 QUARTER),
                                                       (MAKEDATE(real_date, 1) + INTERVAL 2 QUARTER - INTERVAL 1 DAY));
        SET nutritinal_status_3 = getNutritionalStatus(patient_id, (MAKEDATE(real_date, 1) + INTERVAL 2 QUARTER),
                                                       (MAKEDATE(real_date, 1) + INTERVAL 3 QUARTER - INTERVAL 1 DAY));
        SET nutritinal_status_4 = getNutritionalStatus(patient_id, (MAKEDATE(real_date, 1) + INTERVAL 3 QUARTER),
                                                       (MAKEDATE(real_date, 1) + INTERVAL 4 QUARTER - INTERVAL 1 DAY));

        SET fu_status = CONCAT_WS(',', COALESCE(fu_status, ''), COALESCE(fu_status_1, ''), COALESCE(fu_status_2, ''),
                                  COALESCE(fu_status_3, ''), COALESCE(fu_status_4, ''));
        SET nutritinal_status = CONCAT_WS(',', COALESCE(nutritinal_status, ''), COALESCE(nutritinal_status_1, ''),
                                          COALESCE(nutritinal_status_2, ''), COALESCE(nutritinal_status_3, ''),
                                          COALESCE(nutritinal_status_4, ''));
        SET x = x + 1;
      END WHILE;
      -- IF(patient_id > 0 AND patient_id not IN (select DISTINCT patient_id from pre_art_followup_data)) THEN
      INSERT INTO pre_art_followup_data (patient_id, fu_status, tb_status, cpt, nutritinal_status)
      VALUES (patient_id, SUBSTR(fu_status, 2), SUBSTR(tb_status, 2), SUBSTR(cpt, 2), SUBSTR(nutritinal_status, 2));
      -- END IF;
    UNTIL bDone END REPEAT;
    CLOSE curs;
    SELECT DISTINCT *
    FROM pre_art_followup_data;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` PROCEDURE `hmis106a1b`(IN start_year INTEGER, IN start_quarter INT)
  BEGIN
    DECLARE h11a CHAR(255) DEFAULT 'All patients 6 months';
    DECLARE h12a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 6);
    DECLARE h13a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 6, NULL);
    DECLARE h14a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 6, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 6, NULL));
    DECLARE h15a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 6, NULL);
    DECLARE h16a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 6, NULL);
    DECLARE h17a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 6, NULL);
    DECLARE h18a INT DEFAULT h13a + h16a - h17a;
    DECLARE h19a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 6, NULL);
    DECLARE h110a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 6, NULL);
    DECLARE h111a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 6, NULL);
    DECLARE h112a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 6, NULL);
    DECLARE h113a INT DEFAULT h18a - h19a - h110a - h111a - h112a;
    DECLARE h114a DECIMAL DEFAULT (h113a / h18a) * 100;
    DECLARE h115a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 6, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 6, NULL));
    DECLARE h116a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 6, NULL);

    DECLARE h21a CHAR(255) DEFAULT 'All patients 12 months';
    DECLARE h22a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 12);
    DECLARE h23a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 12, NULL);
    DECLARE h24a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 12, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 12, NULL));
    DECLARE h25a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 12, NULL);
    DECLARE h26a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 12, NULL);
    DECLARE h27a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 12, NULL);
    DECLARE h28a INT DEFAULT h23a + h26a - h27a;
    DECLARE h29a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 12, NULL);
    DECLARE h210a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 12, NULL);
    DECLARE h211a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 12, NULL);
    DECLARE h212a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 12, NULL);
    DECLARE h213a INT DEFAULT h28a - h29a - h210a - h211a - h212a;
    DECLARE h214a DECIMAL DEFAULT (h213a / h28a) * 100;
    DECLARE h215a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 12, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 12, NULL));
    DECLARE h216a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 12, NULL);

    DECLARE h31a CHAR(255) DEFAULT 'All patients 24 months';
    DECLARE h32a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 24);
    DECLARE h33a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 24, NULL);
    DECLARE h34a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 24, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 24, NULL));
    DECLARE h35a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 24, NULL);
    DECLARE h36a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 24, NULL);
    DECLARE h37a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 24, NULL);
    DECLARE h38a INT DEFAULT h33a + h36a - h37a;
    DECLARE h39a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 24, NULL);
    DECLARE h310a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 24, NULL);
    DECLARE h311a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 24, NULL);
    DECLARE h312a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 24, NULL);
    DECLARE h313a INT DEFAULT h38a - h39a - h310a - h311a - h312a;
    DECLARE h314a DECIMAL DEFAULT (h313a / h38a) * 100;
    DECLARE h315a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 24, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 24, NULL));
    DECLARE h316a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 24, NULL);

    DECLARE h41a CHAR(255) DEFAULT 'All patients 36 months';
    DECLARE h42a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 36);
    DECLARE h43a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 36, NULL);
    DECLARE h44a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 36, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 36, NULL));
    DECLARE h45a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 36, NULL);
    DECLARE h46a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 36, NULL);
    DECLARE h47a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 36, NULL);
    DECLARE h48a INT DEFAULT h43a + h46a - h47a;
    DECLARE h49a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 36, NULL);
    DECLARE h410a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 36, NULL);
    DECLARE h411a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 36, NULL);
    DECLARE h412a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 36, NULL);
    DECLARE h413a INT DEFAULT h48a - h49a - h410a - h411a - h412a;
    DECLARE h414a DECIMAL DEFAULT (h413a / h48a) * 100;
    DECLARE h415a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 36, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 36, NULL));
    DECLARE h416a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 36, NULL);

    DECLARE h51a CHAR(255) DEFAULT 'All patients 48 months';
    DECLARE h52a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 48);
    DECLARE h53a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 48, NULL);
    DECLARE h54a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 48, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 48, NULL));
    DECLARE h55a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 48, NULL);
    DECLARE h56a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 48, NULL);
    DECLARE h57a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 48, NULL);
    DECLARE h58a INT DEFAULT h53a + h56a - h57a;
    DECLARE h59a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 48, NULL);
    DECLARE h510a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 48, NULL);
    DECLARE h511a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 48, NULL);
    DECLARE h512a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 48, NULL);
    DECLARE h513a INT DEFAULT h58a - h59a - h510a - h511a - h512a;
    DECLARE h514a DECIMAL DEFAULT (h513a / h58a) * 100;
    DECLARE h515a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 48, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 48, NULL));
    DECLARE h516a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 48, NULL);

    DECLARE h61a CHAR(255) DEFAULT 'All patients 60 months';
    DECLARE h62a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 60);
    DECLARE h63a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 60, NULL);
    DECLARE h64a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 60, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 60, NULL));
    DECLARE h65a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 60, NULL);
    DECLARE h66a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 60, NULL);
    DECLARE h67a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 60, NULL);
    DECLARE h68a INT DEFAULT h63a + h66a - h67a;
    DECLARE h69a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 60, NULL);
    DECLARE h610a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 60, NULL);
    DECLARE h611a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 60, NULL);
    DECLARE h612a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 60, NULL);
    DECLARE h613a INT DEFAULT h68a - h69a - h610a - h611a - h612a;
    DECLARE h614a DECIMAL DEFAULT (h613a / h68a) * 100;
    DECLARE h615a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 60, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 60, NULL));
    DECLARE h616a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 60, NULL);

    DECLARE h71a CHAR(255) DEFAULT 'All patients 72 months';
    DECLARE h72a CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 72);
    DECLARE h73a INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 72, NULL);
    DECLARE h74a CHAR(20) DEFAULT CONCAT(getCohortAllBefore4a(start_year, start_quarter, 72, NULL), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 72, NULL));
    DECLARE h75a INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 72, NULL);
    DECLARE h76a INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 72, NULL);
    DECLARE h77a INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 72, NULL);
    DECLARE h78a INT DEFAULT h73a + h76a - h77a;
    DECLARE h79a INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 72, NULL);
    DECLARE h710a INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 72, NULL);
    DECLARE h711a INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 72, NULL);
    DECLARE h712a INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 72, NULL);
    DECLARE h713a INT DEFAULT h18a - h79a - h710a - h711a - h712a;
    DECLARE h714a DECIMAL DEFAULT (h713a / h78a) * 100;
    DECLARE h715a CHAR(20) DEFAULT CONCAT(getCohortAllBefore15a(start_year, start_quarter, 72, NULL), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 72, NULL));
    DECLARE h716a INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 72, NULL);

    DECLARE h11b CHAR(255) DEFAULT 'eMTCT Mothers 6 months';
    DECLARE h12b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 6);
    DECLARE h13b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 6, TRUE);
    DECLARE h14b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 6, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 6, TRUE));
    DECLARE h15b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 6, TRUE);
    DECLARE h16b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 6, TRUE);
    DECLARE h17b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 6, TRUE);
    DECLARE h18b INT DEFAULT h13b + h16b - h17b;
    DECLARE h19b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 6, TRUE);
    DECLARE h110b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 6, TRUE);
    DECLARE h111b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 6, TRUE);
    DECLARE h112b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 6, TRUE);
    DECLARE h113b INT DEFAULT h18b - h19b - h110b - h111b - h112b;
    DECLARE h114b DECIMAL DEFAULT (h113b / h18b) * 100;
    DECLARE h115b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 6, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 6, TRUE));
    DECLARE h116b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 6, TRUE);

    DECLARE h21b CHAR(255) DEFAULT 'eMTCT Mothers 12 months';
    DECLARE h22b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 12);
    DECLARE h23b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 12, TRUE);
    DECLARE h24b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 12, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 12, TRUE));
    DECLARE h25b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 12, TRUE);
    DECLARE h26b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 12, TRUE);
    DECLARE h27b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 12, TRUE);
    DECLARE h28b INT DEFAULT h23b + h26b - h27b;
    DECLARE h29b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 12, TRUE);
    DECLARE h210b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 12, TRUE);
    DECLARE h211b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 12, TRUE);
    DECLARE h212b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 12, TRUE);
    DECLARE h213b INT DEFAULT h28b - h29b - h210b - h211b - h212b;
    DECLARE h214b DECIMAL DEFAULT (h213b / h28b) * 100;
    DECLARE h215b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 12, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 12, TRUE));
    DECLARE h216b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 12, TRUE);

    DECLARE h31b CHAR(255) DEFAULT 'eMTCT Mothers 24 months';
    DECLARE h32b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 24);
    DECLARE h33b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 24, TRUE);
    DECLARE h34b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 24, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 24, TRUE));
    DECLARE h35b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 24, TRUE);
    DECLARE h36b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 24, TRUE);
    DECLARE h37b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 24, TRUE);
    DECLARE h38b INT DEFAULT h33b + h36b - h37b;
    DECLARE h39b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 24, TRUE);
    DECLARE h310b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 24, TRUE);
    DECLARE h311b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 24, TRUE);
    DECLARE h312b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 24, TRUE);
    DECLARE h313b INT DEFAULT h38b - h39b - h310b - h311b - h312b;
    DECLARE h314b DECIMAL DEFAULT (h313b / h38b) * 100;
    DECLARE h315b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 24, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 24, TRUE));
    DECLARE h316b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 24, TRUE);

    DECLARE h41b CHAR(255) DEFAULT 'eMTCT Mothers 36 months';
    DECLARE h42b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 36);
    DECLARE h43b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 36, TRUE);
    DECLARE h44b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 36, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 36, TRUE));
    DECLARE h45b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 36, TRUE);
    DECLARE h46b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 36, TRUE);
    DECLARE h47b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 36, TRUE);
    DECLARE h48b INT DEFAULT h43b + h46b - h47b;
    DECLARE h49b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 36, TRUE);
    DECLARE h410b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 36, TRUE);
    DECLARE h411b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 36, TRUE);
    DECLARE h412b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 36, TRUE);
    DECLARE h413b INT DEFAULT h48b - h49b - h410b - h411b - h412b;
    DECLARE h414b DECIMAL DEFAULT (h413b / h48b) * 100;
    DECLARE h415b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 36, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 36, TRUE));
    DECLARE h416b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 36, TRUE);

    DECLARE h51b CHAR(255) DEFAULT 'eMTCT Mothers 48 months';
    DECLARE h52b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 48);
    DECLARE h53b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 48, TRUE);
    DECLARE h54b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 48, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 48, TRUE));
    DECLARE h55b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 48, TRUE);
    DECLARE h56b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 48, TRUE);
    DECLARE h57b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 48, TRUE);
    DECLARE h58b INT DEFAULT h53b + h56b - h57b;
    DECLARE h59b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 48, TRUE);
    DECLARE h510b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 48, TRUE);
    DECLARE h511b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 48, TRUE);
    DECLARE h512b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 48, TRUE);
    DECLARE h513b INT DEFAULT h58b - h59b - h510b - h511b - h512b;
    DECLARE h514b DECIMAL DEFAULT (h513b / h58b) * 100;
    DECLARE h515b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 48, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 48, TRUE));
    DECLARE h516b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 48, TRUE);

    DECLARE h61b CHAR(255) DEFAULT 'eMTCT Mothers 60 months';
    DECLARE h62b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 60);
    DECLARE h63b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 60, TRUE);
    DECLARE h64b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 60, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 60, TRUE));
    DECLARE h65b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 60, TRUE);
    DECLARE h66b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 60, TRUE);
    DECLARE h67b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 60, TRUE);
    DECLARE h68b INT DEFAULT h63b + h66b - h67b;
    DECLARE h69b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 60, TRUE);
    DECLARE h610b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 60, TRUE);
    DECLARE h611b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 60, TRUE);
    DECLARE h612b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 60, TRUE);
    DECLARE h613b INT DEFAULT h68b - h69b - h610b - h611b - h612b;
    DECLARE h614b DECIMAL DEFAULT (h613b / h68b) * 100;
    DECLARE h615b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 60, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 60, TRUE));
    DECLARE h616b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 60, TRUE);

    DECLARE h71b CHAR(255) DEFAULT 'eMTCT Mothers 72 months';
    DECLARE h72b CHAR(100) DEFAULT getCohortMonth(start_year, start_quarter, 72);
    DECLARE h73b INT DEFAULT getCohortAllBefore3(start_year, start_quarter, 72, TRUE);
    DECLARE h74b CHAR(20) DEFAULT CONCAT(getCohortAllBefore4b(start_year, start_quarter, 72, TRUE), '/',
                                         getCohortAllBefore4b(start_year, start_quarter, 72, TRUE));
    DECLARE h75b INT DEFAULT getCohortAllBefore5(start_year, start_quarter, 72, TRUE);
    DECLARE h76b INT DEFAULT getCohortAllBefore6(start_year, start_quarter, 72, TRUE);
    DECLARE h77b INT DEFAULT getCohortAllBefore7(start_year, start_quarter, 72, TRUE);
    DECLARE h78b INT DEFAULT h73b + h76b - h77b;
    DECLARE h79b INT DEFAULT getCohortAllBefore9(start_year, start_quarter, 72, TRUE);
    DECLARE h710b INT DEFAULT getCohortAllBefore10(start_year, start_quarter, 72, TRUE);
    DECLARE h711b INT DEFAULT getCohortAllBefore11(start_year, start_quarter, 72, TRUE);
    DECLARE h712b INT DEFAULT getCohortAllBefore12(start_year, start_quarter, 72, TRUE);
    DECLARE h713b INT DEFAULT h78b - h79b - h110b - h711b - h712b;
    DECLARE h714b DECIMAL DEFAULT (h713b / h78b) * 100;
    DECLARE h715b CHAR(20) DEFAULT CONCAT(getCohortAllBefore15b(start_year, start_quarter, 72, TRUE), '/',
                                          getCohortAllBefore15b(start_year, start_quarter, 72, TRUE));
    DECLARE h716b INT DEFAULT getCohortAllBefore16(start_year, start_quarter, 72, TRUE);

    SELECT
      h11a,
      h12a,
      h13a,
      h14a,
      h15a,
      h16a,
      h17a,
      h18a,
      h19a,
      h110a,
      h111a,
      h112a,
      h113a,
      h114a,
      h115a,
      h116a,

      h21a,
      h22a,
      h23a,
      h24a,
      h25a,
      h26a,
      h27a,
      h28a,
      h29a,
      h210a,
      h211a,
      h212a,
      h213a,
      h214a,
      h215a,
      h216a,

      h31a,
      h32a,
      h33a,
      h34a,
      h35a,
      h36a,
      h37a,
      h38a,
      h39a,
      h310a,
      h311a,
      h312a,
      h313a,
      h314a,
      h315a,
      h316a,

      h41a,
      h42a,
      h43a,
      h44a,
      h45a,
      h46a,
      h47a,
      h48a,
      h49a,
      h410a,
      h411a,
      h412a,
      h413a,
      h414a,
      h415a,
      h416a,

      h51a,
      h52a,
      h53a,
      h54a,
      h55a,
      h56a,
      h57a,
      h58a,
      h59a,
      h510a,
      h511a,
      h512a,
      h513a,
      h514a,
      h515a,
      h516a,

      h61a,
      h62a,
      h63a,
      h64a,
      h65a,
      h66a,
      h67a,
      h68a,
      h69a,
      h610a,
      h611a,
      h612a,
      h613a,
      h614a,
      h615a,
      h616a,

      h71a,
      h72a,
      h73a,
      h74a,
      h75a,
      h76a,
      h77a,
      h78a,
      h79a,
      h710a,
      h711a,
      h712a,
      h713a,
      h714a,
      h715a,
      h716a,

      h11b,
      h12b,
      h13b,
      h14b,
      h15b,
      h16b,
      h17b,
      h18b,
      h19b,
      h110b,
      h111b,
      h112b,
      h113b,
      h114b,
      h115b,
      h116b,

      h21b,
      h22b,
      h23b,
      h24b,
      h25b,
      h26b,
      h27b,
      h28b,
      h29b,
      h210b,
      h211b,
      h212b,
      h213b,
      h214b,
      h215b,
      h216b,

      h31b,
      h32b,
      h33b,
      h34b,
      h35b,
      h36b,
      h37b,
      h38b,
      h39b,
      h310b,
      h311b,
      h312b,
      h313b,
      h314b,
      h315b,
      h316b,

      h41b,
      h42b,
      h43b,
      h44b,
      h45b,
      h46b,
      h47b,
      h48b,
      h49b,
      h410b,
      h411b,
      h412b,
      h413b,
      h414b,
      h415b,
      h416b,

      h51b,
      h52b,
      h53b,
      h54b,
      h55b,
      h56b,
      h57b,
      h58b,
      h59b,
      h510b,
      h511b,
      h512b,
      h513b,
      h514b,
      h515b,
      h516b,

      h61b,
      h62b,
      h63b,
      h64b,
      h65b,
      h66b,
      h67b,
      h68b,
      h69b,
      h610b,
      h611b,
      h612b,
      h613b,
      h614b,
      h615b,
      h616b,

      h71b,
      h72b,
      h73b,
      h74b,
      h75b,
      h76b,
      h77b,
      h78b,
      h79b,
      h710b,
      h711b,
      h712b,
      h713b,
      h714b,
      h715b,
      h716b;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_adherence_Count`(AdherenceType INT, StartDate DATE, EndDate DATE)
  RETURNS INT(11)
DETERMINISTIC
  BEGIN
    DECLARE result INT DEFAULT -1;

    SELECT Adherence
    INTO result
    FROM (
           SELECT count(A.person_id) AS Adherence
           FROM (
                  SELECT
                    person_id,
                    obs_id,
                    max(obs_datetime)
                  FROM obs
                  WHERE concept_id = 90221 AND voided = 0
                        AND obs_datetime BETWEEN StartDate AND EndDate
                  GROUP BY person_id
                ) A
         ) AA;
    RETURN result;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_adherenceType_Count`(AdherenceType INT, StartDate DATE, EndDate DATE)
  RETURNS INT(11)
DETERMINISTIC
  BEGIN
    DECLARE result INT DEFAULT -1;

    SELECT Adherence
    INTO result
    FROM (
           SELECT count(A.person_id) AS Adherence
           FROM (
                  SELECT
                    person_id,
                    obs_id,
                    max(obs_datetime)
                  FROM obs
                  WHERE concept_id = 90221 AND voided = 0
                        AND obs_datetime BETWEEN StartDate AND EndDate
                  GROUP BY person_id
                ) A
             INNER JOIN obs B ON A.obs_id = B.obs_id
           WHERE b.value_coded = AdherenceType
         ) AA;
    RETURN result;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`openmrs`@`localhost` FUNCTION `getADHStatusTxt`(patient_id INT, start_date DATE, end_date DATE)
  RETURNS CHAR(1)
  CHARSET latin1
  BEGIN

    RETURN (SELECT if(value_coded = 90156, 'G',
                      if(value_coded = 90157, 'F',
                         if(value_coded = 90158, 'P', NULL))) AS adh_status
            FROM obs
            WHERE concept_id = 90221 AND person_id = patient_id AND obs_datetime BETWEEN start_date AND end_date AND
                  voided = 0
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getAncNumberTxt`(`encounterid` INTEGER)
  RETURNS CHAR(15)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT value_text
            FROM obs
            WHERE concept_id = 99026
                  AND encounterid = encounter_id
                  AND voided = 0
            LIMIT 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getAppKeepTxt`(`encounterid` INTEGER)
  RETURNS CHAR(3)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_numeric = 1, "Y", "N") AS app_keep
            FROM obs
            WHERE concept_id = 90069
                  AND voided = 0
                  AND encounterid = encounter_id
            LIMIT 1

    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtBaseTransferDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN
    (SELECT value_datetime
     FROM obs
     WHERE concept_id IN (99161, 99160)
           AND person_id = personid
           AND voided = 0
     LIMIT 1);


  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtEligibilityAndReadyDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime AS eligible_and_ready_date
            FROM obs
            WHERE concept_id = 90299
                  AND voided = 0
                  AND personid = person_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtEligibilityDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime AS eligible_date
            FROM obs
            WHERE concept_id = 90297
                  AND voided = 0
                  AND personid = person_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtEligibilityReasonTxt`(`personid` INTEGER)
  RETURNS CHAR(15)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT if(concept_id = 99083, "Clinical",
                      if(concept_id = 99082 AND value_numeric >= 0, concat("CD4: ", value_numeric),
                         if(concept_id = 99123, "Presumptive",
                            if(concept_id = 99149, "PCR-Infant", ''
                            )))) AS e_reason
            FROM obs
            WHERE concept_id IN (99123, 99149, 99083, 99082)
                  AND voided = 0
                  AND personid = person_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtRegCoded`(`encounterid` INTEGER)
  RETURNS CHAR(12)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT value_coded AS freg
            FROM obs
            WHERE concept_id IN (99061, 90315)
                  AND voided = 0
                  AND encounterid = encounter_id
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtRegCoded2`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT value_coded AS freg
            FROM obs
            WHERE concept_id IN (99061, 90315)
                  AND voided = 0
                  AND personid = person_id
                  AND obsdatetime = obs_datetime
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtRegTxt`(`encounterid` INTEGER)
  RETURNS CHAR(6)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT min(if(value_coded = 99015, '1a',
                          if(value_coded = 99016, '1b',
                             if(value_coded = 99005, '1c',
                                if(value_coded = 99006, '1d',
                                   if(value_coded = 99039, '1e',
                                      if(value_coded = 99040, '1f',
                                         if(value_coded = 99041, '1g',
                                            if(value_coded = 99042, '1h',
                                               if(value_coded = 99007, '2a2',
                                                  if(value_coded = 99008, '2a4',
                                                     if(value_coded = 99044, '2b',
                                                        if(value_coded = 99043, '2c',
                                                           if(value_coded = 99282, '2d2',
                                                              if(value_coded = 99283, '2d4',
                                                                 if(value_coded = 99046, '2e',
                                                                    if(value_coded = 99017, '5a',
                                                                       if(value_coded = 99018, '5b',
                                                                          if(value_coded = 99045, '5f',
                                                                             if(value_coded = 99284, '5g',
                                                                                if(value_coded = 99285, '5h',
                                                                                   if(value_coded = 99286, '5j',
                                                                                      if(value_coded = 90002, 'othr', ''
                                                                                      ))))))))))))))))))))))) AS freg
            FROM obs
            WHERE concept_id IN (99061, 90315) AND voided = 0
                  AND encounterid = encounter_id
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtRegTxt2`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS CHAR(10)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT min(if(value_coded = 99015, '1a',
                          if(value_coded = 99016, '1b',
                             if(value_coded = 99005, '1c',
                                if(value_coded = 99006, '1d',
                                   if(value_coded = 99039, '1e',
                                      if(value_coded = 99040, '1f',
                                         if(value_coded = 99041, '1g',
                                            if(value_coded = 99042, '1h',
                                               if(value_coded = 99007, '2a2',
                                                  if(value_coded = 99008, '2a4',
                                                     if(value_coded = 99044, '2b',
                                                        if(value_coded = 99043, '2c',
                                                           if(value_coded = 99282, '2d2',
                                                              if(value_coded = 99283, '2d4',
                                                                 if(value_coded = 99046, '2e',
                                                                    if(value_coded = 99017, '5a',
                                                                       if(value_coded = 99018, '5b',
                                                                          if(value_coded = 99045, '5f',
                                                                             if(value_coded = 99284, '5g',
                                                                                if(value_coded = 99285, '5h',
                                                                                   if(value_coded = 99286, '5j',
                                                                                      if(value_coded = 90002, 'othr', ''
                                                                                      ))))))))))))))))))))))) AS freg
            FROM obs
            WHERE concept_id IN (99061, 90315) AND voided = 0
                  AND personid = person_id
                  AND obsdatetime = obs_datetime
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtRestartDate`(`personid` INTEGER, `encdt` CHAR(6))
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (
      SELECT value_datetime
      FROM obs
      WHERE concept_id = 99085
            AND voided = 0
            AND personid = person_id
            AND concat(year(value_datetime), month(value_datetime)) = encdt
      LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtStartDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN
    (SELECT value_datetime
     FROM obs
     WHERE concept_id IN (99160, 99161)
           AND personid = person_id
           AND voided = 0
     ORDER BY value_datetime ASC
     LIMIT 1);


  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtStartDate2`(`personid` INTEGER, `reportdt` DATE)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN
    (SELECT value_datetime
     FROM obs
     WHERE concept_id IN (99160, 99161)
           AND person_id = personid
           AND value_datetime <= reportdt
           AND voided = 0
     ORDER BY value_datetime ASC
     LIMIT 1);


  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtStartRegTxt`(`personid` INTEGER)
  RETURNS CHAR(10)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT min(if(value_coded = 99015, '1a',
                          if(value_coded = 99016, '1b',
                             if(value_coded = 99005, '1c',
                                if(value_coded = 99006, '1d',
                                   if(value_coded = 99039, '1e',
                                      if(value_coded = 99040, '1f',
                                         if(value_coded = 99041, '1g',
                                            if(value_coded = 99042, '1h',
                                               if(value_coded = 99007, '2a2',
                                                  if(value_coded = 99008, '2a4',
                                                     if(value_coded = 99044, '2b',
                                                        if(value_coded = 99043, '2c',
                                                           if(value_coded = 99282, '2d2',
                                                              if(value_coded = 99283, '2d4',
                                                                 if(value_coded = 99046, '2e',
                                                                    if(value_coded = 99017, '5a',
                                                                       if(value_coded = 99018, '5b',
                                                                          if(value_coded = 99045, '5f',
                                                                             if(value_coded = 99284, '5g',
                                                                                if(value_coded = 99285, '5h',
                                                                                   if(value_coded = 99286, '5j',
                                                                                      if(value_coded = 90002, 'othr', ''
                                                                                      ))))))))))))))))))))))) AS freg
            FROM obs
            WHERE concept_id IN (99061, 99064) AND voided = 0
                  AND personid = person_id
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtStopDate`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN
    (
      SELECT value_datetime
      FROM obs
      WHERE
        concept_id = 99084 AND voided = 0
        AND personid = person_id
        AND obsdatetime = value_datetime
      LIMIT 1);


  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtStopDate1`(`personid` INTEGER, `encdt` CHAR(6))
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (
      SELECT value_datetime
      FROM obs
      WHERE concept_id = 99084
            AND voided = 0
            AND personid = person_id
            AND
            encdt = concat(year(value_datetime), month(value_datetime))
      LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getArtStopReasonTxt`(`personid` INTEGER, `encdt` CHAR)
  RETURNS CHAR(2)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (
      SELECT if(a.value_coded = 90040, "1",
                if(a.value_coded = 90041, "2",
                   if(a.value_coded = 90046, "3",
                      if(a.value_coded = 90049, "4",
                         if(a.value_coded = 90050, "5",
                            if(a.value_coded = 90045, "6",
                               if(a.value_coded = 90051, "7",
                                  if(a.value_coded = 90052, "8",
                                     if(a.value_coded = 90066, "9",
                                        if(a.value_coded = 90002, "10",
                                           if(a.value_coded = 99289, "11", ''))))))))))) stop_r


      FROM obs a, obs b
      WHERE b.concept_id = 99084
            AND a.voided = 0
            AND b.voided = 0
            AND a.concept_id = 1252
            AND a.obs_group_id = b.obs_group_id
            AND personid = b.person_id
            AND encdt = concat(year(b.value_datetime), month(b.value_datetime))
      LIMIT 1

    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getBaseWeightValue`(`personid` INTEGER, `artstartdt` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(concept_id = 99069, value_numeric,
                      if(concept_id = 90236 AND obs_datetime = artstartdt, value_numeric, NULL)) wt
            FROM obs
            WHERE concept_id IN (99069, 90236)
                  AND personid = person_id
                  AND voided = 0
            HAVING wt IS NOT NULL
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCareEntryTxt`(`personid` INT)
  RETURNS CHAR(15)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_coded = 90012, "eMTCT",
                      if(value_coded = 90013, "Outpatient",
                         if(value_coded = 99593, "YCC",
                            if(value_coded = 90016, "TB",
                               if(value_coded = 90015, "STI",
                                  if(value_coded = 90018, "Inpatient",
                                     if(value_coded = 90019, "Outreach",
                                        if(value_coded = 99087, "Exposed Infant",
                                           if(value_coded = 99002, "Other",
                                              if(value_coded = 99610, "SMC", '')))))))))) AS care_entry
            FROM obs
            WHERE concept_id = 90200
                  AND voided = 0
                  AND personid = person_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCd4BaseValue`(`personid` INTEGER, `artstartdt` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(concept_id = 99071, value_numeric,
                      if(concept_id = 5497 AND datediff(artstartdt, obs_datetime) BETWEEN 0 AND 31, value_numeric,
                         NULL)) AS bcd4
            FROM obs
            WHERE concept_id IN (99071, 5497)
                  AND voided = 0
                  AND personid = person_id
                  AND artstartdt = artstartdt
            HAVING bcd4 IS NOT NULL
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_CD4_count`(StartDate VARCHAR(12), EndDate VARCHAR(12), Patient_ID INT)
  RETURNS VARCHAR(10)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT IFNULL(CD4Count, CD4Percentage) AS CD4_Count
    FROM (
           SELECT
             (SELECT value_numeric
              FROM obs
              WHERE concept_id = 5497 AND person_id = LatestEncounter.patient_id AND
                    encounter_id = LatestEncounter.encounter_id) AS CD4Count,
             (SELECT value_numeric
              FROM obs
              WHERE concept_id = 730 AND person_id = LatestEncounter.patient_id AND
                    encounter_id = LatestEncounter.encounter_id) AS CD4Percentage
           FROM (
                  SELECT
                    patient_id,
                    max(encounter_datetime),
                    encounter_id
                  FROM encounter
                  WHERE
                    encounter_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
                    AND patient_id = Patient_ID AND form_id = 31
                  GROUP BY patient_id
                ) LatestEncounter
         ) CD4
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCd4SevereBaseValue`(`personid` INTEGER, `artstartdt` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_coded = 99150 AND datediff(artstartdt, obs_datetime) BETWEEN 0 AND 31, 0, NULL) AS bsevere
            FROM obs
            WHERE concept_id = 99151
                  AND voided = 0
                  AND personid = person_id
                  AND artstartdt = artstartdt
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCD4Value`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT value_numeric
            FROM obs
            WHERE concept_id IN
                  (99071, 5497)
                  AND voided = 0
                  AND obsdatetime = obs_datetime
                  AND personid = person_id
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCodedDeathDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime
            FROM obs
            WHERE concept_id = 90272 AND voided = 0
                  AND personid = person_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore10`(start_year INT, start_quarter INT, months_before INT,
                                                                   only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;

    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99112
                  AND o.value_coded = 90003
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);
    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99112
                  AND o.value_coded = 90003
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);
    END IF;
    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore11`(start_year INT, start_quarter INT, months_before INT,
                                                                   only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        (SELECT
           patient_id,
           MAX(value_datetime) value_datetime
         FROM
           encounter
           JOIN obs USING (encounter_id)
         WHERE
           encounter.voided = 0 AND form_id = 27
           AND encounter.voided = 0
           AND obs.concept_id = 5096
           AND obs.voided = 0
           AND encounter.patient_id IN (SELECT patient_id
                                        FROM
                                          encounter ei
                                          INNER JOIN obs oi ON (ei.encounter_id = oi.encounter_id
                                                                AND oi.voided = 0
                                                                AND oi.concept_id = 99161))
           AND encounter_datetime BETWEEN MAKEDATE(start_year - 1, 1) + INTERVAL start_quarter - 1 QUARTER -
                                          INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY
         GROUP BY patient_id) MaxReturnDate
      WHERE
        value_datetime <= MAKEDATE(start_year, 1) + INTERVAL 2 - 3 QUARTER - INTERVAL 1 DAY
        AND patient_id NOT IN (SELECT patient_id
                               FROM
                                 encounter
                                 JOIN
                                 obs USING (encounter_id)
                               WHERE
                                 obs.concept_id = 90306
                                 AND obs.value_coded = 90003
                                 AND obs.voided = 0)
        AND patient_id NOT IN (SELECT patient_id
                               FROM
                                 encounter
                                 JOIN
                                 obs USING (encounter_id)
                               WHERE
                                 obs.concept_id = 99112
                                 AND obs.value_coded = 90003
                                 AND obs.voided = 0)
        AND patient_id IN (SELECT patient_id
                           FROM
                             encounter
                             JOIN
                             obs USING (encounter_id)
                           WHERE
                             form_id = 28 AND obs.concept_id = 99161
                             AND obs.voided = 0);
    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        (SELECT
           patient_id,
           MAX(value_datetime) value_datetime
         FROM
           encounter
           JOIN obs USING (encounter_id)
         WHERE
           encounter.voided = 0 AND form_id = 27
           AND encounter.voided = 0
           AND obs.concept_id = 5096
           AND obs.voided = 0
           AND FIND_IN_SET(encounter.patient_id, only_preg)
           AND encounter.patient_id IN (SELECT patient_id
                                        FROM
                                          encounter ei
                                          INNER JOIN obs oi ON (ei.encounter_id = oi.encounter_id
                                                                AND oi.voided = 0
                                                                AND oi.concept_id = 99161))
           AND encounter_datetime BETWEEN MAKEDATE(start_year - 1, 1) + INTERVAL start_quarter - 1 QUARTER -
                                          INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY
         GROUP BY patient_id) MaxReturnDate
      WHERE
        value_datetime <= MAKEDATE(start_year, 1) + INTERVAL 2 - 3 QUARTER - INTERVAL 1 DAY
        AND patient_id NOT IN (SELECT patient_id
                               FROM
                                 encounter
                                 JOIN
                                 obs USING (encounter_id)
                               WHERE
                                 obs.concept_id = 90306
                                 AND obs.value_coded = 90003
                                 AND obs.voided = 0)
        AND patient_id NOT IN (SELECT patient_id
                               FROM
                                 encounter
                                 JOIN
                                 obs USING (encounter_id)
                               WHERE
                                 obs.concept_id = 99112
                                 AND obs.value_coded = 90003
                                 AND obs.voided = 0)
        AND patient_id IN (SELECT patient_id
                           FROM
                             encounter
                             JOIN
                             obs USING (encounter_id)
                           WHERE
                             form_id = 28 AND obs.concept_id = 99161
                             AND obs.voided = 0);
    END IF;

    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore12`(start_year INT, start_quarter INT, months_before INT,
                                                                   only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99132
                  AND o.value_coded = 99133
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99132
                  AND o.value_coded = 99133
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);


    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore15a`(start_year    INT, start_quarter INT,
                                                                    months_before INT, only_preg TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id
                        AND e.voided = 0)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 5497
                  AND o.value_numeric < 500
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id
                        AND e.voided = 0
                        AND FIND_IN_SET(e.patient_id, only_preg))
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 5497
                  AND o.value_numeric < 500
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);


    END IF;

    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore15b`(start_year    INT, start_quarter INT,
                                                                    months_before INT, only_preg TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id
                        AND e.voided = 0)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 5497
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id
                        AND e.voided = 0
                        AND FIND_IN_SET(e.patient_id, only_preg))
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 5497
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);


    END IF;

    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore16`(start_year INT, start_quarter INT, months_before INT,
                                                                   only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT AVG(t1.value_numeric) AS median_val
      INTO number_on_cohort
      FROM
        (SELECT
           @rownum := @rownum + 1 AS `row_number`,
           d.value_numeric
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
           , (SELECT @rownum := 0) r
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 5497
           AND e.patient_id IN (SELECT patient_id
                                FROM
                                  encounter ei
                                  INNER JOIN obs oi ON (ei.encounter_id = oi.encounter_id
                                                        AND oi.voided = 0
                                                        AND oi.concept_id = 99161))
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY
         ORDER BY d.value_numeric) AS t1,
        (SELECT COUNT(*) AS total_rows
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 5497
           AND e.patient_id IN (SELECT patient_id
                                FROM
                                  encounter ei
                                  INNER JOIN obs oi ON (ei.encounter_id = oi.encounter_id
                                                        AND oi.voided = 0
                                                        AND oi.concept_id = 99161))
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY) AS t2
      WHERE
        t1.row_number IN (FLOOR((total_rows + 1) / 2), FLOOR((total_rows + 2) / 2));
    ELSE
      SELECT AVG(t1.value_numeric) AS median_val
      INTO number_on_cohort
      FROM
        (SELECT
           @rownum := @rownum + 1 AS `row_number`,
           d.value_numeric
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
           , (SELECT @rownum := 0) r
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 5497
           AND e.patient_id IN (SELECT patient_id
                                FROM
                                  encounter ei
                                  INNER JOIN obs oi ON (ei.encounter_id = oi.encounter_id
                                                        AND oi.voided = 0
                                                        AND oi.concept_id = 99161))
           AND FIND_IN_SET(e.patient_id, only_preg)
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY
         ORDER BY d.value_numeric) AS t1,
        (SELECT COUNT(*) AS total_rows
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 5497
           AND e.patient_id IN (SELECT patient_id
                                FROM
                                  encounter ei
                                  INNER JOIN obs oi ON (ei.encounter_id = oi.encounter_id
                                                        AND oi.voided = 0
                                                        AND oi.concept_id = 99161)
                                                       AND FIND_IN_SET(ei.patient_id, only_preg))
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY) AS t2
      WHERE
        t1.row_number IN (FLOOR((total_rows + 1) / 2), FLOOR((total_rows + 2) / 2));
    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore3`(start_year INT, start_quarter INT, month_before INT,
                                                                  only_preg  TEXT)
  RETURNS INT(11)
  BEGIN

    DECLARE income_level INT;
    IF NULLIF(only_preg, '') IS NULL
    THEN

      SELECT COUNT(o.concept_id)
      INTO income_level
      FROM
        encounter e INNER JOIN obs o ON (
        e.encounter_id = o.encounter_id AND
        concept_id = 99161
        AND o.value_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                     INTERVAL month_before MONTH AND
        MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL month_before MONTH - INTERVAL 1 DAY
        AND o.voided = 0);
    ELSE

      SELECT COUNT(o.concept_id)
      INTO income_level
      FROM
        encounter e INNER JOIN obs o ON (
        e.encounter_id = o.encounter_id
        AND o.concept_id = 99161
        AND FIND_IN_SET(e.patient_id, only_preg)
        AND o.value_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                     INTERVAL month_before MONTH AND
        MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL month_before MONTH - INTERVAL 1 DAY
        AND o.voided = 0);
    END IF;

    RETURN income_level;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore4a`(start_year INT, start_quarter INT, months_before INT,
                                                                   only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;

    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id AND e.voided = 0)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99071
                  AND o.value_numeric < 500
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH -
                  INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id AND e.voided = 0)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99071
                  AND o.value_numeric < 500
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH -
                  INTERVAL 1 DAY);


    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore4b`(start_year INT, start_quarter INT, months_before INT,
                                                                   only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;

    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id AND e.voided = 0)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99071
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH -
                  INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        person pp
        INNER JOIN
        patient p ON (pp.person_id = p.patient_id
                      AND p.voided = 0
                      AND TIMESTAMPDIFF(YEAR,
                                        pp.birthdate,
                                        CURDATE()) >= 5)
        INNER JOIN
        encounter e ON (e.patient_id = p.patient_id AND e.voided = 0)
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99071
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH -
                  INTERVAL 1 DAY);


    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore5`(start_year INT, start_quarter INT, months_before INT,
                                                                  only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT AVG(t1.value_numeric) AS median_val
      INTO number_on_cohort
      FROM
        (SELECT
           @rownum := @rownum + 1 AS `row_number`,
           d.value_numeric
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
           , (SELECT @rownum := 0) r
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 99071
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH - INTERVAL 1 DAY
         ORDER BY d.value_numeric) AS t1,
        (SELECT COUNT(*) AS total_rows
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 99071
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH -
           INTERVAL 1 DAY) AS t2
      WHERE
        t1.row_number IN (FLOOR((total_rows + 1) / 2), FLOOR((total_rows + 2) / 2));
    ELSE
      SELECT AVG(t1.value_numeric) AS median_val
      INTO number_on_cohort
      FROM
        (SELECT
           @rownum := @rownum + 1 AS `row_number`,
           d.value_numeric
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
           , (SELECT @rownum := 0) r
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 99071
           AND FIND_IN_SET(e.patient_id, only_preg)
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH - INTERVAL 1 DAY
         ORDER BY d.value_numeric) AS t1,
        (SELECT COUNT(*) AS total_rows
         FROM
           obs d
           INNER JOIN encounter e ON (e.encounter_id = d.encounter_id)
         WHERE
           d.value_numeric > 0
           AND d.concept_id = 99071
           AND FIND_IN_SET(e.patient_id, only_preg)
           AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                            INTERVAL months_before MONTH AND
           MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH -
           INTERVAL 1 DAY) AS t2
      WHERE
        t1.row_number IN (FLOOR((total_rows + 1) / 2), FLOOR((total_rows + 2) / 2));

    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore6`(start_year INT, start_quarter INT, months_before INT,
                                                                  only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;

    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99110
                  AND o.value_coded = 90003
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99110
                  AND o.value_coded = 90003
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);


    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore7`(start_year INT, start_quarter INT, months_before INT,
                                                                  only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;


    IF NULLIF(only_preg, '') IS NULL
    THEN

      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99165
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);


    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99165
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);


    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCohortAllBefore9`(start_year INT, start_quarter INT, months_before INT,
                                                                  only_preg  TEXT)
  RETURNS INT(11)
  BEGIN
    DECLARE number_on_cohort INT;

    IF NULLIF(only_preg, '') IS NULL
    THEN
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99132
                  AND o.value_coded = 1363
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);

    ELSE
      SELECT COUNT(*)
      INTO number_on_cohort
      FROM
        encounter e
        INNER JOIN
        obs o ON (e.encounter_id = o.encounter_id
                  AND o.voided = 0
                  AND o.concept_id = 99132
                  AND o.value_coded = 1363
                  AND e.patient_id IN (SELECT patient_id
                                       FROM
                                         encounter ei
                                         INNER JOIN
                                         obs oi ON (ei.encounter_id = oi.encounter_id
                                                    AND oi.voided = 0
                                                    AND oi.concept_id = 99161))
                  AND FIND_IN_SET(e.patient_id, only_preg)
                  AND e.encounter_datetime BETWEEN MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                                   INTERVAL months_before MONTH AND
                  MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL 1 DAY);

    END IF;


    RETURN number_on_cohort;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`openmrs`@`localhost` FUNCTION `getCohortMonth`(start_year INT, start_quarter INT, months_before INT)
  RETURNS CHAR(30)
  CHARSET latin1
  BEGIN
    DECLARE end_date DATE DEFAULT
      MAKEDATE(start_year, 1) + INTERVAL start_quarter QUARTER - INTERVAL months_before MONTH - INTERVAL 1 DAY;
    DECLARE start_date DATE DEFAULT MAKEDATE(start_year, 1) + INTERVAL start_quarter - 1 QUARTER -
                                    INTERVAL months_before MONTH;


    RETURN CONCAT(MONTHNAME(start_date), '-', MONTHNAME(end_date), ' ', YEAR(end_date));
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_cpt_receipt_status`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                                     Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT IF(NumberOfCPTDrugsRcpt < 1, 'N', 'Y') AS CPTReceiptStatus
    FROM (
           SELECT
             person_id,
             count(obs_id) NumberOfCPTDrugsRcpt
           FROM obs
           WHERE concept_id IN (99037, 99033) AND voided = 0
                 AND person_id = Patient_ID AND
                 obs_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
           GROUP BY person_id
         ) CPTDrugsRcptFrequency
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCptStartDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT min(obs_datetime) cpt_start
            FROM obs
            WHERE concept_id IN (99033, 99037) AND personid = person_id AND voided = 0
            GROUP BY person_id);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getCptStatusTxt`(`encounterid` INTEGER)
  RETURNS CHAR(3)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_coded IS NOT NULL, "N", if(value_numeric = 0, "N", if(value_numeric > 0, "Y", ""))) AS cpt
            FROM obs
            WHERE concept_id IN (90220, 99037, 99033) AND voided = 0
                  AND encounterid = encounter_id
            HAVING cpt != ""
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getDeathDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT if(a.death_date IS NULL, b.value_datetime, a.death_date) AS deathDate
            FROM person a
              LEFT JOIN

              (SELECT
                 person_id,
                 value_datetime
               FROM obs
               WHERE concept_id = 90272 AND voided = 0) b

                ON a.person_id = b.person_id
            WHERE a.voided = 0
                  AND a.person_id = personid
            HAVING deathDate IS NOT NULL
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_death_status`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                               Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN (SELECT CONCAT('DEAD: ', CAST(date_format(DeathDate, '%d/%m/%Y') AS CHAR(10))) AS DeathStatus
          FROM (
                 SELECT
                   person_Id,
                   max(obs_datetime) DeathDate
                 FROM obs
                 WHERE
                   obs_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
                   AND concept_id = 99112 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0
                 GROUP BY person_Id
               ) RecentDeath
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEddDate`(`encounterid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime
            FROM obs
            WHERE concept_id = 5596
                  AND encounterid = encounter_id
                  AND voided = 0
            LIMIT 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEddEncounterId`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT encounter_id
      FROM obs a
      WHERE concept_id = 5596
            AND personid = person_id
            AND voided = 0
      GROUP BY person_id, concat(year(value_datetime), month(value_datetime))
      LIMIT 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEddEncounterId2`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT encounter_id
      FROM obs a
      WHERE concept_id = 5596
            AND personid = person_id
            AND voided = 0
      GROUP BY person_id, concat(year(value_datetime), month(value_datetime))
      LIMIT 1, 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEddEncounterId3`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT encounter_id
      FROM obs a
      WHERE concept_id = 5596
            AND personid = person_id
            AND voided = 0
      GROUP BY person_id, concat(year(value_datetime), month(value_datetime))
      LIMIT 2, 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEddEncounterId4`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT encounter_id
      FROM obs a
      WHERE concept_id = 5596
            AND personid = person_id
            AND voided = 0
      GROUP BY person_id, concat(year(value_datetime))
      LIMIT 3, 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEncounterId`(`patientid`       INTEGER, `encounter_year` INTEGER,
                                                             `encounter_month` INTEGER)
  RETURNS INT(11)
  BEGIN
    RETURN (SELECT MAX(encounter_id)
            FROM encounter
            WHERE patientid = patient_id AND EXTRACT(YEAR_MONTH FROM encounter_datetime) = EXTRACT(YEAR_MONTH FROM (
              MAKEDATE(encounter_year, 1) + INTERVAL encounter_month MONTH - INTERVAL 1 DAY)) AND voided = 0
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEncounterId2`(`patientid`         INTEGER, `encounter_year` INTEGER,
                                                              `encounter_quarter` INTEGER)
  RETURNS INT(11)
  BEGIN
    RETURN (SELECT MAX(encounter_id)
            FROM encounter
            WHERE patientid = patient_id AND YEAR(encounter_datetime) = encounter_year AND
                  QUARTER(encounter_datetime) = encounter_quarter AND voided = 0
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getEnrolDate`(`personid` INT)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (
      SELECT encounter_datetime AS enroldt
      FROM encounter
      WHERE encounter_type = 1
            AND voided = 0
            AND personid = patient_id
      LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getFirstArtStopDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN
    (
      SELECT value_datetime
      FROM obs
      WHERE
        concept_id = 99084 AND voided = 0
        AND personid = person_id
      LIMIT 1);


  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getFlucStartDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT min(obs_datetime) fluc_start
            FROM obs
            WHERE concept_id = 1193 AND value_coded = 747
                  AND personid = person_id AND voided = 0
            GROUP BY person_id);

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_followup_status`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                                  Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT IFNULL((SELECT get_death_status(StartDate, EndDate, Patient_ID)),
                  IFNULL((get_transfer_status(StartDate, EndDate, Patient_ID)),
                         IFNULL((get_lost_status(StartDate, EndDate, Patient_ID)),
                                IFNULL((get_seen_status(StartDate, EndDate, Patient_ID)),
                                       IFNULL((get_scheduled_visits(StartDate, EndDate, Patient_ID)),
                                              NULL
                                       )
                                )
                         )
                  )
           ) AS FollowUpStatus
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_followup_status2`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                                   Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET utf8
  BEGIN

    RETURN CONCAT(get_death_status(StartDate, EndDate, Patient_ID), get_transfer_status(StartDate, EndDate, Patient_ID),
                  get_lost_status(StartDate, EndDate, Patient_ID), get_seen_status(StartDate, EndDate, Patient_ID),
                  get_scheduled_visits(StartDate, EndDate, Patient_ID));
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getFUARTStatus`(Patient_ID INTEGER, start_date DATE, end_date DATE)
  RETURNS CHAR(1)
  CHARSET utf8
  BEGIN

    DECLARE times_seen_in_quarter INT DEFAULT 0;
    DECLARE number_of_visits_in_quarter INT DEFAULT 0;
    DECLARE stopped INT DEFAULT 0;
    DECLARE lost INT DEFAULT 0;
    DECLARE restart INT DEFAULT 0;
    DECLARE transfer_out_date DATE;
    DECLARE death_date DATE;

    SELECT max(obs_datetime)
    INTO death_date
    FROM obs
    WHERE obs_datetime BETWEEN start_date AND end_date
          AND concept_id = 99112 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0
    GROUP BY person_Id;
    IF death_date IS NOT NULL
    THEN
      RETURN '1';
    ELSE
      SELECT max(obs_datetime)
      INTO transfer_out_date
      FROM obs
      WHERE obs_datetime BETWEEN start_date AND end_date
            AND concept_id = 90306 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0;

      IF transfer_out_date IS NOT NULL
      THEN
        RETURN '5';
      ELSE
        SELECT COUNT(obs_id)
        INTO stopped
        FROM obs
        WHERE obs_datetime BETWEEN start_date AND end_date
              AND concept_id = 99132 AND value_coded = 1363 AND person_Id = Patient_ID AND voided = 0;

        IF stopped > 0
        THEN
          RETURN '2';
        ELSE
          SELECT COUNT(obs_id)
          INTO lost
          FROM obs
          WHERE obs_datetime BETWEEN start_date AND end_date
                AND concept_id = 99132 AND value_coded = 99133 AND person_Id = Patient_ID AND voided = 0;

          IF lost > 0
          THEN
            RETURN '3';
          ELSE
            SELECT max(obs_datetime)
            INTO restart
            FROM obs
            WHERE obs_datetime BETWEEN start_date AND end_date
                  AND concept_id = 99085 AND value_datetime BETWEEN start_date AND end_date AND person_Id = Patient_ID
                  AND voided = 0;

            IF restart IS NOT NULL
            THEN
              RETURN '6';
            ELSE
              SELECT COUNT(encounter_id)
              INTO times_seen_in_quarter
              FROM encounter
              WHERE encounter_datetime BETWEEN start_date AND end_date
                    AND encounter_type IN (1, 2)
                    AND patient_id = Patient_ID AND voided = 0;

              SELECT COUNT(obs_id)
              INTO number_of_visits_in_quarter
              FROM obs
              WHERE value_datetime BETWEEN start_date AND end_date
                    AND patient_id = Patient_ID AND concept_id = 5096 AND Voided = 0;
              IF times_seen_in_quarter = 0 AND number_of_visits_in_quarter > 0
              THEN
                RETURN '4';
              ELSE
                RETURN '';
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;

    END IF;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getFunctionalStatusTxt`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS CHAR(5)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_coded = 90037, "Amb", if(value_coded = 90038, "Work", "Bed")) AS f_status
            FROM obs
            WHERE concept_id = 90235
                  AND voided = 0
                  AND personid = person_id
                  AND obsdatetime = obs_datetime
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getFUStatus`(Patient_ID INTEGER, start_date DATE, end_date DATE)
  RETURNS CHAR(30)
  CHARSET utf8
  BEGIN

    DECLARE times_seen_in_quarter INT DEFAULT 0;
    DECLARE number_of_visits_in_quarter INT DEFAULT 0;
    DECLARE transfer_out_date DATE;
    DECLARE death_date DATE;

    SELECT max(obs_datetime)
    INTO death_date
    FROM obs
    WHERE obs_datetime BETWEEN start_date AND end_date
          AND concept_id = 99112 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0
    GROUP BY person_Id;
    IF death_date IS NOT NULL
    THEN
      RETURN 'DEAD';
    ELSE
      SELECT max(obs_datetime)
      INTO transfer_out_date
      FROM obs
      WHERE obs_datetime BETWEEN start_date AND end_date
            AND concept_id = 90306 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0;

      IF transfer_out_date IS NOT NULL
      THEN
        RETURN 'TO';
      ELSE
        SELECT COUNT(encounter_id)
        INTO times_seen_in_quarter
        FROM encounter
        WHERE encounter_datetime BETWEEN start_date AND end_date
              AND form_id = 27
              AND patient_id = Patient_ID AND voided = 0;
        IF times_seen_in_quarter > 0
        THEN
          RETURN 'V';
        ELSE
          SELECT COUNT(obs_id)
          INTO number_of_visits_in_quarter
          FROM obs
          WHERE value_datetime BETWEEN start_date AND end_date AND QUARTER(value_datetime) < QUARTER(end_date)
                AND patient_id = Patient_ID AND concept_id = 5096 AND voided = 0;

          IF number_of_visits_in_quarter > 0
          THEN
            RETURN '->';
          ELSEIF times_seen_in_quarter = 0 AND number_of_visits_in_quarter > 0
            THEN
              RETURN 'LOST';
          ELSE
            RETURN '';
          END IF;
        END IF;
      END IF;

    END IF;
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getINHStartDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT min(obs_datetime) cpt_start
            FROM obs
            WHERE concept_id IN (99604, 99605) AND personid = person_id AND voided = 0
            GROUP BY person_id);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getLastCd4SevereValue`(`personid` INTEGER, `reportdt` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_coded = 99150, 1, 0) AS severe
            FROM obs
            WHERE concept_id = 99151
                  AND voided = 0
                  AND personid = person_id
                  AND obs_datetime <= reportdt
            ORDER BY person_id, obs_datetime DESC
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getLastCd4Value`(`personid` INTEGER, `reportdt` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT value_numeric
            FROM obs
            WHERE concept_id IN (99071, 5497)
                  AND voided = 0
                  AND personid = person_id
                  AND obs_datetime <= reportdt
            ORDER BY person_id, obs_datetime DESC
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getLastEncounterDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN
    RETURN (SELECT encounter_datetime
            FROM encounter
            WHERE encounter_type IN (1, 2) AND patient_id = personid AND voided = 0
            ORDER BY encounter_datetime DESC
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getLastVisitDate`(`personid` INTEGER, `reportdt` DATE)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT date(max(encounter_datetime))
            FROM encounter
            WHERE encounter_type IN (1, 2) AND voided = 0 AND personid = patient_id
                  AND if(year(encounter_datetime) < year(reportdt), 1, if(
                (year(encounter_datetime) = year(reportdt) AND month(encounter_datetime) <= month(reportdt)), 1, 0)) = 1
            GROUP BY patient_id);


  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_lost_status`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                              Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT 'LOST' AS LostStatus
    FROM (
           SELECT
             person_Id,
             max(obs_datetime) DeathDate
           FROM obs
           WHERE obs_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
                 AND concept_id = 5240 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0
                 AND person_id NOT IN (
             SELECT person_Id
             FROM (
                    SELECT
                      person_Id,
                      max(obs_datetime) DeathDate
                    FROM obs
                    WHERE concept_id IN (99112, 90306) AND value_numeric = 1 AND voided = 0
                    GROUP BY person_Id) AA)
           GROUP BY person_Id
         ) RecentLostStatus

  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getMonthCD4Value`(`personid` INTEGER, `monthyr` CHAR(6))
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT value_numeric
            FROM obs
            WHERE concept_id IN
                  (99071, 5497)
                  AND voided = 0
                  AND personid = person_id
                  AND monthyr = concat(year(obs_datetime), month(obs_datetime))
            LIMIT 1

    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getMonthsOnCurrent`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT period_diff(date_format(now(), '%Y%m'), date_format(obs_datetime, '%Y%m'))
      FROM obs
      WHERE concept_id = 1255
            AND value_coded IN (1590, 1587)
            AND voided = 0
            AND personid = person_id
      ORDER BY obs_datetime DESC
      LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getMonthsSinceStart`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT period_diff(date_format(now(), '%Y%m'), date_format(obs_datetime, '%Y%m')) AS mnths
      FROM obs
      WHERE concept_id = 1255
            AND value_coded IN (1256, 1585)
            AND voided = 0
            AND personid = person_id
      ORDER BY obs_datetime DESC
      LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getNumberDrugEncounter`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (

      SELECT count(DISTINCT value_coded) AS number_summary
      FROM obs a

        INNER JOIN

        (SELECT encounter_id
         FROM encounter
         WHERE encounter_type = 2
               AND voided = 0) b
          ON a.encounter_id = b.encounter_id

      WHERE concept_id IN (90061, 99064, 90315)
            AND a.voided = 0
            AND personid = person_id
      GROUP BY person_id
      LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getNumberDrugSummary`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (

      SELECT count(DISTINCT value_coded) AS number_summary
      FROM obs a

        INNER JOIN

        (SELECT encounter_id
         FROM encounter
         WHERE encounter_type = 1
               AND voided = 0) b
          ON a.encounter_id = b.encounter_id

      WHERE concept_id IN (90061, 99064, 90315)
            AND a.voided = 0
            AND personid = person_id
      GROUP BY person_id
      LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`openmrs`@`localhost` FUNCTION `getNutritionalStatus`(Patient_ID INT, start_date DATE, end_date DATE)
  RETURNS CHAR(10)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT CASE value_coded
           WHEN 99271
             THEN 'MAM'
           WHEN 99272
             THEN 'SAM'
           WHEN 99273
             THEN 'SAMO'
           WHEN 99274
             THEN 'PWG/PA'
           ELSE NULL END AS TBStatus
    FROM (
           SELECT
             obs.person_id,
             MAX(obs_datetime) AS firstDate,
             value_coded
           FROM obs
           WHERE concept_id = 68 AND value_coded IN (99271, 99272, 99273, 99274) AND voided = 0
                 AND person_id = Patient_ID AND obs_datetime BETWEEN start_date AND end_date
           GROUP BY person_id
         ) NutritionalOptions
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getPatientIdentifierTxt`(`personid` INTEGER)
  RETURNS CHAR(15)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT identifier
            FROM patient_identifier
            WHERE voided = 0
                  AND personid = patient_id
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getReferralText`(`personid` INTEGER)
  RETURNS CHAR(30)
  CHARSET latin1
READS SQL DATA
  BEGIN
    RETURN (
      SELECT if(concept_id = 99054 AND value_coded = 99053, "Therapeutic Feeding",
                if(concept_id = 99054 AND value_coded = 99051, "Infant Feeding Counselling",
                   if(concept_id = 99054 AND value_coded = 99052, "Nutrition Counselling",
                      if(concept_id = 99054 AND value_coded = 99050, "Food Support",
                         if(concept_id = 99267 AND value_text IS NOT NULL, "Other", ""))))) refer
      FROM obs
      WHERE concept_id IN (99054, 99267)
            AND obs_datetime = getLastEncounterDate(personid)
            AND personid = person_id
            AND voided = 0);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getReturnDate`(`encounterid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime AS return_date
            FROM obs
            WHERE concept_id = 5096
                  AND voided = 0
                  AND encounterid = encounter_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getReturnDate2`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime AS return_date
            FROM obs
            WHERE concept_id = 5096
                  AND voided = 0
                  AND personid = person_id
                  AND obsdatetime = obs_datetime
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_scheduled_visits`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                                   Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT IF(NumberOfVisitsScheduledInPeriod = 0, 'NO SCHEDULED VISIT', NULL) AS Scheduled_Visits_Status
    FROM (
           SELECT COUNT(obs_id) AS NumberOfVisitsScheduledInPeriod
           FROM obs
           WHERE value_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
                 AND patient_id = Patient_ID AND concept_id = 5096 AND Voided = 0
         ) Visits

  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_seen_status`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                              Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT IF(NumberOfTimesSeenInPeriod > 0, 'SEEN', NULL) AS SEENStatus
    FROM (
           SELECT COUNT(encounter_id) AS NumberOfTimesSeenInPeriod
           FROM encounter
           WHERE encounter_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
                 AND form_id = 31
                 AND patient_id = Patient_ID

         ) RecentSEENStatus

  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getStartEncounterId`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN
    RETURN (SELECT encounter_id
            FROM obs
            WHERE concept_id = 1255 AND value_coded IN (1256, 1585)
                  AND person_id = personid
                  AND voided = 0
            ORDER BY obs_datetime DESC
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSubstituteDate`(`obsgroupid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (
      SELECT value_datetime
      FROM
        obs
      WHERE concept_id = 99163
            AND voided = 0
            AND obsgroupid = obs_group_id
      LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSubstituteObsGroupId`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT obs_group_id
      FROM obs
      WHERE concept_id = 99163 AND voided = 0
            AND personid = person_id
      ORDER BY value_datetime ASC
      LIMIT 0, 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSubstituteObsGroupId2`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT obs_group_id
      FROM obs
      WHERE concept_id = 99163 AND voided = 0
            AND personid = person_id
      ORDER BY value_datetime ASC
      LIMIT 1, 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSubstituteReasonTxt`(`obsgroupid` INTEGER)
  RETURNS CHAR(15)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (
      SELECT if(value_coded = 90040, "Toxi",
                if(value_coded = 90041, "Preg",
                   if(value_coded = 90042, "RiskPreg",
                      if(value_coded = 90043, "NewTb",
                         if(value_coded = 90044, "NewDrug",
                            if(value_coded = 90045, "DrugStock",
                               if(value_coded = 90002, "Other",
                                  if(value_coded = 90046, "Clinical",
                                     if(value_coded = 90047, "Immo", ''))))))))) reason
      FROM
        obs
      WHERE concept_id = 90246
            AND voided = 0
            AND obsgroupid = obs_group_id
      LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSwitchDate`(`obsgroupid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (
      SELECT value_datetime
      FROM
        obs
      WHERE concept_id = 99164
            AND voided = 0
            AND obsgroupid = obs_group_id
      LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSwitchObsGroupId`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT obs_group_id
      FROM obs
      WHERE concept_id = 99164 AND voided = 0
            AND personid = person_id
      ORDER BY value_datetime ASC
      LIMIT 0, 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSwitchObsGroupId2`(`personid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT obs_group_id
      FROM obs
      WHERE concept_id = 99164 AND voided = 0
            AND personid = person_id
      ORDER BY value_datetime ASC
      LIMIT 1, 2
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getSwitchReasonTxt`(`obsgroupid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT if(value_coded = 90040, 1,
                if(value_coded = 90041, 2,
                   if(value_coded = 90042, 3,
                      if(value_coded = 90043, 4,
                         if(value_coded = 90044, 5,
                            if(value_coded = 90045, 6,
                               if(value_coded = 90002, 7,
                                  if(value_coded = 90046, 8,
                                     if(value_coded = 90047, 9, NULL))))))))) reason
      FROM
        obs
      WHERE concept_id = 90247
            AND voided = 0
            AND obsgroupid = obs_group_id
      LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getTbRegNoTxt`(`personid` INTEGER)
  RETURNS CHAR(15)
  CHARSET utf8
READS SQL DATA
  BEGIN


    RETURN (
      SELECT min(value_text) tb_reg
      FROM obs
      WHERE concept_id = 99031 AND voided = 0
            AND personid = person_id
      LIMIT 1);

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getTbStartDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT min(value_datetime) AS start
            FROM obs
            WHERE concept_id = 90217 AND voided = 0 AND personid = person_id
            GROUP BY person_id);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_tb_status`(StartDate VARCHAR(12), EndDate VARCHAR(12), Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT CASE value_coded
           WHEN 90079
             THEN 1
           WHEN 90073
             THEN 2
           WHEN 90217
             THEN 3
           ELSE NULL END AS TBStatus
    FROM (
           SELECT
             obs.person_id,
             MAX(obs_datetime) AS firstDate,
             value_coded
           FROM obs
           WHERE concept_id = 90216 AND value_coded IN (90079, 90073, 90217) AND voided = 0
                 AND person_id = Patient_ID AND
                 obs_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
           GROUP BY person_id
         ) TBOptions
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getTbStatusTxt`(`encounterid` INTEGER)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(value_coded = 90079, 1,
                      if(value_coded = 90073, 2,
                         if(value_coded = 90071, 3, NULL))) AS tb_status
            FROM obs
            WHERE concept_id = 90216 AND voided = 0
                  AND encounterid = encounter_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getTbStopDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT min(value_datetime) AS stop
            FROM obs
            WHERE concept_id = 90310
                  AND voided = 0
                  AND personid = person_id
            GROUP BY person_id
            LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getTransferInTxt`(`personid` INTEGER)
  RETURNS CHAR(5)
  CHARSET latin1
READS SQL DATA
  BEGIN


    RETURN (SELECT if(concept_id = 99055 AND value_coded = 1065, "TI",
                      if(concept_id = 99110 AND value_numeric = 1, "TI",
                         if(concept_id = 90206 AND value_text IS NOT NULL, "TI",
                            if(concept_id = 99109 AND value_text IS NOT NULL, "TI", '')))) AS transfer_in
            FROM obs
            WHERE concept_id IN (99055, 99110, 99109, 90206)
                  AND voided = 0
                  AND personid = person_id
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getTransferOutDate`(`personid` INTEGER)
  RETURNS DATE
READS SQL DATA
  BEGIN


    RETURN (SELECT value_datetime AS tout_date
            FROM obs
            WHERE concept_id = 99165 AND voided = 0
                  AND
                  personid = person_id
            ORDER BY value_datetime DESC
            LIMIT 1
    );

  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `get_transfer_status`(StartDate  VARCHAR(12), EndDate VARCHAR(12),
                                                                  Patient_ID INT)
  RETURNS CHAR(50)
  CHARSET latin1
DETERMINISTIC
  RETURN
  (
    SELECT CONCAT(A.TransferStatus, ' ', B.TransferStatus) AS TransferStatus
    FROM (
           SELECT
             person_Id,
             max(obs_datetime) TransferDate,
             'TO: ' AS         TransferStatus
           FROM obs
           WHERE obs_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
                 AND concept_id = 90306 AND value_numeric = 1 AND person_Id = Patient_ID AND voided = 0
           GROUP BY person_Id
         ) A LEFT JOIN
      (
        SELECT
          person_Id,
          max(obs_datetime) TransferDate,
          value_text AS     TransferStatus
        FROM obs
        WHERE obs_datetime BETWEEN str_to_date(StartDate, "%d/%m/%Y") AND str_to_date(EndDate, "%d/%m/%Y")
              AND concept_id = 90211 AND person_Id = Patient_ID AND voided = 0
        GROUP BY person_Id
      ) B ON A.person_Id = B.person_Id
  )$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getWeightValue`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (
      SELECT value_numeric
      FROM obs
      WHERE concept_id = 90236
            AND personid = person_id
            AND obsdatetime = obs_datetime
            AND voided = 0
      LIMIT 1);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getWhoStageBaseTxt`(`personid` INTEGER, `artstartdt` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(concept_id = 99070 AND value_coded = 1204, 1,
                      if(concept_id = 99070 AND value_coded = 1205, 2,
                         if(concept_id = 99070 AND value_coded = 1206, 3,
                            if(concept_id = 99070 AND value_coded = 1207, 4,
                               if(concept_id = 90203 AND value_coded = 90033 AND obs_datetime = artstartdt OR
                                  concept_id = 90203 AND value_coded = 90293 AND obs_datetime = artstartdt, 1,
                                  if(concept_id = 90203 AND value_coded = 90034 AND obs_datetime = artstartdt OR
                                     concept_id = 90203 AND value_coded = 90294 AND obs_datetime = artstartdt, 2,
                                     if(concept_id = 90203 AND value_coded = 90035 AND obs_datetime = artstartdt OR
                                        concept_id = 90203 AND value_coded = 90295 AND obs_datetime = artstartdt, 3,
                                        if(concept_id = 90203 AND value_coded = 90036 AND obs_datetime = artstartdt OR
                                           concept_id = 90203 AND value_coded = 90296 AND obs_datetime = artstartdt, 4,
                                           NULL)))))))) AS stage
            FROM obs
            WHERE concept_id IN (90203, 99070)
                  AND personid = person_id
                  AND voided = 0
            HAVING stage IS NOT NULL
            LIMIT 1
    );
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getWHOStageDate`(patient_id INT, stage INT)
  RETURNS DATE
  BEGIN
    RETURN (SELECT MAX(obs_datetime)
            FROM obs
            WHERE concept_id = 90203 AND
                  (obs_datetime < getArtBaseTransferDate(patient_id) OR getArtBaseTransferDate(patient_id) IS NULL) AND
                  person_id = patient_id AND value_coded = if(stage = 1, 90033, if(stage = 2, 90034,
                                                                                   if(stage = 3, 90035,
                                                                                      if(stage = 4, 90036, NULL)))) AND
                  concept_id IS NOT NULL);
  END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `getWhoStageTxt`(`personid` INTEGER, `obsdatetime` DATE)
  RETURNS INT(11)
READS SQL DATA
  BEGIN


    RETURN (SELECT if(concept_id = 90203 AND value_coded = 90033 OR concept_id = 90203 AND value_coded = 90293, 1,
                      if(concept_id = 90203 AND value_coded = 90034 OR concept_id = 90203 AND value_coded = 90294, 2,
                         if(concept_id = 90203 AND value_coded = 90035 OR concept_id = 90203 AND value_coded = 90295, 3,
                            if(concept_id = 90203 AND value_coded = 90036 OR concept_id = 90203 AND value_coded = 90296,
                               4, NULL)))) AS stage
            FROM obs
            WHERE concept_id = 90203
                  AND personid = person_id
                  AND obsdatetime = obs_datetime
                  AND voided = 0
            HAVING stage IS NOT NULL
            LIMIT 1
    );
  END$$
DELIMITER ;

