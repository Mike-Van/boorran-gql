CREATE SCHEMA boorran;
CREATE TABLE boorran."Customers" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "firstName" text,
    "lastName" text,
    "shopifyCustomerId" text,
    email text,
    phone text
);
CREATE TABLE boorran."OrderItems" (
    "itemId" numeric,
    "itemTitle" text,
    "variantId" numeric,
    "variantTitle" text,
    quantity integer,
    discount numeric,
    "unitPrice" numeric,
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "orderId" uuid
);
CREATE TABLE boorran."Orders" (
    source text DEFAULT 'shopify'::text,
    "staffId" uuid,
    "subTotal" numeric,
    discount numeric,
    status text,
    "deliveryStatus" text,
    "paymentMethod" text,
    "deliveryPrice" numeric,
    "grandTotal" numeric,
    note text,
    "createdAt" timestamp with time zone,
    "orderAddress" text,
    "deliveryDestination" text,
    "deliverBy" text,
    "paymentReceiverId" uuid,
    "paymentReceivedDate" timestamp with time zone,
    "isCollectedByAdmin" boolean DEFAULT false,
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "itemsPrice" numeric,
    "taxPrice" numeric,
    "shopifyOrderId" text,
    "shopifyOrderNumber" text,
    "customerId" uuid,
    "boorranDeliveryPrice" numeric,
    "boorranGrandTotal" numeric
);
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
    metadata jsonb,
    photo text,
    "createdAt" timestamp with time zone DEFAULT now(),
    "activationStatus" boolean DEFAULT true
);
CREATE TABLE public."Enums" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    type text,
    text text,
    value text,
    metadata jsonb
);
ALTER TABLE ONLY boorran."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY boorran."Customers"
    ADD CONSTRAINT "Customers_shopifyCustomerId_key" UNIQUE ("shopifyCustomerId");
ALTER TABLE ONLY boorran."OrderItems"
    ADD CONSTRAINT "OrderItems_id_key" UNIQUE (id);
ALTER TABLE ONLY boorran."OrderItems"
    ADD CONSTRAINT "OrderItems_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY boorran."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY boorran."Orders"
    ADD CONSTRAINT "Orders_shopifyOrderId_key" UNIQUE ("shopifyOrderId");
ALTER TABLE ONLY public."Enums"
    ADD CONSTRAINT "Enums_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY boorran."OrderItems"
    ADD CONSTRAINT "OrderItems_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES boorran."Orders"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY boorran."Orders"
    ADD CONSTRAINT "Orders_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES boorran."Customers"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY boorran."Orders"
    ADD CONSTRAINT "Orders_paymentReceiverId_fkey" FOREIGN KEY ("paymentReceiverId") REFERENCES public."Users"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY boorran."Orders"
    ADD CONSTRAINT "Orders_staffId_fkey" FOREIGN KEY ("staffId") REFERENCES public."Users"(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
