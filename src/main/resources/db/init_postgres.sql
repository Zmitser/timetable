DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS student_groups CASCADE;
DROP TABLE IF EXISTS timetables CASCADE;
DROP TABLE IF EXISTS teachers CASCADE;
DROP TABLE IF EXISTS teacher_subject CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS progress CASCADE;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP SEQUENCE IF EXISTS public.subjects_id_seq;
DROP SEQUENCE IF EXISTS public.student_groups_id_seq;
DROP SEQUENCE IF EXISTS public.timetables_id_seq;
DROP SEQUENCE IF EXISTS public.teachers_id_seq;
DROP SEQUENCE IF EXISTS public.teacher_subject__id_seq;
DROP SEQUENCE IF EXISTS public.students_id_seq;
DROP SEQUENCE IF EXISTS public.progress_id_seq;


CREATE SEQUENCE public.users_id_seq;

CREATE TABLE public.users (
  id INTEGER NOT NULL DEFAULT nextval('public.users_id_seq'),
  password VARCHAR NOT NULL,
  email    VARCHAR NOT NULL,
  role     VARCHAR NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
CREATE SEQUENCE public.subjects_id_seq;
CREATE TABLE public.subjects (
  id INTEGER NOT NULL DEFAULT nextval('public.subjects_id_seq'),
  name       VARCHAR NOT NULL,
  CONSTRAINT subject_id PRIMARY KEY (id)
);


ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;

CREATE SEQUENCE public.student_groups_id_seq;

CREATE TABLE public.student_groups (
  id INTEGER NOT NULL DEFAULT nextval('public.student_groups_id_seq'),
  name     VARCHAR NOT NULL,
  CONSTRAINT student_groups_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.student_groups_id_seq OWNED BY public.student_groups.id;

CREATE SEQUENCE public.timetables_id_seq;

CREATE TABLE public.timetables (
  id INTEGER   NOT NULL DEFAULT nextval('public.timetables_id_seq'),
  group_id     INTEGER   NOT NULL,
  start_time   TIMESTAMP NOT NULL,
  subject_id   INTEGER   NOT NULL,
  end_time     TIMESTAMP NOT NULL,
  CONSTRAINT timetables_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.timetables_id_seq OWNED BY public.timetables.id;

CREATE SEQUENCE public.teachers_id_seq;

CREATE TABLE public.teachers (
  id INTEGER NOT NULL DEFAULT nextval('public.teachers_id_seq'),
  email      VARCHAR NOT NULL,
  name       VARCHAR NOT NULL,
  phone      VARCHAR NOT NULL,
  skype      VARCHAR NOT NULL,
  descr      VARCHAR NOT NULL,
  photo      VARCHAR NOT NULL,
  CONSTRAINT teachers_pk PRIMARY KEY (id)
);
CREATE UNIQUE INDEX teachers_unique_email_idx ON users (email);

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;

CREATE SEQUENCE public.teacher_subject_id_seq;

CREATE TABLE public.teacher_subject (
  id INTEGER NOT NULL DEFAULT nextval('public.teacher_subject_id_seq'),
  teacher_id         INTEGER NOT NULL,
  subject_id          INTEGER NOT NULL,
  CONSTRAINT subject_teacher_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.teacher_subject_id_seq OWNED BY public.teacher_subject.id;

CREATE SEQUENCE public.students_id_seq;

CREATE TABLE public.students (
  id INTEGER NOT NULL DEFAULT nextval('public.students_id_seq'),
  descr      VARCHAR NOT NULL,
  phone      VARCHAR NOT NULL,
  photo      VARCHAR NOT NULL,
  email      VARCHAR NOT NULL,
  name       VARCHAR NOT NULL,
  skype      VARCHAR NOT NULL,
  group_id   INTEGER NOT NULL,
  CONSTRAINT students_pk PRIMARY KEY (id)
);
CREATE UNIQUE INDEX students_unique_email_idx ON users (email);

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;

CREATE SEQUENCE public.progress_id_seq;

CREATE TABLE public.progress (
  id INTEGER   NOT NULL DEFAULT nextval('public.progress_id_seq'),
  subject_id  INTEGER   NOT NULL,
  student_id  INTEGER   NOT NULL,
  score       INTEGER   NOT NULL,
  date        TIMESTAMP NOT NULL,
  CONSTRAINT progress_pk PRIMARY KEY (id)
);
ALTER SEQUENCE public.progress_id_seq OWNED BY public.progress.id;
