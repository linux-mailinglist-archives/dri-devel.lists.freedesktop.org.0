Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9E218EEB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 19:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CBB6E591;
	Wed,  8 Jul 2020 17:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047F6E591
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:48:21 +0000 (UTC)
IronPort-SDR: PsxWMm2ZcKt4e+DCbXIHHZPVxyk1RTO978JOLfVcK4SpYgvt6YBjMPmPmlDih8I2g5l5PCNgMk
 yVi5YhuukD0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="145973019"
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="145973019"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 10:44:52 -0700
IronPort-SDR: uPB0YhA7LcEx5IHrgX2ow0OsKvHIPaM4rFI3w3LMssUKJgO2p20PmCFKO0XUu0gA92UPLt6tQs
 W3jLnxTdNY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,328,1589266800"; d="scan'208";a="283869843"
Received: from yota-mobl2.gar.corp.intel.com (HELO
 josouza-MOBL2.amr.corp.intel.com) ([10.251.141.141])
 by orsmga006.jf.intel.com with ESMTP; 08 Jul 2020 10:44:52 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] intel: sync i915_pciids.h with kernel
Date: Wed,  8 Jul 2020 10:46:32 -0700
Message-Id: <20200708174632.26487-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHdvIG5ldyBwYXRjaGVzIGxhbmRlZCBpbiBrZXJuZWwgYWRkaW5nIG5ldyBQQ0kgaWRzOgoxMjNm
NjJkZTQxOWYgKCJkcm0vaTkxNS9ya2w6IEFkZCBSS0wgcGxhdGZvcm0gaW5mbyBhbmQgUENJIGlk
cyIpCjUyNzk3YThlODUyOSAoImRybS9pOTE1L2VobDogQWRkIG5ldyBQQ0kgaWRzIikKCkNjOiBN
YXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBpbnRlbC9pOTE1
X3BjaWlkcy5oIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9pbnRlbC9pOTE1X3BjaWlkcy5oIGIvaW50ZWwvaTkxNV9wY2lp
ZHMuaAppbmRleCA2NjJkODM1MS4uZDZjYjI4OTkgMTAwNjQ0Ci0tLSBhL2ludGVsL2k5MTVfcGNp
aWRzLmgKKysrIGIvaW50ZWwvaTkxNV9wY2lpZHMuaApAQCAtNTg4LDcgKzU4OCwxMSBAQAogCUlO
VEVMX1ZHQV9ERVZJQ0UoMHg0NTUxLCBpbmZvKSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0NTQx
LCBpbmZvKSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0RTcxLCBpbmZvKSwgXAorCUlOVEVMX1ZH
QV9ERVZJQ0UoMHg0NTU3LCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0NTU1LCBpbmZv
KSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0RTYxLCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJ
Q0UoMHg0RTU3LCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0RTU1LCBpbmZvKSwgXAog
CUlOVEVMX1ZHQV9ERVZJQ0UoMHg0RTUxLCBpbmZvKQogCiAvKiBUR0wgKi8KQEAgLTYwNSw0ICs2
MDksMTMgQEAKIAlJTlRFTF9WR0FfREVWSUNFKDB4OUFEOSwgaW5mbyksIFwKIAlJTlRFTF9WR0Ff
REVWSUNFKDB4OUFGOCwgaW5mbykKIAorLyogUktMICovCisjZGVmaW5lIElOVEVMX1JLTF9JRFMo
aW5mbykgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0QzgwLCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9E
RVZJQ0UoMHg0QzhBLCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0QzhCLCBpbmZvKSwg
XAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0QzhDLCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0Uo
MHg0QzkwLCBpbmZvKSwgXAorCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0QzlBLCBpbmZvKQorCiAjZW5k
aWYgLyogX0k5MTVfUENJSURTX0ggKi8KLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
