;; Title: GiveStack - Transparent Philanthropy Network
;;
;; Summary: Next-generation decentralized platform engineered for Bitcoin-native
;; charitable ecosystems, featuring cryptographic proof of impact, autonomous
;; fund governance, and zero-trust donation verification protocols.
;;
;; Description: GiveStack transforms philanthropic engagement through Bitcoin's
;; proof-of-work security model, delivering unprecedented transparency in social
;; impact measurement. The platform implements cryptographic milestone verification,
;; decentralized beneficiary authentication, and immutable impact ledgers while
;; maintaining full Stacks Layer 2 compatibility for scalable micro-donations
;; and institutional-grade reporting capabilities.

;; CONTRACT GOVERNANCE & OWNERSHIP

(define-data-var contract-owner principal tx-sender)

;; ERROR CONSTANTS

(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; ROLE DEFINITIONS - HIERARCHICAL ACCESS CONTROL

(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; DATA STRUCTURES & STORAGE MAPS

;; Role mapping for hierarchical access control
(define-map roles
  { user: principal }
  { role: uint }
)

;; Comprehensive beneficiary registry with funding metrics
(define-map beneficiaries
  { id: uint }
  {
    name: (string-utf8 50),
    description: (string-utf8 255),
    target-amount: uint,
    received-amount: uint,
    status: (string-ascii 20),
  }
)

;; Immutable donation ledger with complete audit trail
(define-map donations
  { id: uint }
  {
    donor: principal,
    beneficiary-id: uint,
    amount: uint,
    timestamp: uint,
  }
)

;; Milestone-based fund utilization tracking system
(define-map utilization
  { id: uint }
  {
    beneficiary-id: uint,
    milestone: uint,
    description: (string-utf8 255),
    amount: uint,
    status: (string-ascii 20),
  }
)