Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4FC48A0B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 19:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE14589268;
	Mon, 17 Jun 2019 17:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10989268
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 17:26:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 10:26:08 -0700
X-ExtLoop1: 1
Received: from cataylo2-ubuntu18-10.jf.intel.com (HELO [10.7.199.54])
 ([10.7.199.54])
 by orsmga002.jf.intel.com with ESMTP; 17 Jun 2019 10:26:08 -0700
Subject: Re: [PATCH libdrm] intel/i915_pciids: Add missing device ID for ICL
To: Mika Kahola <mika.kahola@intel.com>, dri-devel@lists.freedesktop.org
References: <20190617083438.32015-1-mika.kahola@intel.com>
From: Clinton Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <8af0f8d0-b678-ae00-3b4a-832d0dd6b883@intel.com>
Date: Mon, 17 Jun 2019 09:26:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617083438.32015-1-mika.kahola@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IENsaW50IFRheWxvciA8Q2xpbnRvbi5BLlRheWxvckBpbnRlbC5jb20+Cgot
Q2xpbnQKCgpPbiA2LzE3LzE5IDE6MzQgQU0sIE1pa2EgS2Fob2xhIHdyb3RlOgo+IFdlIGFyZSBt
aXNzaW5nIFBDSSBkZXZpY2UgSUQgZm9yIFNLVSBJQ0xMUCBVIEdUIDEuNUYgKDB4OEE1NCkgYXMg
cGVyIEJTUGVjLgo+Cj4gQlNwZWM6IDE5MDkyCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9s
YSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgo+IC0tLQo+ICAgaW50ZWwvaTkxNV9wY2lpZHMuaCB8
IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvaW50ZWwvaTkxNV9wY2lpZHMuaCBiL2ludGVsL2k5MTVfcGNpaWRz
LmgKPiBpbmRleCBjN2NkYmZjNC4uMGFkY2UzMzUgMTAwNjQ0Cj4gLS0tIGEvaW50ZWwvaTkxNV9w
Y2lpZHMuaAo+ICsrKyBiL2ludGVsL2k5MTVfcGNpaWRzLmgKPiBAQCAtNDk2LDcgKzQ5Niw4IEBA
Cj4gICAJSU5URUxfVkdBX0RFVklDRSgweDhBNTYsIGluZm8pLCBcCj4gICAJSU5URUxfVkdBX0RF
VklDRSgweDhBNzEsIGluZm8pLCBcCj4gICAJSU5URUxfVkdBX0RFVklDRSgweDhBNzAsIGluZm8p
LCBcCj4gLQlJTlRFTF9WR0FfREVWSUNFKDB4OEE1MywgaW5mbykKPiArCUlOVEVMX1ZHQV9ERVZJ
Q0UoMHg4QTUzLCBpbmZvKSwgXAo+ICsJSU5URUxfVkdBX0RFVklDRSgweDhBNTQsIGluZm8pCj4g
ICAKPiAgIC8qIEVITCAqLwo+ICAgI2RlZmluZSBJTlRFTF9FSExfSURTKGluZm8pIFwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
