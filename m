Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B931A3F19
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 22:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0FF6E128;
	Fri, 30 Aug 2019 20:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8E86E128
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 20:43:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 13:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; d="scan'208";a="172345243"
Received: from anusha.jf.intel.com ([10.54.75.176])
 by orsmga007.jf.intel.com with ESMTP; 30 Aug 2019 13:43:19 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Date: Fri, 30 Aug 2019 13:32:51 -0700
Message-Id: <20190830203251.3050-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBuZXcgQ01MIFBDSSBJRFMuCgpBbGlnbiB3aXRoIGtlcm5lbCBjb21taXQ6CmJmYzRj
MzU5YjI4MjIgKCJkcm0vaTkxNS9jbWw6IEFkZCBNaXNzaW5nIFBDSSBJRHMiKQoKVGhpcyBpcyBp
biBzeW5jIHdpdGgga2VybmVsIGhlYWRlciBhcyBvZjoKMDc0NzU5MDI2N2U3ICgiZHJtLXRpcDog
MjAxOXktMDhtLTMwZC0xOGgtMDNtLTE4cyBVVEMgaW50ZWdyYXRpb24gbWFuaWZlc3QiKQoKQ2M6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5jb20+Ci0tLQogaW50
ZWwvaTkxNV9wY2lpZHMuaCB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbnRlbC9pOTE1X3BjaWlkcy5oIGIvaW50
ZWwvaTkxNV9wY2lpZHMuaAppbmRleCBhNzBjOTgyZC4uYjFmNjZiMTEgMTAwNjQ0Ci0tLSBhL2lu
dGVsL2k5MTVfcGNpaWRzLmgKKysrIGIvaW50ZWwvaTkxNV9wY2lpZHMuaApAQCAtNDY2LDcgKzQ2
NiwxMCBAQAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg5QkM1LCBpbmZvKSwgXAogCUlOVEVMX1ZHQV9E
RVZJQ0UoMHg5QkM4LCBpbmZvKSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg5QkM0LCBpbmZvKSwg
XAotCUlOVEVMX1ZHQV9ERVZJQ0UoMHg5QkMyLCBpbmZvKQorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg5
QkMyLCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg5QkM2LCBpbmZvKSwgXAorCUlOVEVM
X1ZHQV9ERVZJQ0UoMHg5QkU2LCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg5QkY2LCBp
bmZvKQogCiAjZGVmaW5lIElOVEVMX0tCTF9JRFMoaW5mbykgXAogCUlOVEVMX0tCTF9HVDFfSURT
KGluZm8pLCBcCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
