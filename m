Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFAF47D23
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB348916F;
	Mon, 17 Jun 2019 08:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11A18916F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 08:32:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 01:32:20 -0700
X-ExtLoop1: 1
Received: from sorvi.fi.intel.com ([10.237.72.207])
 by orsmga004.jf.intel.com with ESMTP; 17 Jun 2019 01:32:19 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] intel/i915_pciids: Add missing device ID for ICL
Date: Mon, 17 Jun 2019 11:34:38 +0300
Message-Id: <20190617083438.32015-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Mika Kahola <mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIG1pc3NpbmcgUENJIGRldmljZSBJRCBmb3IgU0tVIElDTExQIFUgR1QgMS41RiAoMHg4
QTU0KSBhcyBwZXIgQlNQZWMuCgpCU3BlYzogMTkwOTIKClNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fo
b2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0tLQogaW50ZWwvaTkxNV9wY2lpZHMuaCB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvaW50ZWwvaTkxNV9wY2lpZHMuaCBiL2ludGVsL2k5MTVfcGNpaWRzLmgKaW5kZXgg
YzdjZGJmYzQuLjBhZGNlMzM1IDEwMDY0NAotLS0gYS9pbnRlbC9pOTE1X3BjaWlkcy5oCisrKyBi
L2ludGVsL2k5MTVfcGNpaWRzLmgKQEAgLTQ5Niw3ICs0OTYsOCBAQAogCUlOVEVMX1ZHQV9ERVZJ
Q0UoMHg4QTU2LCBpbmZvKSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg4QTcxLCBpbmZvKSwgXAog
CUlOVEVMX1ZHQV9ERVZJQ0UoMHg4QTcwLCBpbmZvKSwgXAotCUlOVEVMX1ZHQV9ERVZJQ0UoMHg4
QTUzLCBpbmZvKQorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg4QTUzLCBpbmZvKSwgXAorCUlOVEVMX1ZH
QV9ERVZJQ0UoMHg4QTU0LCBpbmZvKQogCiAvKiBFSEwgKi8KICNkZWZpbmUgSU5URUxfRUhMX0lE
UyhpbmZvKSBcCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
