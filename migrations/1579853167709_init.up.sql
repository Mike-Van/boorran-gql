CREATE TABLE public."Sessions" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "userId" uuid,
    "createdAt" timestamp with time zone DEFAULT now(),
    "expiredAt" timestamp with time zone,
    metadata jsonb
);
CREATE TABLE public."Users" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text,
    phone text,
    email text,
    store text,
    role text,
    pin text,
    metadata jsonb
);
CREATE TABLE public."Enums" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    type text,
    text text,
    value text,
    metadata jsonb
);
ALTER TABLE ONLY public."Enums"
    ADD CONSTRAINT "Enums_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
