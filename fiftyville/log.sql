-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT * FROM crime_scene_reports
WHERE street = 'Humphrey Street';
--bakery--

SELECT * FROM interviews
WHERE transcript LIKE '%bakery%';
--whitness 1--
SELECT * FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND minute BETWEEN 15 AND 15;

--check--
SELECT p.name bsl.activity, bsl.license_plate, bsl.year, bsl.month, bslday, bsl.hour, bsl.minute
FROM bakery_security_logs bsl
JOIN people p ON p.license_plate = bsl.license_plate
WHERE bsl.year = 2021 AND bsl.month = 7 AND bsl.day = 28 AND bsl.hour = 10 AND bsl.minute BETWEEN 15 AND 15;

--check 2 --
SELECT * FROM atm_transactions
WHERE atm_location = 'Leggett Street'
AND year = 2021 AND month = 7 AND day = 28;

--add name
SELECT a.*, p.name
FROM atm_transactions a
JOIN bank_acconts b ON a.account_number = b.account_number
JOIN people p ON b.person_id = p.id
WHERE a.atm_location = 'Leggett Street' AND a.year = 2021 AND a.month = 7 AND a.day = 28 AND a.transaction_type = 'withdraw';

--3 phone--
SELECT *
FROM phone_calls
WHERE year = 2021 AND month = 7  AND duration < 60;

--ADD names--
SELECT p.name, pc.caller, pc.receiver, pc.year, pc.month, pc.day, pc.duration
FROM phone_calls pc
JOIN people p ON pc.caller = p.phone_number
WHERE pc.year = 2011 AND pc.month = 7 pc.day = 28 AND pc.duration < 60;

--explore airport--
SELECT * FROM airports;

--found fiftyville id--
SELECT f.*, origin.full_name AS origin_airport, destination.full_name AS destinatio_airport
FROM flights f
JOIN airports origin ON f.origin_airport_id = origin.id
JOIN airports destination ON f.destination_airport_id = destinatio.id
WHERE origin.id = 8 AND f.year = 2021 AND f.month = 7 AND f.day = 29
ORDER BY f.hour, f.minutes

--combine--
SELECT p.name
FROM bakery_security_logs bsl
JOIN people p ON p.licence_plate = bsl.license_plate
JOIN bank_acconts ba ON ba.person_id = p.id
JOIN atm_transaction at ON at.accont_number = ba.accont_number
JOIN phone_calls pc ON pc.caller = p.phone_number
WHERE bsl.year = 2021 AND bsl.month  = 7 AND bsl.day = 28 AND bsl.hour = 10 AND bsl.minute BETWEEN 15 and 15
AND pcat.atm_location = 'Legget Street' AND at.year = 2021 AND at.month = 7 AND at.day = 28 AND at.transaction_type
AND pq.year = 2021 AND pc.month = 7 AND pc.day = 28 AND pc.duration < 60;

--NArrow--
SELECT p.name
FROM people p
JOIN passengers ps ON p.passport_number = ps.passport_number
WHERE ps.fligth_id 36
AND p.name IN('Bruce','Diana');

--Bruce call--
SELECT p2.name AS receiver
FROM phone_calls pc
JOIN people p1 ON pc.caller = p1_number
JOIN people p2 ON pc.caller = p2_number
WHERE p1.name = 'Bruce' AND pc.year = 2021 AND pc.month = 7  AND pc.day = 28 AND pc.duration < 60;