import { z } from 'zod';

// =================== ENUMS ===================

export const OrderStatusEnum = z.enum([
  'draft', 'offer_req', 'offer_req_without_pay', 'claimable', 'claimed',
  'offer_sent', 'counter_offer_received', 'offer_rejected', 'awaiting_pay',
  'parting_requested', 'partially_pay', 'paid', 'in_progress', 'action_req',
  'prod_ready', 'delivered', 'disputed', 'redo_progress', 'refunded',
  'completed', 'archived_abandoned', 'offer_restored', 'paused_insufficient_funds'
]);
export type OrderStatus = z.infer<typeof OrderStatusEnum>;

export const WalletTypesEnum = z.enum([
  'user_wallet', 'escrow_pool', 'cca_pending', 'cca_available',
  'platform_rev', 'payout_stripe'
]);
export type WalletTypes = z.infer<typeof WalletTypesEnum>;

export const TransactionStatusEnum = z.enum([
  'HELD', 'PENDING', 'CLEARED', 'PAID', 'VOID'
]);
export type TransactionStatus = z.infer<typeof TransactionStatusEnum>;

export const UserRoleEnum = z.enum([
  'user', 'cca', 'partner', 'admin'
]);
export type UserRole = z.infer<typeof UserRoleEnum>;

export const LogisticsStatusEnum = z.enum([
  'awaiting_shipment', 'in_transit_inbound', 'physical_received',
  'processing_digital', 'in_transit_outbound', 'items_returned'
]);
export type LogisticsStatus = z.infer<typeof LogisticsStatusEnum>;


// =================== SCHEMAS ===================

export const UserSchema = z.object({
  id: z.string().uuid(),
  role: UserRoleEnum.default('user'),
  credit_balance: z.number().default(0),
  preservation_score: z.number().default(0),
  quality_streak_count: z.number().default(0),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type User = z.infer<typeof UserSchema>;

export const PartnerSchema = z.object({
  id: z.string().uuid(),
  user_id: z.string().uuid(),
  company_name: z.string(),
  contact_info: z.record(z.unknown()).nullable().optional(),
  tier: z.string().nullable().optional(),
  is_verified: z.boolean().default(false),
  royalty_rate: z.number().default(0),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type Partner = z.infer<typeof PartnerSchema>;

export const ProductSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
  description: z.string().nullable().optional(),
  product_type: z.string().nullable().optional(),
  base_price_cents: z.number().default(0),
  is_offer_based: z.boolean().default(false),
  active: z.boolean().default(true),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type Product = z.infer<typeof ProductSchema>;

export const CollectionTemplateSchema = z.object({
  id: z.string().uuid(),
  name: z.string(),
  dependency_graph: z.record(z.unknown()),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type CollectionTemplate = z.infer<typeof CollectionTemplateSchema>;

export const PromptListSchema = z.object({
  id: z.string().uuid(),
  category: z.string(),
  name: z.string(),
  description: z.string().nullable().optional(),
  hidden_prompt_payload: z.record(z.unknown()).nullable().optional(),
  is_active: z.boolean().default(true),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type PromptList = z.infer<typeof PromptListSchema>;

export const AssetDNASchema = z.object({
  id: z.string().uuid(),
  user_id: z.string().uuid(),
  character_name: z.string().nullable().optional(),
  dna_payload: z.record(z.unknown()),
  reference_files: z.record(z.unknown()).nullable().optional(),
  origin_order_id: z.string().uuid().nullable().optional(),
  status: z.string().default('active'),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type AssetDNA = z.infer<typeof AssetDNASchema>;

export const OrderSchema = z.object({
  id: z.string().uuid(),
  user_id: z.string().uuid(),
  product_id: z.string().uuid(),
  cca_id: z.string().uuid().nullable().optional(),
  parent_order_id: z.string().uuid().nullable().optional(),
  step_sequence: z.number().nullable().optional(),
  status: OrderStatusEnum.default('draft'),
  input_data: z.record(z.unknown()).nullable().optional(),
  asset_dna_id: z.string().uuid().nullable().optional(),
  total_cost_cents: z.number().nullable().optional(),
  amount_paid_cents: z.number().default(0),
  fifo_realized_revenue_cents: z.number().nullable().optional(),
  vat_cents: z.number().nullable().optional(),
  stripe_fee_cents: z.number().nullable().optional(),
  cca_payout_cents: z.number().nullable().optional(),
  partner_royalty_cents: z.number().nullable().optional(),
  upsell_origin_partner_id: z.string().uuid().nullable().optional(),
  review_period_ends_at: z.coerce.date().nullable().optional(),
  is_restored: z.boolean().default(false),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type Order = z.infer<typeof OrderSchema>;

export const SmartLedgerSchema = z.object({
  transaction_id: z.string().uuid(),
  order_id: z.string().uuid(),
  source_wallet: WalletTypesEnum,
  dest_wallet: WalletTypesEnum,
  amount: z.number(),
  currency: z.string(),
  status: TransactionStatusEnum.default('PENDING'),
  trigger_event: z.string().nullable().optional(),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type SmartLedger = z.infer<typeof SmartLedgerSchema>;

export const PhysicalLogisticsSchema = z.object({
  id: z.string().uuid(),
  order_id: z.string().uuid(),
  partner_id: z.string().uuid(),
  tracking_code: z.string().nullable().optional(),
  status: LogisticsStatusEnum.default('awaiting_shipment'),
  created_at: z.coerce.date(),
  updated_at: z.coerce.date()
});
export type PhysicalLogistics = z.infer<typeof PhysicalLogisticsSchema>;
